-- Marshal Marris, by the bridge in Lakeshire. Voice: bibles/marris.md
-- Too many orcs, too few guards, and one name he can't stop saying: Tharil'zun.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marris", id = TODO_NPC("Marshal Marris"), name = "Marshal Marris",
  bible = "bibles/marris.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "brave", "lawful" },
  notices = { "soldier", "trophy" },

  impression = {
    first = "Marshal Marris keeps his eyes east, where the Blackrock are, and his guard stretched thin across a whole lake. He wanted numbers from me, not stories.",
    third = "{name} met Marshal Marris of Lakeshire, who holds the town against the Blackrock orcs with too few guards.",
  },

  greetings = {
    { id = "g_watch", text = "Keep your eyes east, friend; with the Blackrock it's always the east." },
    { id = "g_menace", when = { questActive = TODO_QUEST("Blackrock Menace") }, text = "Back from the valley already? Good, now tell me how many." },
    { id = "g_keeshan", when = { questDone = TODO_QUEST("Missing In Action") }, text = "You're the one who brought Keeshan home, and I won't forget it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Blackrock haven't let up for one of them. Good to have another blade back on the lake." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come on a good deal since I first sent you east. I'd count you as two guards now, and I need every one I can count." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I hear you've been putting the fear into folk in town. Save it for the orcs, because Lakeshire's frightened enough already." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The guards tell me you've been pulling your weight around Lakeshire. That's one fewer thing on my list, and I thank you for it." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 18 },
      text = "You hold that blade like someone who's stood in a shield wall. I could use ten of you, but I'll gladly take one." },
    { id = "n_lakeborn", cat = "origin", when = { origin = "human_redridge_born" },
      text = "The bailiff tells me you were born on this lake. Good, because folk from Lakeshire fight harder for it than anyone Stormwind sends me, and they don't ask how long the posting is." },
    { id = "n_trophy", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("Blackrock Menace") },
      text = "That's Blackrock work on your armor, and Blackrock blood on your sleeve. I'd call that a good trade." },
  },

  start = "hello",
  nodes = {
    xcl_lbrs = {
      big = true,
      lines = { { id = "xcl_lbrs_default", text = "Bleeding isn't beaten, and they've more warriors in that mountain than Lakeshire has people, so I'll keep my guard on the bridge all the same. Still, every orc who dies at home is one who never comes down the Burning Steppes road, and that's a thing I can put in my report." } },
      choices = {
        { text = "Hold the line here, Marshal. Lakeshire comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stop guarding bridges. Take the fight back to the mountain.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who commands the orcs inside the Spire?", next = "xcl_lbrs2" },
      },
    },
    xcl_lbrs2 = {
      lines = { { id = "xcl_lbrs2_default", text = "An overlord called Wyrmthalak, the scouts say, though he answers to Warchief Rend Blackhand above him, and Rend answers to something nobody's been able to name. I don't need names to count orcs, but I'd like to know who's counting them for the other side." } },
      choices = {
        { text = "If I learn the name, you'll have it, Marshal.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If I had the men, yes. Give me numbers, shaman. Your spirits won't win this, but they might help." } },
      choices = {
        { text = "Then count me among your numbers, Marshal.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Numbers don't win. Courage does.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Then do it, and bring me numbers, not stories, because numbers are what I'm short of. How many orcs, how many shadowcasters and where Gath'Ilzogg sleeps, and I'll do the rest with the soldiers I've got." } },
      choices = {
        { text = "And if I can reach Gath'Ilzogg, I'll finish him.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Numbers only, Marshal. I'll report straight back.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What happened at Stonewatch?", next = "stonewatch" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "One mage can hold a bridge, I'll grant you, until the mana runs dry and the orcs don't. I want you where the Blackrock least expect you, which is wherever I tell you to be." } },
      choices = {
        { text = "Put me where you need me, Marshal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hold wherever I think best.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where should I start?", next = "start" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "No, they won't, and I'll admit I'm glad of it, though I'd not say so in front of the Magistrate. Keep your creature out of the barracks and keep it pointed east." } },
      choices = {
        { text = "East it is. Let them taste their own magic.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll call on it sparingly, Marshal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Who is Tharil'zun?", next = "tharil" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Hungry or not, they burn farms and carry off livestock. If there's something pushing them, it'll be the Blackrock orcs, and that only makes it worse. Find out for me, and don't come back with a story about poor misunderstood gnolls." } },
      choices = {
        { text = "Then I'll find what drives them and end it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then they'll answer for the farms, hungry or not.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Their friends, when we can bring them home, and the hills, when we can't. I write to every family myself, and I've stopped counting the letters, because the number started keeping me awake." } },
      choices = {
        { text = "Then let me go with the next burial detail, Marshal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead can wait, Marshal. The orcs won't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Hold the walls, because I can't take a keep with the men I've got, and every guard I lose on an assault is a gate left open. But the longer we wait, the deeper the Blackrock dig in, so I need people like you to bleed them in the valley first." } },
      choices = {
        { text = "Then I'll hold the walls, as you command, Marshal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting is how keeps fall. I'll strike Stonewatch myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_lbrs", tags = { "news" }, when = { cleared = "Lower Blackrock Spire", faction = "Alliance" },
          text = "The guards tell me you've been inside Blackrock Spire itself, where the orcs that raid my lake come from. I'll believe it from you, and I'll sleep a little better tonight, which is more than I've managed in a month." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid! Hah, good. I've got gnolls in the hills and orcs on the ridge, and I'll take help from anyone with claws." },
        { id = "h_default", text = "I'm Marris, Marshal of Lakeshire, with a guard stretched across a lake and orcs who never sleep. What do you need?" },
        { id = "h_menace", when = { questBefore = TODO_QUEST("Blackrock Menace") },
          text = "The Blackrock came out of the Burning Steppes and took Stonewatch Keep. Now they raid everything north of town, and there's another nest of them in Render's Valley. I want their numbers down." },
        { id = "h_menace_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blackrock Menace"), days = 3 } },
          text = "Quieter nights this week, and my guards actually slept. One of them snored, and I've never been so glad to hear it." },
        { id = "h_keeshan", tags = { "news" }, when = { questBefore = TODO_QUEST("Missing In Action") },
          text = "Corporal Keeshan was taken when Stonewatch fell. If the scouts are right, the orcs hold him at Render's Rock, by the Steppes pass. I can't spare the men to fetch him." },
        { id = "h_keeshan_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Missing In Action"), days = 3 } },
          text = "Keeshan's sleeping it off in the barracks. He told me what you did twice over, and he never tells anything twice." },
        { id = "h_orbs", when = { questActive = TODO_QUEST("Shadow Magic") },
          text = "Their shadowcasters carry midnight orbs, and every orb has cost me a guard. Bring them here to be destroyed, and don't carry them close to your skin." },
        { id = "h_tharilzun", when = { questActive = TODO_QUEST("Tharil'zun") },
          text = "Tharil'zun runs their Outrunners, the ones ambushing the road to Stonewatch. Take friends with you, and more of them than you think you need." },
        { id = "h_tharilzun_done", tags = { "news" }, when = { questDone = TODO_QUEST("Tharil'zun") },
          text = "Without Tharil'zun the valley's just a camp full of angry orcs. Angry orcs I can handle. Organized ones were killing us." },
        { id = "h_count", when = { metBefore = true }, text = "Twelve guards on the morning roll, and twelve on the evening. On days like that I thank the Light out loud." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I've wounded in the barracks and dead in the hills, and not enough of anyone for either." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Good, because I'd take one paladin over ten levies, and so far I've only been sent the levies." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I want numbers, not stories. How many orcs can your lightning drop?" },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick; the road's quiet, and I don't trust it." },
        { id = "h_again2", text = "Go on; I'm listening with one ear, and the other's on the bridge." },
      },
      choices = {
        { text = "Your gnolls are only hungry. Something drives them down from the hills.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What happened at Stonewatch?", next = "stonewatch" },
        { text = "How bad is it?", next = "bad" },
        { text = "Who is Tharil'zun?", next = "tharil" },
        { text = "Who named that boar Bellygrub?", next = "bellygrub" },
        { text = "Keeshan's home. How is he?", next = "keeshan_after", when = { questDone = TODO_QUEST("Missing In Action") } },
        { text = "My people have fought the Blackrock for generations.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Give me a post, Marshal. I'll hold it.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I can scout Render's Valley for you.", next = "hunter", when = { class = "HUNTER" } },
        { text = "I can get into Stonewatch unseen, Marshal.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Your guard's spread thin. I can hold a line with fire.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The Blackrock shadowcasters won't be the only ones with demons.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Who buries your guards who fall in the hills, Marshal?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should Lakeshire strike Stonewatch, Marshal, or hold the walls?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can Lakeshire hold against the Blackrock, Marshal?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I went into Blackrock Spire, Marshal. The Blackrock clan is bleeding.", next = "xcl_lbrs", when = { cleared = "Lower Blackrock Spire", faction = "Alliance" } },
        { text = "I'll keep my eyes east.", next = "END" },
      },
    },

    stonewatch = {
      big = true,
      lines = {
        { id = "sw_default", text = "We held the Keep with a platoon, and they came with an army. Good soldiers died on those walls, and the rest of us fell back to the lake." },
      },
      choices = {
        { text = "Then we take it back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, align = { honor = 1 } } },
        { text = "Stonewatch is lost, so hold the lake and let it go.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "I won't risk my neck for one missing corporal.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bad = {
      lines = {
        { id = "b_default", text = "Orcs to the east, gnolls to the south, murlocs in the water, a broken bridge, and a magistrate who writes letters. Bad enough, I'd say." },
      },
      choices = {
        { text = "Where do I start?", next = "start" },
        { text = "Sounds like you need help.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    start = {
      lines = {
        { id = "st_default", text = "Start with axes. Bring me ten Blackrock axes and that's ten orcs who won't reach my bridge; then their shadowcasters, and then Tharil'zun, if you're still breathing." },
      },
      choices = {
        { text = "Put me to work, Marshal.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Why the shadowcasters?", next = "orbs" },
      },
    },
    orbs = {
      big = true,
      lines = {
        { id = "o_default", text = "Midnight orbs, demon-tainted every one. The orbs in their hands have struck my men down from across a field, and I want them out of this war." },
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
        { text = "Smash them first, and the prayers can come after.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tharil = {
      lines = {
        { id = "t_default", text = "He leads their Outrunners. He picks the ground between here and Stonewatch, hits my patrols, and he's gone before the horn sounds; he's crafty, and I hate crafty." },
        { id = "t_done", when = { questDone = TODO_QUEST("Tharil'zun") },
          text = "He led them, past tense, thanks to you. The road to Stonewatch is only dangerous now, not murderous." },
      },
      choices = {
        { text = "Where do I find him?", next = "tharil_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tharil_find = {
      lines = { { id = "tf_default", text = "Walk the road toward Stonewatch until something shoots at you, because that's his ground. Don't go alone; I've buried the ones who did." } },
      choices = {
        { text = "Then I'll hunt him.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bellygrub = {
      lines = {
        { id = "bg_default", text = "I did. It's a boar the size of a cart, eating Martie's garden down to the dirt, and naming it was easier than killing it while I'm short of guards." },
      },
      choices = {
        { text = "I'll deal with your boar.", next = "BACK", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "You named the garden's worst enemy?", next = "bellygrub_name" },
      },
    },
    bellygrub_name = {
      lines = { { id = "bn_default", text = "A town under siege needs one villain it can laugh at, and Bellygrub obliges. Martie has never forgiven me for it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    keeshan_after = {
      lines = { { id = "ka_default", text = "He's sleeping like the dead and swearing in his sleep. He'll be back on the walls before I let him, because that's Keeshan." } },
      choices = {
        { text = "He's tougher than he looks.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Then tell me what my guards don't know, since you've fought them longer. How do you beat them?" } },
      choices = {
        { text = "Kill whoever's giving the orders. They break.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "Never let them choose the ground.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Hit them harder than they hit you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "I've got three posts and one guard for each, and you'd make two of them. Take the bridge road at dusk, when the Blackrock scouts like to test us, and count every orc you put down." } },
      choices = {
        { text = "Why count them?", next = "warrior_count" },
        { text = "Done.", next = "BACK", fx = { affinity = 2, standing = { lakeshire = 1 } } },
      },
    },
    warrior_count = {
      lines = { { id = "wc_default", text = "Because Solomon writes letters and letters want numbers. Stormwind won't move for a frightened town, but it might move for a column of figures." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Good, because my guards stomp like oxen and the orcs hear them a mile off. Keep your beast quiet, watch for smoke from the camps, and don't go near Stonewatch on your own." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "That animal of yours has better ears than any guard I've got. Take it up Render's Valley and see what it smells; I'll want to know where the camps have moved." },
      },
      choices = {
        { text = "I'll go alone. I'm quieter that way.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "What should I look for?", next = "bad" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every guard on the lake reports to me, so I hear the bad news before the town does. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I'm a Marshal of the Stormwind Army, and they posted me to Lakeshire. I've stopped expecting to be posted anywhere else." } },
    advice = { { id = "tp_ad", text = "Count your arrows before you leave, and your friends when you come back." } },
    stonewatch_keep = { { id = "tp_stonewatch", text = "Our keep, flying their flag. Every morning I look at it from the bridge, and every morning it's still theirs.", next = "stonewatch" } },
    keeshan = { { id = "tp_keeshan", text = "He's my corporal: stubborn, loud, and alive, if the scouts are right. I'll take all three." } },
    blackrock = { { id = "tp_blackrock", text = "Disciplined, which is the worst thing an orc can be. Someone's teaching them." } },
    everstill_bridge = { { id = "tp_bridge", text = "Without it my guards walk the long way round the lake. Oslow knows that, and Oslow knows I know it." } },
    morganth = { { id = "tp_morganth", text = "A tower full of gnolls with something worse at the top, and I won't touch it until Render's Valley is done." } },
    _none = { { id = "tp_none", text = "Ask the magistrate; he likes questions. I like answers with a body count." } },
  },
}
