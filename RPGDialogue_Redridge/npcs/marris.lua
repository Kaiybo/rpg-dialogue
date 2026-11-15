-- Marshal Marris, by the bridge in Lakeshire. Voice: bibles/marris.md
-- Too many orcs, too few guards, and one name he can't stop saying: Tharil'zun.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marris", id = TODO_NPC("Marshal Marris"), name = "Marshal Marris",
  bible = "bibles/marris.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "brave", "lawful" },
  notices = { "soldier", "trophy" },

  greetings = {
    { id = "g_watch", text = "Eyes east. Always east." },
    { id = "g_menace", when = { questActive = TODO_QUEST("Blackrock Menace") }, text = "Back from the valley? Good. How many?" },
    { id = "g_keeshan", when = { questDone = TODO_QUEST("Missing In Action") }, text = "You brought Keeshan home. I won't forget it." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 18 },
      text = "You hold that blade like someone who's been in a shield wall. I could use ten of you. I'll take one." },
    { id = "n_trophy", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("Blackrock Menace") },
      text = "That's Blackrock work on your armor. And Blackrock blood on your sleeve. Good trade." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Marris, Marshal of Lakeshire. I've a guard stretched across a lake and orcs who don't sleep. What do you need?" },
        { id = "h_menace", when = { questBefore = TODO_QUEST("Blackrock Menace") },
          text = "The Blackrock came out of the Burning Steppes and took Stonewatch Keep. Now they raid everything north of town, and there's another nest of them in Render's Valley. I want their numbers down." },
        { id = "h_menace_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blackrock Menace"), days = 3 } },
          text = "Quieter nights this week. My guards actually slept. One of them snored. I've never been so glad to hear it." },
        { id = "h_keeshan", tags = { "news" }, when = { questBefore = TODO_QUEST("Missing In Action") },
          text = "Corporal Keeshan was taken when Stonewatch fell. If the scouts are right, the orcs hold him at Render's Rock, by the Steppes pass. I can't spare the men to fetch him." },
        { id = "h_keeshan_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Missing In Action"), days = 3 } },
          text = "Keeshan's sleeping it off in the barracks. He told me what you did. Twice. He doesn't tell anything twice." },
        { id = "h_orbs", when = { questActive = TODO_QUEST("Shadow Magic") },
          text = "Their shadowcasters carry midnight orbs, and every orb has cost me a guard. Bring them here and they'll be destroyed. Don't carry them close." },
        { id = "h_tharilzun", when = { questActive = TODO_QUEST("Tharil'zun") },
          text = "Tharil'zun runs their Outrunners, the ones ambushing the road to Stonewatch. Take friends. Take more friends than you think you need." },
        { id = "h_tharilzun_done", tags = { "news" }, when = { questDone = TODO_QUEST("Tharil'zun") },
          text = "Without Tharil'zun the valley's just a camp full of angry orcs. Angry orcs I can handle. Organized ones were killing us." },
        { id = "h_count", when = { metBefore = true }, text = "Twelve guards on the morning roll. Twelve on the evening. Days like that, I thank the Light out loud." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick; the road's quiet, and I don't trust it." },
        { id = "h_again2", text = "Go on. I'm listening with one ear. The other's on the bridge." },
      },
      choices = {
        { text = "What happened at Stonewatch?", next = "stonewatch" },
        { text = "How bad is it?", next = "bad" },
        { text = "Who is Tharil'zun?", next = "tharil" },
        { text = "Who named that boar Bellygrub?", next = "bellygrub" },
        { text = "Keeshan's home. How is he?", next = "keeshan_after", when = { questDone = TODO_QUEST("Missing In Action") } },
        { text = "My people have fought the Blackrock for generations.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I'll keep my eyes east.", next = "END" },
      },
    },

    stonewatch = {
      big = true,
      lines = {
        { id = "sw_default", text = "We held the Keep with a platoon. They came with an army. Good soldiers died on those walls. The rest of us fell back to the lake." },
      },
      choices = {
        { text = "Then we take it back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, align = { honor = 1 } } },
        { text = "You did what you could.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Who did you lose?", next = "stonewatch_lost" },
      },
    },
    stonewatch_lost = {
      lines = {
        { id = "sl_default", text = "More than I'll name standing in the street. Keeshan's on the missing list, not the dead one. Until someone shows me otherwise, that's where he stays." },
        { id = "sl_back", when = { questDone = TODO_QUEST("Missing In Action") },
          text = "Keeshan came off the missing list, thanks to you. The rest of that list hasn't moved." },
      },
      choices = {
        { text = "I'll bring him home.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bad = {
      lines = {
        { id = "b_default", text = "Orcs east, gnolls south, murlocs in the water, a broken bridge and a magistrate who writes letters. Bad enough." },
      },
      choices = {
        { text = "Where do I start?", next = "start" },
        { text = "Sounds like you need help.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    start = {
      lines = {
        { id = "st_default", text = "Axes. Bring me ten Blackrock axes and that's ten orcs who won't reach my bridge. Then their shadowcasters. Then Tharil'zun, if you're still breathing." },
      },
      choices = {
        { text = "Put me to work, Marshal.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Why the shadowcasters?", next = "orbs" },
      },
    },
    orbs = {
      big = true,
      lines = {
        { id = "o_default", text = "Midnight orbs. The orbs in their hands have struck my men down from across a field. Demon-tainted, every one. I want them out of this war." },
      },
      choices = {
        { text = "I'll bring you the orbs.", next = "BACK", fx = { affinity = 1 } },
        { text = "Smashing them may not be enough. Let me see them first.", next = "orbs_priest", when = { class = "PRIEST" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orbs_priest = {
      lines = { { id = "op_default", text = "You'd know better than a soldier. Fine: the Light first, then the hammer. My men won't touch them either way." } },
      choices = {
        { text = "The Light first. Always.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tharil = {
      lines = {
        { id = "t_default", text = "He leads their Outrunners. He picks the ground between here and Stonewatch, hits my patrols, and he's gone before the horn. Crafty. I hate crafty." },
        { id = "t_done", when = { questDone = TODO_QUEST("Tharil'zun") },
          text = "Led. Past tense, thanks to you. The road to Stonewatch is only dangerous now, not murderous." },
      },
      choices = {
        { text = "Where do I find him?", next = "tharil_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tharil_find = {
      lines = { { id = "tf_default", text = "Walk the road toward Stonewatch until something shoots at you. That's his ground. Don't go alone; I've buried the ones who did." } },
      choices = {
        { text = "Then I'll hunt him.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bellygrub = {
      lines = {
        { id = "bg_default", text = "I did. A boar the size of a cart, eating Martie's garden down to the dirt. Naming it was easier than killing it, and I'm short of guards." },
      },
      choices = {
        { text = "I'll deal with your boar.", next = "BACK", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "You named the garden's worst enemy?", next = "bellygrub_name" },
      },
    },
    bellygrub_name = {
      lines = { { id = "bn_default", text = "A town under siege needs one villain it can laugh at. Bellygrub obliges. Martie has never forgiven me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    keeshan_after = {
      lines = { { id = "ka_default", text = "Sleeping like the dead and swearing in his sleep. He'll be back on the walls before I let him. That's Keeshan." } },
      choices = {
        { text = "He's tougher than he looks.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Then tell me what my guards don't know. You've fought them longer. How do you beat them?" } },
      choices = {
        { text = "Kill whoever's giving the orders. They break.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "Never let them choose the ground.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Hit them harder than they hit you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Marshal, Stormwind Army. They posted me to Lakeshire. I've stopped expecting to be posted anywhere else." } },
    advice = { { id = "tp_ad", text = "Count your arrows before you leave, and your friends when you come back." } },
    stonewatch_keep = { { id = "tp_stonewatch", text = "Our keep, their flag. Every morning I look at it from the bridge. Every morning it's still theirs.", next = "stonewatch" } },
    keeshan = { { id = "tp_keeshan", text = "My corporal. Stubborn, loud, and alive, if the scouts are right. I'll take all three." } },
    blackrock = { { id = "tp_blackrock", text = "Disciplined, which is the worst thing an orc can be. Someone's teaching them." } },
    everstill_bridge = { { id = "tp_bridge", text = "Without it my guards walk the long way round the lake. Oslow knows. Oslow knows I know." } },
    morganth = { { id = "tp_morganth", text = "A tower full of gnolls and something worse at the top. Not until Render's Valley is done." } },
    _none = { { id = "tp_none", text = "Ask the magistrate. He likes questions. I like answers with a body count." } },
  },
}
