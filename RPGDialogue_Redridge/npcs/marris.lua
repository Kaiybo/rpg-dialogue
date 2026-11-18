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
    { id = "g_op_demons_forbid", when = { opinion = { topic = "demons", stance = "forbid" } }, text = "You again, the one who'd close the warlocks' cellar under the Slaughtered Lamb. My fourth report went off with your opinion in it; I said a sensible traveller agreed." },
    { id = "g_op_orcs_hate", when = { gossip = { topic = "orcs", stance = "hate" } }, text = "Keeshan says you've no time for any orc, Thrall's or otherwise. Good, because my walls have no time for them either, so take a post." },
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
    op_demons = {
      lines = {
        { id = "op_demons_a", text = "Sit right? There's a cellar under the Slaughtered Lamb where they teach demon-calling to anyone with the coin, and the same dark arts that fill those orbs are killing my men up on that ridge. The Keep says it's better to know the enemy's tricks. What do you say?" },
      },
      choices = {
        { text = "Demons are demons. Stormwind should shut that cellar down.", next = "op_demons_1", fx = { opinion = { demons = "forbid" }, align = { light = 1 }, trait = { pious = 1 }, affinity = 2 } },
        { text = "A weapon's a weapon. Better ours than only the orcs'.", next = "op_demons_2", fx = { opinion = { demons = "useful" }, align = { light = -1 }, trait = { practical = 1 }, affinity = -1 } },
        { text = "Train them, and watch them. Closely.", next = "op_demons_3", fx = { opinion = { demons = "dangerous" }, trait = { cautious = 1 } } },
        { text = "I command demons myself, Marshal, and I'm on your wall.", next = "op_demons_4", when = { class = "WARLOCK" }, fx = { opinion = { demons = "useful" }, affinity = -2 } },
        { text = "That's the Keep's business, not mine.", next = "BACK" },
      },
    },
    op_demons_1 = {
      lines = { { id = "op_demons_r1", text = "That's what I've written in three reports, and I'll write it in a fourth with your name under mine. The Light help any city that keeps a demon in its basement." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    op_demons_2 = {
      lines = { { id = "op_demons_r2", text = "You sound like the clerks at the Keep. Come stand on my wall at night and watch one of those orbs light up the dark, and then tell me again." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    op_demons_3 = {
      lines = { { id = "op_demons_r3", text = "Watch them with what? I can't spare a guard to watch my own bridge. Still, I'll grant that a leash is better than nothing." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    op_demons_4 = {
      lines = { { id = "op_demons_r4", text = "So you are, and I'll take the help, because I'd take a gnoll's help this month. Keep that thing behind you and away from my men, or we'll have words." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    xcl_lbrs = {
      big = true,
      lines = { { id = "xcl_lbrs_default", text = "Bleeding isn't beaten, and they've more warriors in that mountain than Lakeshire has people, so I'll keep my guard on the bridge all the same. Still, every orc who dies at home is one who never comes down the Burning Steppes road, and that's a thing I can put in my report." } },
      choices = {
        { text = "Hold the line here, Marshal. Lakeshire comes first.", next = "BACK", reply = "That's my thinking, and I'm glad to hear it from someone outside my office. The bridge holds, and so does Lakeshire.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stop guarding bridges. Take the fight back to the mountain.", next = "BACK", reply = "With what, the cook and the stable girl? Bring me two hundred soldiers and I'll take the fight to the mountain gladly.", fx = { align = { order = -1 } } },
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
      lines = { { id = "xdsham_default", text = "If I had the men, yes, so give me numbers, shaman. Your spirits won't win this alone, but they might help." } },
      choices = {
        { text = "Then count me among your numbers, Marshal.", next = "BACK", reply = "Then you're one more than I had this morning. Report to the barracks, and I'll find a place for you.", fx = { align = { order = 1 } } },
        { text = "Numbers don't win. Courage does.", next = "BACK", reply = "Courage gets men killed, shaman, and I've buried plenty of brave ones. Numbers keep the rest of us alive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Then do it, and bring me numbers, not stories, because numbers are what I'm short of. How many orcs, how many shadowcasters and where Gath'Ilzogg sleeps, and I'll do the rest with the soldiers I've got." } },
      choices = {
        { text = "And if I can reach Gath'Ilzogg, I'll finish him.", next = "BACK", reply = "If you can, then I'll not stop you, though I'd rather have the numbers first. Don't die making a point.", fx = { align = { honor = -1 } } },
        { text = "Numbers only, Marshal. I'll report straight back.", next = "BACK", reply = "Good, that's exactly what I need from you. A clear count is worth ten heroes to me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What happened at Stonewatch?", next = "stonewatch" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "One mage can hold a bridge, true enough, until the mana runs dry and the orcs don't. I want you where the Blackrock least expect you, which is wherever I tell you to be." } },
      choices = {
        { text = "Put me where you need me, Marshal.", next = "BACK", reply = "Then you'll be worth your weight in iron, mage. I'll have orders for you by morning.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hold wherever I think best.", next = "BACK", reply = "Then you'll be holding it alone, and I'll not send anyone to pull you out. Think on that before you go wandering.", fx = { align = { order = -1 } } },
        { text = "Where should I start?", next = "start" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "No, they won't, and I'll admit I'm glad of it, though I'd not say so in front of the Magistrate. Keep your creature out of the barracks and keep it pointed east." } },
      choices = {
        { text = "East it is. Let them taste their own magic.", next = "BACK", reply = "East it is, then, and let the Blackrock find out what their shadowcasters have been teaching. I'll be glad to read that report.", fx = { align = { light = -1 } } },
        { text = "I'll call on it sparingly, Marshal.", next = "BACK", reply = "Sparingly suits me fine, and I'll trust your judgment on it. Keep it out of sight of the Magistrate.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Who leads the orc raiders?", next = "tharil" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Hungry or not, they burn farms and carry off livestock. If there's something pushing them, it'll be the Blackrock orcs, and that only makes it worse. Find out for me, and don't come back with a story about poor misunderstood gnolls." } },
      choices = {
        { text = "Then I'll find what drives them and end it.", next = "BACK", reply = "Good, and don't come back with a sad tale, come back with facts. The farms need it ended.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then they'll answer for the farms, hungry or not.", next = "BACK", reply = "That's the soldier's answer, and it's the one I want. Any gnoll near a farm answers for it, whatever's pushing it.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Their friends, when we can bring them home, and the hills, when we can't. I write to every family myself, and I've stopped counting the letters, because the number started keeping me awake." } },
      choices = {
        { text = "Then let me go with the next burial detail, Marshal.", next = "BACK", reply = "You'd do that? Then I'll put you down for the next one, and I'll be grateful for the company. The lads deserve better than me alone.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead can wait, Marshal. The orcs won't.", next = "BACK", reply = "You're right, though it doesn't make the letters any easier to write. Go east, then, and keep my count down.", fx = { align = { light = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Hold the walls, because I can't take a keep with the men I've got, and every guard I lose on an assault is a gate left open. But the longer we wait, the deeper the Blackrock dig in, so I need people like you to bleed them in the valley first." } },
      choices = {
        { text = "Then I'll hold the walls, as you command, Marshal.", next = "BACK", reply = "Good, because every guard on that wall is someone's son. Hold, and we'll bleed them slowly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting is how keeps fall. I'll strike Stonewatch myself.", next = "BACK", reply = "If you can, I'll not stop you, but I won't send men after you either. Bring me news of Stonewatch, and I'll be in your debt.", fx = { align = { order = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_lbrs", tags = { "news" }, when = { cleared = "Lower Blackrock Spire", faction = "Alliance" },
          text = "The guards tell me you've been inside Blackrock Spire itself, where the orcs that raid my lake come from. I'll believe it from you, and I'll sleep a little better tonight, which is more than I've managed in a month." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid! Hah, good. I've got gnolls in the hills and orcs on the ridge, and I'll take help from anyone with claws." },
        { id = "h_default", text = "I'm Marris, Marshal of Lakeshire, with a guard stretched across a lake, orcs who never sleep and a boar called Bellygrub in the gardens. What do you need?" },
        { id = "h_menace", when = { questBefore = TODO_QUEST("Blackrock Menace") },
          text = "The Blackrock came out of the Burning Steppes and took Stonewatch Keep. Now they raid everything north of town, and there's another nest of them in Render's Valley. I want their numbers down." },
        { id = "h_menace_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blackrock Menace"), days = 3 } },
          text = "Quieter nights this week, and my guards actually slept. One of them snored, and I've never been so glad to hear it." },
        { id = "h_keeshan", tags = { "news" }, when = { questBefore = TODO_QUEST("Missing In Action") },
          text = "Corporal Keeshan was taken when Stonewatch fell. If the scouts are right, the orcs hold him at Render's Rock, by the Steppes pass. I can't spare the men to fetch him." },
        { id = "h_keeshan_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Missing In Action"), days = 3 } },
          text = "Keeshan's sleeping it off in the barracks. He told me what you did twice over, and he never tells anything twice." },
        { id = "h_orbs", when = { questActive = TODO_QUEST("Shadow Magic") },
          text = "The Blackrock shadowcasters carry midnight orbs, and every orb has cost me a guard. Bring them here to be destroyed, and don't carry them close to your skin." },
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
        { text = "Who leads the orc raiders?", next = "tharil" },
        { text = "Someone gave that boar a fine name in Bellygrub.", next = "bellygrub" },
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
        { text = "Then we take it back.", next = "BACK", reply = "That's what I tell myself every morning when I look up at those walls, and I mean to see it done. Help me thin the orcs out first, though, because a platoon won't retake what an army holds.", fx = { affinity = 2, trait = { brave = 1 }, align = { honor = 1 } } },
        { text = "Stonewatch is lost, so hold the lake and let it go.", next = "BACK", reply = "Easy to say for someone who didn't watch it burn. I'll hold the lake, aye, but I'll not let it go.", fx = { align = { honor = -1 } } },
        { text = "You did what you could.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "You must have lost good soldiers there.", next = "stonewatch_lost" },
      },
    },
    stonewatch_lost = {
      lines = {
        { id = "sl_default", text = "More than I'll name standing in the street. Keeshan's on the missing list, not the dead one. Until someone shows me otherwise, that's where he stays." },
        { id = "sl_back", when = { questDone = TODO_QUEST("Missing In Action") },
          text = "Keeshan came off the missing list, thanks to you. The rest of that list hasn't moved." },
      },
      choices = {
        { text = "I'll bring him home.", next = "BACK", reply = "Then you'll have my thanks and the town's, and his mother's most of all. Bring him back alive if you can.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I won't risk my neck for one missing corporal.", next = "BACK", reply = "That's your right, and I'll not order a stranger into the hills. But someone has to, and I'd hoped it would be you.", fx = { affinity = -1, align = { honor = -1 } } },
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
        { text = "Stormwind trains its own warlocks, Marshal. Does that sit right with you?", next = "op_demons" },
        { text = "I'll bring you the orbs.", next = "BACK", fx = { affinity = 1 } },
        { text = "Smashing them may not be enough. Let me see them first.", next = "orbs_priest", when = { class = "PRIEST" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orbs_priest = {
      lines = { { id = "op_default", text = "You'd know better than a soldier. Fine: the Light first, then the hammer. My men won't touch them either way." } },
      choices = {
        { text = "The Light first. Always.", next = "BACK", reply = "Then do it that way, and I'll keep my men well clear. They've no desire to be close to whatever's in those orbs.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Smash them first, and the prayers can come after.", next = "BACK", reply = "A soldier's answer, and I'd usually agree. But if the priests want it the other way, I'll not argue with them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tharil = {
      lines = {
        { id = "t_default", text = "Tharil'zun, who leads their Outrunners. He picks the ground between here and Stonewatch, hits my patrols, and he's gone before the horn sounds; he's crafty, and I hate crafty." },
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
        { text = "So you named the garden's worst enemy.", next = "bellygrub_name" },
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
          text = "Good, because my guards stomp like oxen and the orcs hear them a mile off. That animal of yours has better ears than any guard I've got, so take it up Render's Valley and tell me where the camps have moved." },
      },
      choices = {
        { text = "I'll go alone. I'm quieter that way.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "What should I look for?", next = "bad" },
      },
    },
  },

  topics = {
    second_war = { { id = "tp_second_war", text = "I was a sergeant in the Second War, and I watched orcs take hills like these in an afternoon. I'm not ashamed to say the Blackrock frighten me, because a soldier who isn't frightened of them hasn't been paying attention." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "Tharil'zun's orders come down from that black mountain to the north, I'm sure of it, and the mountain has more orcs than Stormwind has soldiers. I'd like a hundred men to hold the passes, and I'd settle for fifty." } },
    bolvar = { { id = "tp_bolvar", text = "I've written to the Highlord three times, and the replies are courteous and empty. I don't blame him, because I know what's on his desk, but I wish Redridge were nearer the top of it." } },
    prestor = { { id = "tp_prestor", text = "The Regent's letters come back in a lady's hand these days, I'm told, and they're very polite. Politeness doesn't hold a bridge, so I've stopped reading the second page." } },
    varian = { { id = "tp_varian", text = "King Varian went to make peace and vanished on the way, and the kingdom hasn't been the same since. He'd have sent us soldiers, I believe that, though I suppose every captain says the same." } },
    holy_light = {
      { id = "tp_holy_light", text = "I pray to the Light before every patrol goes out, and I count heads when they come back. Some days the prayer works, and some days I just count." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "I pray before every patrol, paladin, and I'd ask you to say one too, because yours seem to carry further. I count the heads when they come back, and I'd like the count to come out right." },
    },
    dark_portal = { { id = "tp_dark_portal", text = "The orcs came through that gate in the Black Morass, and the Blackrock were the first of them. I'm told it lies broken now, and I'd still like more soldiers between it and Lakeshire than the few I have." } },
    thrall = { { id = "tp_thrall", text = "Thrall leads the orcs in Kalimdor and talks of peace with Theramore, and the Blackrock clearly didn't get the letter. Either he can't control them, or he doesn't want to, and I don't like either answer." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons fight the Blackrock in the Steppes, and if they'd only finish each other I'd buy them both an ale. They won't, though, because neither side ever loses quickly enough to do us any good." } },
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
