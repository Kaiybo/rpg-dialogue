-- Stormwind, Old Town: the Pig and Whistle (Harry Burlguard, Bartleby, the barmaid and the cook),
-- the Protective Hide and the SI:7 front (Osborne, Jasper Fel). Voice: bibles/old_town.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "burlguard", id = TODO_NPC("Harry Burlguard"), name = "Harry Burlguard",
  bible = "bibles/old_town.md", role = "soldier", tier = "quest",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "practical", "loyal" },
  prejudice = { class = "WARLOCK", amount = 12, why = "Retired soldier who lost his squad at Blackrock Spire to things the Horde's warlocks called up." },
  notices = { "light", "kin", "soldier", "lock_pact" },
  impression = {
    first = "He teaches young warriors by setting them on the tavern regulars.",
    third = "{name} met Harry Burlguard, an old veteran who teaches fighting from his table in the Pig and Whistle.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I lost my whole squad at Blackrock Spire to things your sort called up. Sit in the corner, drink, and don't talk to my regulars." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "Every soldier in this tavern has a story about warlock fire, and none of them end well. Mind how you walk in here." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've drunk here quiet often enough that the regulars stopped staring. I haven't, but I've stopped reaching for a bottle to throw." },
    { id = "g_table", text = "Pull up a stool, if you can find one that isn't broken. Most of them are, round here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit down, then; my knees won't let me stand for you." },
    { id = "g_willem_kept", when = { class = "WARRIOR", thread = { id = "war_willem", state = "resolved" } }, text = "Sit down, sit down. I read the whole list last night, every name on it, and it went easier than it has in years." },
    { id = "g_willem_broke", when = { class = "WARRIOR", thread = { id = "war_willem", state = "soured" } }, text = "You again. Sit if you like, but don't ask me about Westfall, because I've a pen in my pocket and a short temper tonight." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest in the Pig and Whistle. Somebody's going to need you before the night's out, mark me, and it'll probably be Bartleby." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Stormwind blood. Good, you'll know what an Old Town tavern's like on a Friday, so you won't be shocked when the stools start flying." },
    { id = "n_warrior", cat = "soldier", when = { class = "WARRIOR" },
      text = "You stand like you've been taught, but not taught enough. I can see where you'd drop your guard from here, and so will the next man who swings at you." },
    { id = "n_lock_pact", cat = "lock_pact", when = { class = "WARLOCK", aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "There's a heat on you like the fever before a battle, and I've felt it once before, standing too near a Horde warlock's imp at Hillsbrad. I'll thank you to keep your pact on the far side of my table." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "More than I'd like, and their lightning hurt worse than any axe. You're the first dwarf I've seen doing it, though, and I'd like to see how you'd fare against my regulars." } },
      choices = {
        { text = "Fight fair, Harry, and I'll spar anytime you like.", next = "BACK", reply = "That's what I like to hear. Come by after closing and we'll see if your fists are as honest as your mouth.", fx = { align = { honor = 1 } } },
        { text = "Let your regulars come. I'll knock them down fast.", next = "BACK", reply = "Ha! They'd all say that too, and then they'd be on the floor. Mind the third man from the door, he bites.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not on our side, they didn't, not in the Second War, because the Horde had the warlocks and we had the burns to show for it. I've had to get used to your sort walking about the city since, and I'll say this much: the ones I've met fight dirtier than an orc and complain less." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Not on our side, they didn't, because the Horde had the warlocks and we had the burns, and the smell off that thing takes me straight back to the Second War. I've had to get used to your sort in the city since, but I'll thank you to keep it on the far side of my table while I drink." },
      },
      choices = {
        { text = "I fight for Stormwind, Harry, not like the Horde.", next = "BACK", reply = "Aye, you do, and I'll give you that. Just keep the green fire away from my curtains.", fx = { align = { honor = 1 } } },
        { text = "Dirty fighting wins wars, Harry. Ask any orc.", next = "BACK", reply = "Ask any orc in an internment camp how that went. Dirty wins battles, lad, but it doesn't win wars.", fx = { align = { honor = -1 } } },
        { text = "Something else, Harry.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It would've helped the company and terrified the orcs, which is two birds with one claw. Mind, my lads would've tried to feed it ale, and I'd not answer for what happened then." } },
      choices = {
        { text = "I'd have stood your flank, Harry, and been proud to.", next = "BACK", reply = "I'd have been proud of it too, and my lads would've fed you ale till you tipped over.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your war wasn't my people's war, Harry.", next = "BACK", reply = "No, it wasn't, and I'll not pretend otherwise. But we bled all the same, for whatever it's worth.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not at first, because a soldier likes to see the man next to him, and your lot never stayed where I could see. But one of them cut a troll's throat before it reached my sergeant, and after that I stopped asking where they'd been." } },
      choices = {
        { text = "I'd rather fight where my allies can see me.", next = "BACK", reply = "That's a soldier's thinking, and I respect it. Your lot could use more of it.", fx = { align = { honor = 1 } } },
        { text = "Results matter more than where anyone was standing.", next = "BACK", reply = "They do, in the end. I'll still raise a glass to the troll-cutter, wherever he went.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "We loved them when the fire was landing on the orcs and cursed them when it wasn't, which was more often than any mage will admit. Dalaran's lot pulled my company out of the Alterac foothills once, though, so I'll not hear a word against a mage in this tavern." } },
      choices = {
        { text = "A mage should stand with the soldiers, not behind them.", next = "BACK", reply = "That's what the good ones did, and the ones who didn't got my lads killed. Remember it.", fx = { align = { honor = 1 } } },
        { text = "A mage's job is to win, not to stand anywhere.", next = "BACK", reply = "Win, aye, but winning's easier with the soldiers still standing. Keep that in mind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Walked ahead of us through the Lordaeron forests and told us where the orcs were before the orcs told us themselves. One old ranger had a hawk that spotted an ambush at Hillsbrad, and I've owed that bird my life for twenty years." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Walked ahead of us through the Lordaeron forests and told us where the orcs were before the orcs told us themselves. That {pet} of yours has the same look that hawk had, watching everything. Look after it, and it'll look after you." },
      },
      choices = {
        { text = "I'll scout ahead for anyone who needs me.", next = "BACK", reply = "Good. The old ranger with the hawk would've liked you.", fx = { align = { honor = 1 } } },
        { text = "I scout for myself first. Others can find their own way.", next = "BACK", reply = "Then you'd have been no use to my company, and you'd have been on your own when the orcs came.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A chaplain out of Northshire, for six years, and he never lifted a sword but he never left a man behind either. I saw him walk across a field under orc arrows to reach a lad who was already gone, and I've never been that brave in my life." } },
      choices = {
        { text = "That's the work, Harry. Nobody should die alone.", next = "BACK", reply = "No, they shouldn't, and he made sure of it. I'll drink to him tonight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Brave, but foolish. A dead priest helps nobody.", next = "BACK", reply = "Maybe so, but he saved more men than any sword I carried. I'll not hear him called a fool in my tavern.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Loud, shining and very hard to kill, and the men fought better with one nearby. They never ran, and that was the trouble sometimes, because a soldier who won't run will stay when he ought to fall back." } },
      choices = {
        { text = "A paladin holds the line. That's what the oath means.", next = "BACK", reply = "That's the oath, and the good ones kept it to the last. Mind you keep it too.", fx = { align = { honor = 1 } } },
        { text = "A wise paladin knows when to fall back and save his men.", next = "BACK", reply = "There's wisdom in that, and I saw it save men more than once. Keep both in your head.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Sit down and have a pint, {class}, because the Pig and Whistle could use someone to bless the ale, and nobody else here will." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I fought beside your sort in the war, {class}, and I'll say this, they were the last ones off the field every time." },
        { id = "h_default", key = true,
          text = "Harry Burlguard. I carried a sword for the kingdom more years than you've been alive, and now I sit here and teach the young ones how to keep breathing, usually by setting them on Bartleby, the drunk at the end of the bar. It's quieter, mostly." },
        { id = "h_training", tags = { "news" }, when = { questActive = TODO_QUEST("A Warrior's Training") },
          text = "Lyria sent you, did she? She's a fine teacher, and she knows when a student's ready for the rough part. Let's see what you've got, then." },
        { id = "h_bartleby", tags = { "news" }, when = { questActive = TODO_QUEST("Bartleby the Drunk") },
          text = "See the fellow at the end of the bar, the one cuddling his mug? That's Bartleby, and I want that mug, and he won't hand it over to you nicely." },
        { id = "h_beat", tags = { "news" }, when = { questActive = TODO_QUEST("Beat Bartleby") },
          text = "Go on, then, he's waiting. Keep your feet under you and your guard up, and don't hit him anywhere you'd be sorry to be hit." },
        { id = "h_mug", tags = { "news" }, when = { questActive = TODO_QUEST("Bartleby's Mug") },
          text = "I watched that, and it was well done! Now give me the mug and sit down, because you're about to learn a few things that'll keep you alive." },
        { id = "h_haggard", tags = { "news" }, when = { questActive = TODO_QUEST("Marshal Haggard") },
          text = "Haggard's manor is out by the Eastvale lumber camp, in Elwynn. Tell him Burlguard sent you, and if he's in a good mood, he'll find you a blade worth carrying." },
        { id = "h_haggard_done", when = { questDone = TODO_QUEST("Marshal Haggard") },
          text = "Haggard looked after you, then? He's kept more spare swords than any man I know, and I'm glad one of them found its way to you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, is it? I fought beside a few of your sort in the Second War, and they were always somewhere else when the charge came, though they always turned up when it mattered." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in the Pig and Whistle, and you're not here for the ale, I'll wager. Sit down anyway; you look like you could use a stool that doesn't float." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. We had a few of your sort scouting for us in the Second War, and each of 'em saved my company at least once." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in the Pig and Whistle! We never had your sort in the Second War, more's the pity, because a bear on the flank would've done wonders for morale." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've the Lamb's cellar on your boots, in the Pig and Whistle. Sit down where the regulars can see you, or they'll start a fight just to find out what you are." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "A warlock in the Pig and Whistle, bold as you like. I fought your kind's demons in the Second War, so keep yours outside and keep your voice down." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You again. You've never once started trouble in here, so sit down, though I'll keep my eye on you all the same." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Sit down, I've a regular here who'll test your mettle. You've never fought a shaman, have you, Bartleby? Well, there's a first time for everything." },
      },
      again = {
        { id = "h_again", text = "What else? I've half a pint left and all evening." },
        { id = "h_again2", text = "Go on, ask. Old soldiers like being asked things." },
      },
      choices = {
        { text = "Teach me to fight.", next = "teach", when = { class = "WARRIOR" } },
        { text = "Why set your students on a drunk?", next = "bartleby" },
        { text = "There must be a first lesson you teach.", next = "lesson" },
        { text = "You must miss soldiering.", next = "soldiering" },
        { text = "I've heard the name Marshal Haggard.", next = "haggard",
          when = { any = { { questActive = TODO_QUEST("Marshal Haggard") }, { questDone = TODO_QUEST("Bartleby's Mug") } } } },
        { text = "Why does that mug matter so much to him?", next = "bg_mug", when = { class = "WARRIOR", any = { { questActive = TODO_QUEST("Bartleby the Drunk") }, { questActive = TODO_QUEST("Beat Bartleby") } } } },
        { text = "Defensive Stance feels like fighting in deep mud, Harry.", next = "bg_stance", when = { class = "WARRIOR", minLevel = 10, any = { { questDone = TODO_QUEST("Beat Bartleby") }, { questDone = TODO_QUEST("Bartleby's Mug") } } } },
        { text = "Your dirty tricks kept me alive in Duskwood.", next = "bg_return", when = { class = "WARRIOR", minLevel = 20, maxLevel = 49 } },
        { text = "I've been inside Blackrock Spire, Harry.", next = "bg_spire", when = { class = "WARRIOR", minLevel = 50 } },
        { text = "A dwarf doesn't need a drunk to learn brawling.", next = "bg_dwarf", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "Did you trust the rogues you fought beside?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Soldiers can't have thought much of mages in the war.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What did hunters do for your company, Harry?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Did your company have a priest in the war, Harry?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What were paladins like on the battlefield, Harry?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a bear on the flank really have helped your company, Harry?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Did anyone fight with dark magic in your wars, Harry?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did you ever fight orc shamans in the war, Harry?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I found Willem, Harry. He's drilling farmers at Sentinel Hill.", next = "willem_end",
          when = { class = "WARRIOR", thread = { id = "war_willem", beat = "b3_gryan", state = "unfolding" } } },
        { text = "Enjoy your pint.", next = "END" },
      },
    },

    willem_end = {
      big = true,
      narr = "He sets his mug down and turns it slowly by the handle.",
      lines = { { id = "willem_end_default", key = true,
        text = "Alive, then, and drilling Stoutmantle's farmers, which is more than his sergeant ever got out of him. I swore the same oath to the crown that he did, and I've seen men hanged for less than walking off a post, so you tell me, because I can't: did that lad break faith, or keep it?" } },
      again = { { id = "willem_end_again", text = "You've said your piece about Willem, and I'm still chewing on it." } },
      choices = {
        { text = "He kept faith with the people that oath was meant to protect.", next = "willem_kept",
          fx = { thread = { id = "war_willem", state = "resolved" }, align = { order = -1 }, affinity = 1 },
          journal = { first = "I told Harry that Willem kept faith with Westfall. He'll read the lad's name with the rest of his list.", third = "{name} told Harry Burlguard that Willem Tarn had kept faith." } },
        { text = "He broke his oath. A soldier doesn't get to choose his war.", next = "willem_broke",
          fx = { thread = { id = "war_willem", state = "soured" }, align = { order = 1 } },
          journal = { first = "I told Harry that Willem broke his oath. He's taking a pen to his list.", third = "{name} told Harry Burlguard that Willem Tarn had broken his oath." } },
        { text = "That's not mine to judge, Harry.", next = "BACK" },
      },
    },
    willem_kept = {
      lines = { { id = "willem_kept_default",
        text = "Then I'll read his name tonight with the rest of them, after the last drunk's gone home, and I'll pour a second pint for it. Don't tell the barracks I said so, because I'm too old to be court-martialled and too stubborn to enjoy it." } },
      choices = { { text = "Drink one for me, too.", next = "BACK" }, { text = "Good night, Harry.", next = "END" } },
    },
    willem_broke = {
      lines = { { id = "willem_broke_default",
        text = "Aye, that's what the barracks says, and they've the right of it on paper. I'll take a pen to the list tonight, and if he ever walks back through that door, he can buy his own drink." } },
      choices = { { text = "Something else.", next = "BACK" }, { text = "I'll go.", next = "END" } },
    },

    teach = {
      lines = { { id = "t_default", text = "I teach the things a trainer can't, the dirty ones that a real fight demands. Stand behind your shield when it counts, crack your enemy's armor before you try to cut through it, and make sure the beast looks at you and not your friends." } },
      choices = {
        { text = "That sounds like more than a lesson.", next = "teach_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach_more = {
      lines = { { id = "tm_default", text = "It's how you keep the people behind you alive, which is the whole job, whatever the songs say. A warrior who only thinks about killing is a warrior who'll die young." } },
      choices = {
        { text = "I fight for the ones behind me.", next = "BACK", reply = "That's the right answer, and the rest follows from it. You'll do well.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "I fight to win. The rest can look after themselves.", next = "BACK", reply = "Then you'll win alone, and you'll die alone. I've seen it a hundred times.", fx = { align = { honor = -1 } } },
      },
    },

    bartleby = {
      lines = { { id = "b_default", text = "Because a training dummy doesn't hit back, and a drunk who's fond of his mug does. You learn more in one fight with someone who doesn't want to lose than in a month of drills." } },
      choices = {
        { text = "That seems a bit cruel to Bartleby.", next = "bartleby_cruel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bartleby_cruel = {
      lines = { { id = "bc_default", text = "He enjoys it more than they do, believe me. He gets his mug back every time, and a free round from me for his trouble, and he wouldn't miss it for the world." } },
      choices = {
        { text = "A fair arrangement, then.", next = "BACK", reply = "It is, and he'd tell you so himself if you asked. Don't, though; he never stops.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Using a drunk for practice still isn't right.", next = "BACK", reply = "Then you tell him that, and see how he takes it. He'll be the one throwing the first punch.", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },

    lesson = {
      lines = { { id = "l_default", text = "It's that the fight you walk away from is the one you win. Young ones hate hearing it, so I make them learn it with a drunk instead of an orc, because Bartleby forgives you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    soldiering = {
      big = true,
      lines = { { id = "s_default", text = "I miss the lads, not the marching. Now I watch the young ones go off to Westfall and Redridge, and some of them come back to tell me about it, and some don't." } },
      choices = {
        { text = "The ones who don't, you remember?", next = "soldiering_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiering_lost = {
      lines = { { id = "sl_default", text = "Every one of them. I don't say their names in here, because it's a tavern and folk come to forget, but I've a list, and I read it when the place is empty." } },
      choices = {
        { text = "Let me pray over that list with you.", next = "BACK", when = { class = "PRIEST" }, fx = { affinity = 3 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bg_mug = {
      lines = { { id = "bgm_default", text = "He carried it through the Second War, so he says, from Southshore to Blackrock and back, though I've heard three different stories about which battle. True or not, he'll fight for it harder than any gnoll will fight for a scrap of meat, and that's the lesson." } },
      choices = {
        { text = "Then I'll give it back to him after.", next = "BACK", reply = "You will, because I'll hand it back myself with a full pint in it. Off you go.", fx = { align = { light = 1 } } },
        { text = "A mug's a mug. I'll take it and be done.", next = "BACK", reply = "That's what the gnolls think about Westfall's farms, lad. Mind who you sound like.", fx = { align = { light = -1 } } },
        { text = "Something else, Harry.", next = "BACK" },
      },
    },
    bg_stance = {
      big = true,
      lines = { { id = "bgs_default", text = "It does, and it's meant to, because the stance is there to make you slow and hard to shift. You hit softer and you get hit less, and the rage comes off every blow they land on you, so the mud's what's keeping you upright, not dragging you down." } },
      choices = {
        { text = "Then I'll stand in the mud and let them come.", next = "bg_stance_taunt", fx = { align = { order = 1 } } },
        { text = "I'll keep to battle stance and finish things quick.", next = "BACK", reply = "Quick's grand when it works, and when it doesn't, you'll wish you'd learned to stand. Ask Haggard about his patrol sometime.", fx = { align = { order = -1 } } },
        { text = "When do I change between them?", next = "bg_stance_taunt" },
      },
    },
    bg_stance_taunt = {
      lines = { { id = "bgst_default", text = "When a friend's in trouble and the beast is looking the wrong way, that's when. Switch, Taunt, and take it on your shield, and you'll learn to do it in the time it takes Bartleby to finish a swallow, which isn't long." } },
      choices = { { text = "Switch, Taunt, shield. Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    bg_return = {
      lines = {
        { id = "bgr_default", text = "Did they now? Then sit down and tell me which one, because I've an old soldier's vanity and I like to hear it. Duskwood's a foul place for a fight, all fog and wet roots, and a fair fighter dies there twice as fast as a dirty one." },
        { id = "bgr_human", when = { race = "Human" }, text = "Did they now? I heard the Night Watch at Darkshire is thinner than ever, and good Elwynn lads are dying in that fog, so I'm glad one of mine came back. Sit down and tell me which trick it was." },
      },
      choices = {
        { text = "Sand in a worgen's eyes, just as you taught.", next = "BACK", reply = "Ha! That's my favourite, and Wu Shen would have a fit if he heard it.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I fought fair and still came back.", next = "BACK", reply = "Then you're luckier than most, or better. Keep the tricks in your pocket anyway.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bg_spire = {
      big = true,
      narr = "He sets his mug down very carefully and doesn't pick it up again.",
      lines = { { id = "bgsp_default", text = "Then you've walked over the ground where my squad died, and you came out, which is more than they managed. I don't need to know what's in there now, only whether the orcs still hold it, and whether you made them pay for it." } },
      choices = {
        { text = "They paid, Harry. For your lads and for mine.", next = "BACK", reply = "Then I'll drink to that, tonight and every night. Thank you, {class}.", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "I went for the gold, not for revenge.", next = "BACK", reply = "Honest, at least, and the dead don't care why you went. I'll drink to them anyway.", fx = { align = { honor = -1 } } },
        { text = "Let's not talk about it here.", next = "BACK" },
      },
    },
    bg_dwarf = {
      lines = { { id = "bgd_default", text = "No, your lot come out of the cradle swinging, and I've seen a dwarf drink Bartleby under the table and then beat him with the table. Muren Stormpike in Ironforge has his own test for you, and I hear it involves a troll, which is fairer on the troll than Bartleby would be." } },
      choices = { { text = "I'll bring Muren his troll. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    haggard = {
      lines = { { id = "h2_default", text = "A retired marshal out by Eastvale, who kept a cellar full of gear from his career and gives it to young fighters who've earned it. He's suspicious of strangers, so walk up slow and say my name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, and I'll tell you about it whether you ask or not, so you might as well ask. The orcs were bigger than they are now, and so was I, and I'd like to think we both shrank about the same." } },
    thrall = { { id = "tp_thrall", text = "Thrall's the warchief of the orcs now, and they say he's a different sort than the ones I fought. I'll believe it when I see him at this table, and I'll buy him a drink if he behaves." } },
    internment = { { id = "tp_internment", text = "I guarded an internment camp for a year after the war, and it was the worst job I ever had. The orcs were broken and the guards were bored, and nobody was happy, and then they all walked out anyway." } },
    dark_portal = { { id = "tp_dark_portal", text = "I stood in the Black Morass the day the expedition marched through the Dark Portal, and I watched good men walk into that red light and never come back. That's a story for another night, and another round." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The statues in the Valley of Heroes are of men and women I fought beside, and they were all a good deal less handsome in person. I'll tell you which ones snored, if you buy the next round." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I've heard of an arena in Stranglethorn where they fight for gold, and I've sent a few of my students there to learn. Most of them came back, and the ones that did were better for it." } },
    knows = { { id = "tp_knows", text = "Old soldiers drink here, and they talk when they drink. Ask me, and I'll tell you what I've heard over the rim of a mug." } },
    background = { { id = "tp_bg", text = "A soldier long enough to know better, and a teacher now. That's the whole of it, and I'll not dress it up.", next = "soldiering" } },
    advice = { { id = "tp_ad", text = "Keep your guard up even when you're winning, especially then. That's when they get you." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I've heard most things in this tavern." } },
  },
}

P:NPC {
  key = "bartleby", id = TODO_NPC("Bartleby"), name = "Bartleby", title = "Drunk",
  bible = "bibles/old_town.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "fierce" }, values = { "proud" },
  notices = { "light", "kin", "drink", "lock_stones" },
  impression = {
    first = "He is spoiling for a fight and oddly gracious when he loses.",
    third = "{name} met Bartleby, the Pig and Whistle's most stubborn drunk, and his beloved mug.",
  },

  greetings = {
    { id = "g_mug", text = "What're you looking at? It's my mug, and you can't have it." },
    { id = "g_beaten", when = { questDone = TODO_QUEST("Beat Bartleby") }, text = "Oh, it's you. Fair fight, that was, I'll give you that, but you're still not having it again." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "Oh, a priest, here to tell me about the evils of drink, is it? Save your breath and buy me another, and I'll repent of that one." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A proper Stormwind sort, all clean boots and good manners. What's a fancy thing like you doing in the Pig and Whistle?" },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You're as drunk as I am! Sit down, sit down, you're the best company I've had all week." },
    { id = "n_lock_healthstone", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "Is that a healthstone? Give it here, because I hear they mend a man in one swallow, and I've a head on me that wants mending. No? Then take it and sit somewhere else, because it's making my ale taste green." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Always, and you look like you'd give a good one. If I lose, I'll buy you a drink. That's only fair." } },
      choices = {
        { text = "A fair fight and a shared drink. I accept.", next = "BACK", reply = "Now that's the spirit! Pull up a stool, and mind you don't spill.", fx = { align = { honor = 1 } } },
        { text = "Keep your mug. I won't brawl with a drunk.", next = "BACK", reply = "Nobody calls Bartleby a drunk and walks away dry! Oh, all right, I'll let it go this once.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I'd fight anybody for this mug, and I fought a mage once, a young lad from the Quarter who turned my ale to ice, and I broke his nose before he got the second spell out. He bought me a drink after, mind, and that's how it should be, because a fight's no good if you can't laugh about it at the bar." },
      },
      choices = {
        { text = "Then let's leave it at a drink, Bartleby.", next = "BACK", reply = "A drink it is, then. You're a wiser sort than the lad from the Quarter.", fx = { align = { honor = 1 } } },
        { text = "The lad went easy on you. I wouldn't.", next = "BACK", reply = "Easy? He froze my ale, he did! I'll still fight you, mind, I'll fight anybody.", fx = { align = { honor = -1 } } },
        { text = "Something else, Bartleby.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Once, and it was the worst night of my life, because the cat could hold its drink better than I could. If that was one of your lot, you can tell them Bartleby remembers." } },
      choices = {
        { text = "Somebody owes you a mug, Bartleby, and they ought to pay it.", next = "BACK", reply = "Exactly! Somebody does owe me, and it's the cat's mate, and I've never been paid.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Share your mug, Bartleby. Nobody owns ale forever.", next = "BACK", reply = "Share my mug? Over my dead body, and only then if you pry it out of my fingers.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, when I was asleep, which isn't fair and doesn't count. I found the lad two days later down by the canals drinking out of it, and I took it back, and I didn't ask nicely." } },
      choices = {
        { text = "Robbing a sleeping man is cowardly. You were right.", next = "BACK", reply = "I was! And I'd do it again, if anybody so much as looks at this mug sideways.", fx = { align = { honor = 1 } } },
        { text = "A mug left unguarded is anyone's mug, Bartleby.", next = "BACK", reply = "Unguarded? I was asleep on it! Sleeping's guarding, if you sleep right.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Bother me? It drank half my pint the last time one of you lot sat down, and then it laughed about it, and I've never been so insulted by something knee-high. Burlguard says I should be grateful it wasn't the big blue one." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Bother me? It's looking at my pint the way the last one did, right before it drank half and laughed about it, and I've never been so insulted in my life. Burlguard says I should be grateful, but Burlguard isn't the one whose drink it's eyeing." },
      },
      choices = {
        { text = "I'll keep it on a short leash. Sorry about the pint.", next = "BACK", reply = "Apology accepted, and you can buy me the pint back. Fair's fair.", fx = { align = { light = 1 } } },
        { text = "My companion drinks what it likes, Bartleby. You'll get over it.", next = "BACK", reply = "I'll never get over it, never! Keep that thing away from my end of the bar.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Fought in the Second War, I did, carried a pike from Southshore to Blackrock and back again. Now I fight for this stool every night, and I've a better record here than I ever did there." } },
      choices = {
        { text = "Thank you for your service, Bartleby. Keep the stool.", next = "BACK", reply = "Thank you, friend, and you can share it if you're careful. Don't tell Harry.", fx = { align = { honor = 1 } } },
        { text = "I'll take your stool if I want it, old man.", next = "BACK", reply = "Want it? Then come and take it, and see what the pike-arm's still got in it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because the last one drank my ale, and I've never forgiven it, nor its owner, nor the barmaid who laughed. A dog that can drink a pint of the Pig's dark is a dog with no sense, and I'll not share a bar with it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because the last one drank my ale, and I've never forgiven it, nor its owner, nor the barmaid who laughed. Keep {pet} at the far end, by Elly. She likes animals, and I like my ale where I left it." },
      },
      choices = {
        { text = "Right, Bartleby. I'll keep my elbows off your end of the bar.", next = "BACK", reply = "Good. My end of the bar's sacred, and so's my ale.", fx = { align = { order = 1 } } },
        { text = "My pet sits where it likes. It's a free tavern.", next = "BACK", reply = "Free tavern my foot! That dog's not getting so much as a sniff of my ale.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Pray for the mug, it's been through more than I have. No, go on, say one if you like, and I won't tell anyone, but don't expect me to stand up for it." } },
      choices = {
        { text = "Then I'll pray for you both, Bartleby, sitting or standing.", next = "BACK", reply = "Bless you. The mug thanks you too. Don't tell anyone I said that.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "No prayers for you while you're clutching that mug.", next = "BACK", reply = "Then I'll keep holding it, and you'll keep not praying. Suits us both.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd fight the king for this mug, and I'd lose, and I'd shake his hand after, because that's how it's done. You lot fight fair, at least, and the canal boys bring a cosh in their boot." } },
      choices = {
        { text = "I fight fair, Bartleby, but I won't fight a drunk.", next = "BACK", reply = "Won't fight a drunk? Then I'll sober up just for you, and we'll see.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fair or not, I'd have that mug before you stood up.", next = "BACK", reply = "Ha! You'd try, and you'd lose, and then I'd buy you a drink. Go on, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Come to tell me to put the mug down, have you? Well, you'll have to pray harder than that." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You want my mug? Come and take it, shiny, and we'll see whose Light's brighter." },
        { id = "h_default", key = true,
          text = "Bartleby's the name, and this is my mug, and this is my stool, and that's my end of the bar. Anybody who wants any of the three can try taking them." },
        { id = "h_drunk_q", tags = { "news" }, when = { questActive = TODO_QUEST("Bartleby the Drunk") },
          text = "Burlguard's sent another one, I can smell it. Look at you, so clean and pretty; mind you don't chip a nail on my face." },
        { id = "h_beat", tags = { "news" }, when = { questActive = TODO_QUEST("Beat Bartleby") },
          text = "You still want my mug after all that? You're mad, you are, and you'll have to take it off me, because I've never let go of a mug in my life." },
        { id = "h_mug", tags = { "news" }, when = { questActive = TODO_QUEST("Bartleby's Mug") },
          text = "There's more to you than clean boots, I'll say that. Take the mug back to Harry, then, and tell him I'm expecting my round." },
        { id = "h_mug_done", when = { questDone = TODO_QUEST("Bartleby's Mug") },
          text = "Harry gave it back, see, and filled it. Every one of you lot ends up buying me a drink eventually, one way or another." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Don't even think about it; I've seen your sort eyeing my mug. Better thieves than you have tried and gone home with nothing but a sore head." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You smell like burnt hair and bad decisions, and I'd know, because I've made most of them. Keep that little beast of yours away from my ale." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, eh? Don't get any ideas about my stool. I've seen off bigger than you, though not lately, and not sober." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be wanting a drink, then, after a long day squatting in a bush. Don't bring your beast near my end of the bar." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Don't turn into anything near my mug, because I've seen a cat drink beer and I'll not have it happen to me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, eh? You so much as look at my mug with a spell in mind and I'll show you what a real fight looks like." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Try and take this mug, I dare you. Spirits or no spirits, it's mine." },
      },
      again = {
        { id = "h_again", text = "What is it now? I'm busy drinking, and it's skilled work, whatever Harry tells you." },
        { id = "h_again2", text = "You're still here, are you? Then ask your question before my pint goes warm." },
        { id = "h_again3", when = { questDone = TODO_QUEST("Beat Bartleby") }, text = "Go on, then, you've earned a question or two after the bruise you gave me." },
      },
      choices = {
        { text = "That mug must be special to you.", next = "mug" },
        { text = "Hand it over, Bartleby.", next = "fight" },
        { text = "You must have lost a few fights by now.", next = "record" },
        { text = "You ought to go home.", next = "home" },
        { text = "Has anyone ever stolen that mug off you?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You look like you've fought before, Bartleby.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "You hit harder than I expected, Bartleby.", next = "bb_bruise", when = { class = "WARRIOR", questDone = TODO_QUEST("Beat Bartleby") } },
        { text = "Do Harry's students ever come back to see you?", next = "bb_students", when = { class = "WARRIOR", minLevel = 20 } },
        { text = "Why keep beasts away from your end, Bartleby?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does my little companion bother you, Bartleby?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Shall I pray for you, Bartleby?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you really fight a paladin for that mug?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has a cat really drunk out of your mug, Bartleby?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you fight a mage for that mug, Bartleby?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Are you spoiling for a fight, Bartleby?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Enjoy your drink.", next = "END" },
      },
    },

    bb_bruise = {
      big = true,
      lines = {
        { id = "bbb_default", text = "Course I did, I'm a pikeman, and a pikeman hits like a falling cart. You stood up under it, though, all low and sulky in that new stance of yours, and I'll tell you what I told Harry: that one'll do." },
        { id = "bbb_dwarf", when = { race = "Dwarf" }, text = "Course I did, and you took it like a wall, which is what I get for fighting a dwarf. Harry's never sent me one before, and I'll be asking him not to again, because my knuckles are still singing." },
      },
      choices = {
        { text = "You fought fairly. I'm honoured, Bartleby.", next = "BACK", reply = "Honoured! Hear that, Elly? Somebody's honoured to have been hit by me.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "You were drunk. It barely counted.", next = "BACK", reply = "Drunk's how I fight best, and you'd do well to remember it. Counted to me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bb_students = {
      lines = { { id = "bbs_default", text = "Some of them do, and they buy me a drink and show me their scars, and I show them mine, and mine are always worse. Some of them don't come back, and Harry goes quiet those nights, and I let him have my stool." } },
      choices = {
        { text = "That's kind of you, Bartleby.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I'll come back, at least.", next = "BACK", reply = "You'd better, and you'd better bring a story, because I'm tired of my own.", fx = { affinity = 1 } },
      },
    },

    mug = {
      lines = { { id = "m_default", text = "It's mine, that's what. Same mug every night for longer than I can remember, which isn't very long, admittedly, but it's the principle of the thing." } },
      choices = {
        { text = "A man should have his principles.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fight = {
      lines = {
        { id = "f_default", text = "Over my cold body, friend, and it's a warm body yet. Put up your fists, or put down your ideas." },
        { id = "f_warrior", when = { questActive = TODO_QUEST("Beat Bartleby") }, text = "Right, that's it! Let's see what Harry's been teaching you, then!" },
      },
      choices = {
        { text = "You've had enough tonight.", next = "fight_enough" },
        { text = "Never mind. Keep your mug.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then put up your fists.", next = "END", when = { class = "WARRIOR" }, fx = { trait = { brave = 1 } } },
      },
    },
    fight_enough = {
      lines = { { id = "fe_default", text = "Enough? There's no such thing as enough, there's only empty. And my mug's half full, so we're nowhere near it yet." } },
      choices = {
        { text = "Let him drink; it's his own business.", next = "BACK", reply = "Exactly! Somebody talking sense in this tavern at last.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Somebody ought to cut you off for your own good.", next = "BACK", reply = "For my own good? Nobody cuts Bartleby off, not even Harry, and he's tried.", fx = { align = { order = 1 }, affinity = -2 } },
      },
    },

    record = {
      big = true,
      lines = { { id = "r_default", text = "Lost? I don't lose, I rest between rounds. Harry sends me a new one every week or so, and they all go away with the mug and come back with a drink, so who's really winning?" } },
      choices = {
        { text = "You let them win.", next = "record_let" },
        { text = "Something else.", next = "BACK" },
      },
    },
    record_let = {
      lines = { { id = "rl_default", text = "I never! I fight 'em all proper. Only, if they fight well, I give them the mug, because a good fight deserves a reward, and Harry always fills it after." } },
      choices = {
        { text = "That's decent of you, Bartleby.", next = "BACK", reply = "It is, isn't it? Harry says I'm a soft touch, but a good fight's a good fight.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "So you lose for free ale. Clever.", next = "BACK", reply = "Clever? I'd never! Well, maybe a bit clever. Don't tell Harry.", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },

    home = {
      lines = { { id = "h2_default", text = "This is home, near enough. Elly brings the drinks and Reese keeps the fire and nobody asks me questions, except you, now." } },
      choices = { { text = "I'll stop asking, then.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "There's an arena down in Stranglethorn where they'll fight you for a chest of gold, and I'd go if I could find my boots. Last time I looked they were under a dwarf." } },
    the_stockade = { { id = "tp_the_stockade", text = "I spent a night in the Stockade once for a disagreement with a chair, and it was the best sleep I've had in years. Now the prisoners run it, I hear, so I'll not be back, unless they're serving ale." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons brew a stout so black you can't see the bottom of the mug, and I've only had it once. I've been chasing that mug ever since, and I'll catch it someday." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has a contest where you drink until you fall, and I've won it twice. They've asked me not to come back, which I count as a third win." } },
    knows = { { id = "tp_knows", text = "I hear everything said at this bar, though I remember about half of it. Ask, and we'll see which half." } },
    background = { { id = "tp_bg", text = "I drink, I fight, I keep my mug. You want more than that, buy me another." } },
    advice = { { id = "tp_ad", text = "Never fight a man for his drink unless you're willing to buy him the next one. That's manners." } },
    _none = { { id = "tp_none", text = "How should I know? I've been here all night. And last night." } },
  },
}

P:NPC {
  key = "elly_langston", id = TODO_NPC("Elly Langston"), name = "Elly Langston", title = "Barmaid", gender = "female",
  bible = "bibles/old_town.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "friendly", "practical" },
  notices = { "light", "kin", "drink", "lock_shadow" },
  impression = {
    first = "She never spills a drop or loses her temper.",
    third = "{name} met Elly Langston, barmaid at the Pig and Whistle Tavern in Old Town.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite face in Old Town! Sit yourself down, love, and I'll bring your usual before the soldiers grab it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'll pour you a drink, love, but you can carry it to your own table." },
    { id = "g_drink", text = "What'll it be, love? Ale, wine or something you'll regret?" },
    { id = "g_fl_wink", when = { flirt = true, chance = 0.4 },
      text = "Well, aren't you a sight at the end of a long shift, love. Sit where I can see you, and I'll have your ale there before the soldiers notice I've got favourites." },
    { id = "g_fl_back", when = { flirt = true, npcFlagBefore = "fl_warm" }, cooldown = "3d",
      text = "There's my one in twenty, back again! I kept your stool warm, or Bartleby did, which I'll grant isn't quite the same thing." },
    { id = "g_fl_cool", when = { flirt = true, npcFlagBefore = "fl_cool" }, once = true,
      text = "Evening, love. Don't look so worried; I've put my eyelashes away, and it's strictly ale and manners from me tonight." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest, in here? I'll fetch you something gentle, love, and you can sit by the fire and pretend you're not judging us." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A local, I'd bet. You've the look of someone who's had a Pig and Whistle ale before and come back anyway." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had plenty already, love. I'll pour you water and charge you for ale, and you'll never know the difference." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The lamp over your table's gone dim since you sat down, love, and Reese swears he trimmed the wick this morning. It's not you, is it? Only it does that every time one of yours comes in." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every night, and I keep it from spilling. Your spirits must have it easier, being invisible and not drinking." } },
      choices = {
        { text = "A tavern should give an honest measure to every customer.", next = "BACK", reply = "That's how the Pig and Whistle's kept its soldiers for years, love.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Fill the mugs with froth when the soldiers are too drunk to notice.", next = "BACK", reply = "They notice, love, and then they turn the tables over, and I'm the one who mops up.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "You keep this place in good order, Elly. I respect that.", next = "BACK", reply = "Thank you, love. Somebody has to, and Harry's no good at the mopping.", fx = { align = { order = 1 } } },
        { text = "Let them brawl. It's good for the soul.", next = "BACK", reply = "Good for the soul and bad for the chairs. I'll take your word on the soul.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Less than the soldiers and more than the cooks, so somewhere in the middle, which is fine by me. The worst I've had was a fellow who lit the hearth with a fireball and set Bartleby's beard smouldering, and the whole room cheered, so I suppose he got away with it." },
      },
      choices = {
        { text = "Then I'll keep my spells off the hearth, Elly.", next = "BACK", reply = "Thank you, love. Harry's still sore about the last one.", fx = { align = { order = 1 } } },
        { text = "A little fire keeps the room lively, Elly.", next = "BACK", reply = "Lively, aye, and on fire. I'd rather the room stayed boring, love.", fx = { align = { order = -1 } } },
        { text = "Something else, Elly.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That you can turn into a bear and drink like one, mostly, and that night elves are all very tall and very rude. I tell them I've never met a rude elf, though I've met plenty of rude soldiers." } },
      choices = {
        { text = "I'll buy them a round and prove them wrong.", next = "BACK", reply = "Now that's the way to shut them up, love. Buy a round and you'll be everyone's favourite elf.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them think us rude. It keeps them at a distance.", next = "BACK", reply = "It does, love, but it keeps them talking about you too. Your choice.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Old Town's quiet folk drink either here or at the Lamb, and I'd not say which lot is better company. The SI:7 lads tip well and never say where they've been, so I like them fine." } },
      choices = {
        { text = "I'll pay my tab and tip well, Elly. Count on it.", next = "BACK", reply = "Good. That's all I ask, love, and you'll always have a seat.", fx = { align = { honor = 1 } } },
        { text = "I'll pay when you catch me, Elly.", next = "BACK", reply = "Then I'll catch you, love. I always do, and I've a long memory for faces.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'll serve anyone who pays and doesn't set the curtains on fire, love. Mind you, the last one of yours who came in ordered a drink for the little horned thing at his elbow, and Reese still hasn't forgiven me for pouring it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'll serve anyone who pays and doesn't set the curtains on fire, love, but I'll not pour for your {pet}, however hard it stares at the taps. The last one of yours ordered a drink for his imp, and Reese still hasn't forgiven me for pouring it." },
      },
      choices = {
        { text = "I'll leave my companion outside. It's only polite.", next = "BACK", reply = "That's very kind, love. Rena will be glad not to serve one of those again.", fx = { align = { light = 1 } } },
        { text = "My companions drink where I drink, and that's that.", next = "BACK", reply = "Then your companion pays its own way, love, and it sits at the back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "One a week, if we're lucky, and usually between a soldier and a dockhand over something neither remembers in the morning. Dashel Stonefist ends most of them, and Reese mops up after, and I keep pouring." } },
      choices = {
        { text = "I'll keep the peace if one starts while I'm here.", next = "BACK", reply = "Thank you, love. Dashel will be relieved; he's getting too old for it.", fx = { align = { order = 1 } } },
        { text = "A good brawl clears the air. I'll join in.", next = "BACK", reply = "Then you'll be sweeping up with me after, love. Mind the glass.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every evening, coming in from Elwynn with their boots muddy and their stories bigger than their game. My favourite is an old trapper who swears a bear in the Brackwell woods knows his name." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Every evening, coming in from Elwynn with their boots muddy and their stories bigger than their game. Oh, look at {pet}! I'll find it a bowl of water and a bone from the kitchen, and don't you dare tell Stephen I took it." },
      },
      choices = {
        { text = "My stories are always true, Elly. Mostly.", next = "BACK", reply = "Mostly? That's the honest answer, love, and I'll take it.", fx = { align = { honor = 1 } } },
        { text = "Tell it the fun way, Elly. Nobody drinks to the truth.", next = "BACK", reply = "Ha! You're right, love, the fun way's the only way. I'll keep telling it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only on the night before they march, love, and then it's the whole company at once, quiet as mice. I've poured a lot of last pints in this room, and I've learned to tell which ones they'll come back for." } },
      choices = {
        { text = "Then I'll sit with them that night, Elly, if they'll have me.", next = "BACK", reply = "That's kind, love. They'd have you, I think, and they'd be glad of it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A blessed pint won't stop an arrow, Elly.", next = "BACK", reply = "No, love, but it might make the walk to the gate a little lighter. That's something.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They want you to think well of them, I suppose, or they're afraid you'll tell their sergeants. Either way the stools stay on the floor while you're here, and that's all I ask of anyone." } },
      choices = {
        { text = "I'll keep the peace, Elly. That's part of my duty.", next = "BACK", reply = "Thank you, love. That's half my job done for me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them brawl. A soldier needs to let off steam.", next = "BACK", reply = "They can let it off outside, love. I've only so many stools.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, love! Mind the soldiers, because they'll ask you to bless their pints and then spill them on you." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The soldiers behave better with your lot in the room, love, so stay as long as you like." },
        { id = "h_default", text = "Elly Langston, and I run the drinks round the Pig and Whistle while Reese keeps the taps. Sit where you like, except Bartleby's stool, because he bites." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Busy tonight, love, the soldiers are in. Shout if you need me and duck if you hear a stool." },
        { id = "h_stonemason", when = { origin = "human_stonemason_child" },
          text = "You're a mason's child, aren't you, love? The Guild used to drink in that corner every payday, back when there were paydays, and you've got the same look they had when the coin stopped coming." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I count the mugs when your sort comes in, love, and I count them again when you leave. Nothing personal; I do it to Bartleby too." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You're one of the Lamb's lot, aren't you? I can always tell, because you never sit with your back to the door." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Sit down, sweetheart, but not on Bartleby's stool, and not near the door, because that's where the brawls start." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Bring your beast in, sweetheart; I like a bit of fur by the fire, and Bartleby can grumble all he likes." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, love? We don't get many of your people in the Pig and Whistle, and the regulars will stare, but they stare at everyone." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Don't you dare go chilling the ale for anyone, because Reese has opinions about that and I'll be the one who hears them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and wanting a drink, I'd guess. Ale, stout, or whatever your spirits prefer? I'll have it before you finish asking." },
      },
      again = {
        { id = "h_again", text = "Anything else, love? I've six mugs in each hand." },
        { id = "h_again2", text = "What else can I get you?" },
      },
      choices = {
        { text = "Let me see your drinks.", next = "BUSINESS" },
        { text = "This place looks like it has its regulars.", next = "regulars" },
        { text = "The food here smells good.", next = "food" },
        { text = "I'd guess a few rogues drink at the Pig and Whistle.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The Pig and Whistle sees its share of brawls, I'd wager, Elly.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters drink in the Pig and Whistle often, Elly?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you mind serving the Lamb's crowd, Elly?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the soldiers really want their pints blessed, Elly?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why do soldiers behave better around a paladin, Elly?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the soldiers say about druids over their pints, Elly?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do mages make trouble at the Pig and Whistle, Elly?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do soldiers here ever cause trouble, Elly?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Do you call every man in here love, Elly?", next = "fl_love", when = { flirt = true } },
        { text = "Not tonight.", next = "END" },
      },
    },
    fl_love = {
      lines = {
        { id = "fl_love_default", text = "Every one of them, sweetheart, because it saves me learning their names. I only mean it with about one in twenty, mind, and I'll leave you to guess which one you are." },
      },
      choices = {
        { text = "I'd like to think I'm the one in twenty.", next = "fl_love2",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_warm" } } } },
        { text = "Twenty to one? A dwarf takes those odds every time.", next = "fl_love2", when = { race = "Dwarf" },
          reply = "Ha! I've watched your sort win and lose a fortune at the dice in the corner, love, so don't wager more than your beard.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_warm" } } } },
        { text = "I'll guess I'm one of the other nineteen, Elly.", next = "BACK",
          reply = "Modest as well! That's a shame, love, but it's your loss, and the ale's just as cold either way.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "fl_cool" } } } },
        { text = "Keep it for the soldiers. I'm only here to drink.", next = "BACK",
          reply = "Suit yourself, love. The ale doesn't flirt back either, so the pair of you will get on fine.",
          fx = { affinity = -1, npcFlag = { set = { "fl_cool" } } } },
      },
    },
    fl_love2 = {
      lines = {
        { id = "fl_love2_default", text = "Careful, love, or Reese will start charging you for the attention. I'll bring yours in the good mug, the one without the chip, and that's as far as a barmaid's favour goes on a busy night." },
      },
      choices = {
        { text = "The good mug, then. I'll count myself lucky.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars = {
      lines = { { id = "r_default", text = "Harry Burlguard at his table, teaching the young ones, and Bartleby at the end of the bar, getting taught. Then off-duty guards, and a few faces from that grey building across the way who never say what they do." } },
      choices = {
        { text = "The grey building?", next = "regulars_si7" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_si7 = {
      lines = { { id = "rs_default", text = "I don't ask, love, and they tip well for not asking. Old Town's like that; you learn which questions keep the tips coming." } },
      choices = {
        { text = "Smart. Some questions aren't worth asking.", next = "BACK", reply = "Smart and profitable, love. You'd make a fine barmaid.", fx = { align = { order = 1 }, trait = { discreet = 1 } } },
        { text = "Secrets in a city are never a good sign.", next = "BACK", reply = "Maybe not, love, but they're good for tips. I'll leave the worrying to the guards.", fx = { align = { order = -1 } } },
      },
    },
    food = {
      lines = { { id = "f_default", text = "Stephen's ribs are the best in the city, and he'll tell you it's his own recipe. Erika sells the spices, so if you want to try it at home, ask her, though it won't come out the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's folk come in here when they're in the city, and they tip better than any soldier. I've had a juggler leave me a silver and a fire-eater leave me burns, so it evens out." } },
    dark_iron = { { id = "tp_dark_iron", text = "A dwarf asked me for Dark Iron ale once, and I told him we don't serve it here, and he cried. I gave him a Thunderbrew on the house, and he forgave me by the third." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay rum is the only drink that's ever made Burlguard stop talking about the Second War. I keep a bottle for emergencies, and I've used it twice." } },
    the_stockade = { { id = "tp_the_stockade", text = "The guards from the Stockade drink here after their shifts, and they've been drinking more since the riot. They don't talk about it, and I don't ask, but I keep their mugs full." } },
    knows = { { id = "tp_knows", text = "A barmaid hears every secret in Old Town, love, though she keeps most of them. Ask." } },
    background = { { id = "tp_bg", text = "I carry drinks at the Pig and Whistle, and I'm good at it. That's my story, and it's a busy one." } },
    advice = { { id = "tp_ad", text = "Never sit with your back to the door in Old Town, love. Everybody who matters already knows that." } },
    _none = { { id = "tp_none", text = "No idea, love. Ask Harry; he's been everywhere." } },
  },
}

P:NPC {
  key = "ryback", id = TODO_NPC("Stephen Ryback"), name = "Stephen Ryback", title = "Cooking Trainer",
  bible = "bibles/old_town.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "careful", "proud" },
  notices = { "light", "kin", "craft", "lock_taint" },
  impression = {
    first = "He says he is only a cook, and that ends the subject.",
    third = "{name} met Stephen Ryback, the Pig and Whistle's cook and cooking trainer, who is just a cook, he says.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You've a good palate and steady hands, and I'm always glad to teach a real cook." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll teach you, since cooks are scarce, but I'll not put up with nonsense in my kitchen." },
    { id = "g_cook", text = "I don't get many cooks asking to learn, but I'll teach you if you're ready." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. You can bless the ribs if you like, but they're already the best thing in this tavern, so the Light has little to add." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "You'll have eaten Elwynn boar, then. Most folk cook it too fast, and I'll teach you not to." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook already, I can tell by the burn on your wrist. Everybody gets that one; it's how you know you've started." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "There's a smell on you, sulphur and something sweeter under it, the fel getting in deep, I'd guess. I can tell when meat's turned by the smell alone, and I'd not let you near my stew pot." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'm a cook. That's all you need to know. But I've seen orc shamans in battle, and you don't look like them, which is good for my appetite." } },
      choices = {
        { text = "A cook learns by burning a few dishes and trying again.", next = "BACK", reply = "That's how I learned, and I've the scars on my hands to show it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Buy a pie from the baker and pretend you made it.", next = "BACK", reply = "Then you'll never cook a thing worth eating, {class}, and the soldiers will know.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Your past is yours, Stephen. I won't pry.", next = "BACK", reply = "Thank you. That's the first kindness I've had about it in a month.", fx = { align = { honor = 1 } } },
        { text = "Everyone has a story. Tell me yours.", next = "BACK", reply = "Mine's a cook's story, and it's long and boring. Have a bowl of stew instead.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Anybody can learn to cook, if they've the patience and the hands for it, and I've noticed your sort have both. Mind, you can't rush a rib with a green flame, because it chars on the outside and stays raw in the middle, and I've seen a man try it and seen what it did to his stomach." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Anybody can learn to cook, and your sort have the patience for it, but I'll ask your servant to stop lurking by my spit. You can't rush a rib with fel heat, and that thing's standing close enough that I can see the fat on the near side spitting already." },
      },
      choices = {
        { text = "Then I'll learn it properly, the slow way.", next = "BACK", reply = "Good. The slow way's the only way that tastes like anything.", fx = { align = { honor = 1 } } },
        { text = "A quick fire's good enough for me, Stephen.", next = "BACK", reply = "Burnt meat for the rest of your days, then. Suit yourself, but don't bring it near my table.", fx = { align = { honor = -1 } } },
        { text = "Something else, Stephen.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I would, and you'd eat better than the Keep does, because a cook who can't do vegetables can't cook. I learned that in the field, when the meat ran out and the turnips didn't." } },
      choices = {
        { text = "A good cook wastes nothing, Stephen. That's respect for the land.", next = "BACK", reply = "It's the only way I know to cook. The land feeds us; the least we can do is waste nothing.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Cook what you like, Stephen. The land doesn't care.", next = "BACK", reply = "Maybe not, but I do. You'll eat better if you cared a little.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I wasn't always behind a grill, so yes, I notice hands, and I notice who keeps them near a blade. Old habits are like a good stock, because the longer you leave them, the stronger they get." } },
      choices = {
        { text = "A past is nothing to hide, Stephen.", next = "BACK", reply = "Not for some, maybe. For me, it's best left simmering at the back.", fx = { align = { honor = 1 } } },
        { text = "Everyone has a past they'd rather keep quiet.", next = "BACK", reply = "Exactly. Mine's at the back of the pot, and that's where it stays.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "You can, and it'll fill you up and taste of nothing at all, like eating a cloud. A meal cooked properly over a real fire does something for a soldier that no spell's ever managed, and I'll argue that with any archmage." } },
      choices = {
        { text = "Then I'll learn the long way, over a proper fire.", next = "BACK", reply = "Good. You'll find the fire does more than the bread ever did.", fx = { align = { order = 1 } } },
        { text = "Conjured bread keeps me alive. That's all I need.", next = "BACK", reply = "Then you'll live, and you'll never taste anything. A sad way to go.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something warm and plain, and not too much of it, because nobody fights well with a belly full of pie. The old Barracks cooks swore by porridge and a bit of salted pork, and I've never heard better." } },
      choices = {
        { text = "Plain food and a clear head. I'll remember that.", next = "BACK", reply = "Good. The porridge lads at the Barracks knew a thing or two.", fx = { align = { order = 1 } } },
        { text = "I'll eat what I like before a fight, thanks.", next = "BACK", reply = "A heavy stomach's a poor thing to carry into a fight, but it's your stomach. Don't come crying to me after.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boar from the Elwynn woods, roasted slow with apples, and if you ever bring me a good haunch of it I'll show you how. Westfall's chicken's the most common, but there's nothing on a plate like a boar that's eaten acorns all autumn." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Boar from the Elwynn woods, roasted slow with apples, and if you ever bring me a good haunch of it I'll show you how. And {pet} will want the scraps, I suppose? Fair's fair, then, since it probably did half the work of catching it." },
      },
      choices = {
        { text = "I'll bring you boar, and only take what I need.", next = "BACK", reply = "Good. Boar tastes better when it's taken fairly, and I'll cook it right.", fx = { align = { honor = 1 } } },
        { text = "I'll bring you boar by the cartload, for the right price.", next = "BACK", reply = "Then I'll pay for what I can use, and the rest you can sell elsewhere.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I saw a few of them work three days without sleep, and I saw one fall in the mud and get up again without a word. I'm just a cook now, but I make sure the ones who come in here eat first." } },
      choices = {
        { text = "Then you're serving the wounded too, Stephen, in your way.", next = "BACK", reply = "I like to think so. A full belly is half of getting better.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Healers should know their limits. Fainting helps nobody.", next = "BACK", reply = "They should, but they never do. I'd rather put a bowl of stew in front of them than a lecture.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I said I'm just a cook, and I meant it, but I'll tell you this much: I learned to use a knife a long time before I learned to use it on onions. Leave it there, {class}." } },
      choices = {
        { text = "I'll leave it there. A man's past is his own business.", next = "BACK", reply = "Thank you. Not many people do.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A man should own what he's done, Stephen, good or bad.", next = "BACK", reply = "I own it every day, in my own way. I'd thank you not to ask how.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Eat something, {class}, because I've watched healers faint on an empty stomach, and it's no way to save anybody." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Sit, eat, and don't tell me about your battles, because I've heard enough stories to last me." },
        { id = "h_default", text = "Stephen Ryback. I cook for the Pig and Whistle and teach anybody who wants to learn, which isn't many, because most folk would rather eat than learn to." },
        { id = "h_back", when = { metBefore = true }, text = "You're back. Did the last lesson take, or did you burn it?" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've got quick hands, and a cook notices hands. If they're as quick with a knife on an onion, I could make something of you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Every mage who comes in here asks whether they can cook with a fireball, and the answer's yes, once, badly." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll eat like three men and complain like four, I expect, which makes you my favourite kind of customer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now there's someone who can bring me fresh meat instead of whatever the butcher's been hiding in his back room." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in my kitchen. Your sort don't eat much meat, I'm told, so you'll be giving my ribs a dark look, and I'll take it personally." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've the cellar's smell on you. You'll eat at the bar like everyone else, and your friend can wait outside, because I won't cook for something that doesn't have a stomach." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Sit down and eat. I'm just a cook, and you're just hungry, I'd guess." },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind the smoke, because those ribs want me back at the grill." },
        { id = "h_again2", text = "Go on, while the stew simmers." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "Those ribs smell like there's a secret in them.", next = "ribs" },
        { text = "Were you always a cook, Stephen?", next = "past" },
        { text = "So that's how you size people up, by their hands.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could just conjure my food.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What should a warrior eat before a fight, Stephen?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What game do you most like to cook, Stephen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Did you see many healers in the war, Stephen?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Were you a soldier before you were a cook, Stephen?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you cook for me if I brought only roots and greens, Stephen?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can someone with my sort of fire learn to cook, Stephen?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Were you a soldier once, Stephen?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Never mind.", next = "END" },
      },
    },
    ribs = {
      lines = { { id = "r_default", text = "My own recipe, and it stays mine. Low heat, a long time and Erika's spices, and that's more than I've told anybody else in this tavern." } },
      choices = {
        { text = "Erika's spices?", next = "ribs_erika" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ribs_erika = {
      lines = { { id = "re_default", text = "Erika Tate, by the hearth, sells cooking supplies at fixed prices. If you try to haggle, she'll tell you to go and find a goblin, and she'll mean it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      big = true,
      lines = { { id = "p_default", text = "Folk ask me that every other week. I'm a cook, and I'm a good one, and that's all anybody in this tavern needs to know about me." } },
      choices = {
        { text = "A man's past is his own business.", next = "BACK", reply = "Exactly. You'd fit in here, I think.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "A cook doesn't hold a knife like that.", next = "past_knife", fx = { trait = { curious = 1 } } },
        { text = "Hiding the past usually means something to hide.", next = "BACK", reply = "Maybe it does. And maybe it means I'm done with it. Have a bowl of stew.", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    past_knife = {
      lines = { { id = "pk_default", text = "A good cook holds a knife exactly like that. Sit down and eat something, and stop asking questions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "The cooks in Booty Bay do things with spice I'd not have believed, and I've stolen a few of their tricks. I'll not tell you which ones, because a cook's secrets are his own." } },
    si7 = { { id = "tp_si7", text = "I'm just a cook, and SI:7 is just the building next door. If you've any other questions about it, I'd ask them somewhere else." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Gurubashi Arena is a pit full of fools fighting for gold, and I've no interest in it. I've done enough fighting for one life, if you take my meaning, and now I do ribs." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire sells ribs that would make a dwarf weep, and I've been trying to make them for years. I'm close, I think, though the secret's probably in the smoke." } },
    knows = { { id = "tp_knows", text = "Folk talk while they eat. Ask, and I'll tell you what came back with the plates." } },
    background = { { id = "tp_bg", text = "I'm a cook. You can ask again, but you'll get the same answer.", next = "past" } },
    advice = { { id = "tp_ad", text = "Learn to cook what you kill. You'll eat better on the road, and you'll waste less." } },
    _none = { { id = "tp_none", text = "I'm a cook, and that isn't cooking." } },
  },
}

P:NPC {
  key = "simon_tanner", id = TODO_NPC("Simon Tanner"), name = "Simon Tanner", title = "Leatherworking Trainer",
  bible = "bibles/old_town.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "patient" }, values = { "practical", "hardworking" },
  notices = { "light", "kin", "craft", "lock_armor" },
  impression = {
    first = "He has made his peace with students who leave for adventure.",
    third = "{name} met Simon Tanner, the leatherworking trainer at the Protective Hide in Old Town.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back to the Protective Hide. Your hands have got better since last time, and I've a hide worth your trouble." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind the drying racks, take your lesson, and then leave me to my work." },
    { id = "g_hide", text = "Welcome to the Protective Hide. Mind the drying racks, they've hides on them older than you." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest in a tannery. The smell'll get into your robes, so I'd not stay long, unless you've come to learn." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Elwynn wolves and boar, that's where most of our hides come from. You'll have hunted a few yourself, I'd wager." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You've been at it already, I can see the awl marks on your fingers. Let's see what you've learned, then." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That's demon hide you're wearing, conjured and not cured, and I can tell because there's no seam on it anywhere. I've tanned every beast Elwynn has, and I'd give a week's wages to know how it holds together." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some do, and those I'm proud of. Others leave for glory, and I wish them well. I'd guess a shaman doesn't stay put either." } },
      choices = {
        { text = "Leatherwork is learned by tanning every hide properly, start to finish.", next = "BACK", reply = "Exactly so, and it's why our jerkins last a lifetime in the field.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Skip the tanning; nobody can tell until it rots.", next = "BACK", reply = "They can tell by the smell, {class}, and long before it rots.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'll finish what I start, Simon. That's a promise.", next = "BACK", reply = "Good. I'll hold you to it, and I'll be glad to.", fx = { align = { honor = 1 } } },
        { text = "Adventure calls louder than leather. Let them go.", next = "BACK", reply = "Let them go, then, and I'll wish them well. Just leave me your jerkin on the way out.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Better than cloth does, and worse than mail, and a good deal better if it's been treated properly with salt and oil. I made a pair of gloves for a mage from the Quarter last year, and he burned through three before he thought to ask me to line them, and the fourth pair is still going." },
      },
      choices = {
        { text = "Then line mine from the start, Simon. I'll pay for it.", next = "BACK", reply = "A sensible customer. I'll line them well, and you'll not scorch your fingers.", fx = { align = { honor = 1 } } },
        { text = "I'll just burn through them and buy more.", next = "BACK", reply = "Then I'll be seeing a lot of you, and I'll not complain.", fx = { align = { honor = -1 } } },
        { text = "Something else, Simon.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I think it remembers how it was treated, because leather from a beast killed badly never sits right, however well I cure it. My old master said that, and I thought he was mad until I'd tanned a thousand hides." } },
      choices = {
        { text = "Then honour every hide, Simon. The beast gave everything.", next = "BACK", reply = "I will. My master taught me that, and it's the best lesson I ever had.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leather is leather, Simon. The beast is gone.", next = "BACK", reply = "Gone, aye, but it lives on in the hide, and I'll thank you to remember that while you're wearing it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a creak at the wrong moment has killed more of your kind than any guard's sword, or so the SI:7 lads tell me when they come in for repairs. They're very particular about their boots, and I like that in a customer." } },
      choices = {
        { text = "A quiet boot is for scouting, not for burglary.", next = "BACK", reply = "Exactly. I'll fit you for scouting, and I'll not ask what else you do in them.", fx = { align = { honor = 1 } } },
        { text = "A quiet boot is for whatever I need it for.", next = "BACK", reply = "Then I'll make them quiet, and I'll not ask. That's the trade.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "More than you'd guess, because the claws on what your lot keep go through cloth like paper, and I've stitched more than one apprentice's robe back together with the apprentice still in it. I sell them leather and I don't ask what they keep at home, and that suits all of us." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "More than you'd guess, because your sort's servants go through cloth like paper, and I've stitched more than one apprentice's robe back together. I'll sell you leather and not ask what you keep at home, but since you've brought it here instead, keep it off my hides while we talk." },
      },
      choices = {
        { text = "I'd rather what follows me never touched anyone. I'll take care.", next = "BACK", reply = "Good. I'd rather stitch leather than apprentices.", fx = { align = { light = 1 } } },
        { text = "Let it tear what it likes, Simon. Leather's cheap, and so are apprentices.", next = "BACK", reply = "Cheap, maybe, but my time isn't. I'd keep it on a lead.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The sensible ones do, and they wear leather straps on their mail, and leather grips on their swords, and leather boots on their feet. Half a warrior's kit comes through a tanner's hands, though nobody ever thanks us for it." } },
      choices = {
        { text = "Then thank you, Simon. Good leather has saved me before.", next = "BACK", reply = "You're welcome. That's the best thanks a tanner ever gets.", fx = { align = { honor = 1 } } },
        { text = "Nobody thanks the tanner. That's the trade.", next = "BACK", reply = "No, they don't, and that's why I'm glad when someone does.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A clean kill, a clean skinning and a hide salted the same day, because a pelt that's been dragged across Westfall for a week is good for nothing but a boot sole. The best ones come from hunters who care, and you can always tell." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A clean kill, a clean skinning and a hide salted the same day, because a pelt that's been dragged across Westfall for a week is good for nothing but a boot sole. Your {pet} has a lovely coat; I'll not suggest anything, I promise, it's only a professional habit to notice. Keep it brushed." },
      },
      choices = {
        { text = "A clean kill and respect for the hide. That's my way.", next = "BACK", reply = "Then you'll bring me good hides, and I'll pay you well for them.", fx = { align = { honor = 1 } } },
        { text = "A hide's a hide. If it sells, it's good enough.", next = "BACK", reply = "And you'll get half the price for it and wonder why. Take your time with the knife, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not the beasts, no, because every hide that's worked well is a death that wasn't wasted. It's the men I knew who went out hunting and didn't come back that I think about, and there's no craft for that." } },
      choices = {
        { text = "Then I'll pray for them, Simon, and for the beasts too.", next = "BACK", reply = "Thank you. They'd like that, I think, and so would I.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast is a beast. There's nothing holy in a hide.", next = "BACK", reply = "Maybe not, but there's something honest in it. I'll keep thinking so.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The careful ones do, and they come back, and the ones who don't come in on their second visit with blisters and a much humbler manner. I'd rather fit you properly the first time." } },
      choices = {
        { text = "Then fit me well, Simon. Good preparation is part of duty.", next = "BACK", reply = "There's a knight with sense. Stand still and I'll measure you properly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little chafing never hurt anyone. I'll manage as I am.", next = "BACK", reply = "You'll be back on your second visit with blisters, and I'll be right here, trying not to say I told you so.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in the Protective Hide! Don't mind the smell, {class}, because the beasts are past caring and we use every scrap of them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want a good leather jerkin under that plate, {class}, or you'll chafe raw before you've crossed Elwynn." },
        { id = "h_default", text = "Simon Tanner. I teach leatherworking, Randal helps when he's not admiring himself, and Jillian sells the thread and the dye if you've a project of your own." },
        { id = "h_skin", when = { profession = "Skinning" }, text = "You skin, I can tell; there's always a little of the job left under a skinner's nails. Hides want working, and I can teach you how." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, so you'll want soft leather that doesn't creak. I can teach you to make it, though I can't promise you'll sit still long enough to learn." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's ash on your sleeves, which makes three from the Lamb this week. Leather doesn't like fire, whatever you may have heard." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Leather's lighter than mail, and plenty of soldiers wear a jerkin underneath, so don't turn your nose up at the craft." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be bringing me hides, I hope, and not the ragged sort Randal keeps buying off the canal boys." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the Protective Hide. I'll not pretend you'll like everything hanging on my walls, but I'll ask you to look at the stitching before you judge." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, in a leatherworker's shop. You'll want a satchel for your scrolls, I'd guess, or a pair of gloves that won't scorch." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Students leave for adventure halfway through, and you look the adventuring sort. Still, I'll teach you if you'll listen." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a hide soaking." },
        { id = "h_again2", text = "Go on, ask away." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Tell me about Randal.", next = "randal" },
        { text = "Do your students stay?", next = "students" },
        { text = "Why does creaking leather matter so much?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I doubt warriors really wear leather under their armour, Simon.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Choosing a good hide is an art, I'd guess, Simon.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd not have thought the Lamb's crowd came to you often, Simon.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does working with the dead ever trouble you, Simon?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do many paladins buy leather from you, Simon?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think a hide remembers the animal it came from, Simon?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does leather hold up to magic, Simon?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your students stay long, Simon?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    randal = {
      lines = { { id = "r_default", text = "Randal's something of a dandy, cares more about the colour of a jerkin than the stitching, but he's dependable, and that's rare. He'll make a fine leatherworker once the style stops getting in the way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    students = {
      lines = { { id = "s_default", text = "Not many. They learn enough to make a jerkin and then they're off to see the world in it, and I can't blame them, really, but it means I'm always teaching the first lessons." } },
      choices = {
        { text = "The world needs crafters more than heroes.", next = "students_more", fx = { align = { order = 1 } } },
        { text = "Let them go. Nobody ever wrote a song about a tanner.", next = "BACK", reply = "Ha! No, they never did. Off you go, then.", fx = { align = { order = -1 } } },
      },
    },
    students_more = {
      lines = { { id = "sm_default", text = "I've said that for years, and nobody listens. Still, every hero in Stormwind's wearing something a crafter made, so we have our quiet revenge." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's tents are leather, and the finest I've ever seen, stitched by someone who knew what he was about. I'd give a year's earnings to meet the man who made them." } },
    timbermaw = { { id = "tp_timbermaw", text = "The furbolgs of the Timbermaw make leather armour that's lasted a hundred years, so the hunters say. I'd like to learn from them, though I'm told they don't care for visitors." } },
    booty_bay = { { id = "tp_booty_bay", text = "The finest leather in the world comes from the raptors of Stranglethorn, and Booty Bay's the only port that sells it. I buy when I can, and I curse the price every time." } },
    knows = { { id = "tp_knows", text = "Hunters and skinners bring me their hides and their stories together. The hides I tan; the stories you're welcome to." } },
    background = { { id = "tp_bg", text = "A leatherworker and a teacher, in Old Town most of my life. The hides tell better stories than I do." } },
    advice = { { id = "tp_ad", text = "Skin carefully, because a torn hide's only fit for scraps. Patience at the carcass saves you coin at the bench." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I know leather, and leather doesn't gossip." } },
  },
}

P:NPC {
  key = "osborne", id = TODO_NPC("Osborne the Night Man"), name = "Osborne the Night Man", title = "Rogue Trainer",
  bible = "bibles/old_town.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "calm" }, values = { "cunning", "loyal" },
  notices = { "light", "kin", "stealth", "lock_eyes" },
  impression = {
    first = "He keeps one hand near his coin purse while he teaches.",
    third = "{name} met Osborne the Night Man, the rogue trainer who stands outside SI:7 in Old Town.",
  },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You look like the sort I should keep an eye on my purse around. Good, that means you're learning." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "I don't think you want anything I teach, friend. Your own trainer's elsewhere." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest, outside this door. Either you've come to confess for somebody inside, or you're lost, and I'll walk you back to the Cathedral either way." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Stormwind born. You'll know that Old Town after dark belongs to people like me, then, so walk on the lit side of the street." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Nice try, but I heard your boots on the third step. Lighter on the heel next time, and you might fool somebody slower." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { class = "WARLOCK", aura = { 132, 2970, 11743 } },
      text = "You can see me, can't you, standing in the dark where nobody's meant to see me. That's a warlock's trick, eyes that find what hides, and I'd rather you didn't use it in SI:7's hallways." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If the wind can carry a word, then yes. I'd rather keep my secrets in my own head. You might do the same." } },
      choices = {
        { text = "Secrets kept well keep everyone safe, Osborne.", next = "BACK", reply = "They do, and you've the makings of a quiet friend. Keep thinking that way.", fx = { align = { order = 1 } } },
        { text = "The wind carries truth. Let it blow.", next = "BACK", reply = "Then mind which way it's blowing, because the wind carries lies just as easily.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only if the cat starts taking contracts, and I'd guess your elders wouldn't approve. Still, if one of SI:7's marks ever turns up with claw marks on him, I'll know whose door to knock on." } },
      choices = {
        { text = "My claws serve the forest, Osborne, not anyone's contracts.", next = "BACK", reply = "Fair enough. If the forest ever wants a contract, though, you know where my door is.", fx = { align = { honor = 1 } } },
        { text = "A good contract is a good contract, cat or no cat.", next = "BACK", reply = "Ha! I'll keep a cat-sized contract on file, then. Shaw will be delighted.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "When it must, though Shaw says a mage leaves a trail like a lit lantern, because every spell has a smell to it. The quiet ones are worth their weight in gold, but the quiet ones are rare." } },
      choices = {
        { text = "Then I'll learn to be quiet, for the kingdom's sake.", next = "BACK", reply = "Good. The quiet ones are rare, and the kingdom pays them well.", fx = { align = { order = 1 } } },
        { text = "I'd work for SI:7 only if it suited me.", next = "BACK", reply = "Then you'll be on your own when it doesn't suit you. Keep it in mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It's simple enough: you keep what you call up downstairs, and we keep our knives in their sheaths. Shaw doesn't love the arrangement and neither do I, but a cellar we can watch is better than ten we can't." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It's simple enough: you keep your demons downstairs, and we keep our knives in their sheaths, and you've just brought yours up into Old Town in daylight. Shaw doesn't love the arrangement, and he'll love it less when I write down that I watched it follow you to my door." },
      },
      choices = {
        { text = "The arrangement keeps the city safe. I'll honour it.", next = "BACK", reply = "Good. That's all anyone asks, on either side of the street.", fx = { align = { order = 1 } } },
        { text = "Arrangements are for people who fear each other. I don't.", next = "BACK", reply = "You should, a little. The ones who don't fear are the first to be found in the canal.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Once or twice, when the kingdom needed someone who could fight in a crowd without looking like they meant to. It never quite took, because a warrior's instinct is to stand and be seen, and mine is to vanish." } },
      choices = {
        { text = "Then I'll stand and be seen, so others can vanish.", next = "BACK", reply = "That's a rarer gift than you'd think, and a braver one. Shaw will want to hear of you.", fx = { align = { order = 1 } } },
        { text = "I can learn to vanish. Teach me.", next = "BACK", reply = "I'll try, but warriors make poor shadows. Come back at night and we'll see.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Alike in patience and different in purpose. You wait in the trees for something that doesn't know it's being hunted, and I wait in the dark for someone who does, which makes my quarry a good deal more dangerous." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Alike in patience and different in purpose. And your {pet}, does it bark at shadows? Mine would, if I had one, which is why I don't." },
      },
      choices = {
        { text = "I'd never use my skills to hunt people.", next = "BACK", reply = "Good. Keep it that way, and we'll never have to meet in the dark.", fx = { align = { light = 1 } } },
        { text = "A hunt's a hunt, beast or man.", next = "BACK", reply = "It is, and you'd be surprised how many hunters end up on my side of the door.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than they'd admit, and they never go to the Cathedral for it, because the Cathedral asks questions. If you're the sort who heals and forgets, there'll always be work for you near this door." } },
      choices = {
        { text = "The Cathedral's rules exist for a reason. I'll follow them.", next = "BACK", reply = "Then you'll be a good priest and a poor friend to my lads. I'll respect it.", fx = { align = { order = 1 } } },
        { text = "I'll heal and forget. Questions can wait.", next = "BACK", reply = "Then you'll have friends in Old Town, and they'll remember you kindly.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "SI:7 is the law, in the places the law can't reach, and the Highlord knows it even if he doesn't like it. You'd be surprised how many of your heroes owe their lives to someone you'd arrest on sight." } },
      choices = {
        { text = "Spy or not, a man still keeps his word, Osborne.", next = "BACK", reply = "He does, and Shaw keeps his. You'd be surprised how honest a spy can be.", fx = { align = { honor = 1 } } },
        { text = "If it keeps Stormwind safe, I don't care whose throat gets cut.", next = "BACK", reply = "Careful, paladin. That's the kind of talk that gets a man recruited.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at SI:7's door. Either you're lost or someone in here needs patching, and I'd guess the second." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at SI:7's door. I'll ask you to keep your voice down and your sense of justice in your pocket, {class}." },
        { id = "h_default", key = true,
          text = "They call me the Night Man, because I work late and I'm hard to see. I train the ones who come to SI:7's door, and I send away the ones who shouldn't have found it." },
        { id = "h_request", tags = { "news" }, when = { questActive = TODO_QUEST("A Simple Request") },
          text = "Lord Ravenholdt wants you, and that's all I'm told. Find his manor in the hills of Hillsbrad, northwest of Durnholde, and don't mention the invitation to anyone on the way." },
        { id = "h_request_done", when = { questDone = TODO_QUEST("A Simple Request") },
          text = "You went to the manor, then, and came back. Most do. What you do with Ravenholdt is between you and him, and I don't want to know." },
        { id = "h_renzik", when = { heardLine = "renzik.h_default" },
          text = "You've met Renzik. He talks about himself in the third person and I talk about myself as little as possible, and between us the door's well minded." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "This is my hour. The city's asleep and the alleys are honest about what they are, which is more than the day can say." },
        { id = "h_canals", when = { origin = "human_canal_pickpocket" },
          text = "I know you; you were the canal brat who lifted a sergeant's purse off his belt in broad daylight, and I was the one who told Shaw to let it go. Don't make a liar of me, now." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in Old Town after dark is either lost or brave, and the Sanctum doesn't teach brave. I'll assume you've a reason." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "One of the Lamb's cellar crowd, two streets from my door. You lot and SI:7 have an understanding, and I'd like it to stay understood." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at the Night Man's door. Either you're lost, or someone sent you, and I'd like to know which before you say another word." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and a quiet one, which I appreciate. You know how to wait and watch, and that's most of my trade too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in Old Town after dark. I hear your people can walk as a cat and nobody hears a thing, which makes you competition." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Keep your hands where I can see them and your spirits quiet. Rogues don't care much for things that whisper." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, now." },
        { id = "h_again2", text = "Keep talking. Old Town has ears, so choose your words with that in mind." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Why do they call you the Night Man?", next = "name" },
        { text = "That door looks like it hides something.", next = "door" },
        { text = "I've heard the name Lord Ravenholdt.", next = "ravenholdt", when = { class = "ROGUE", minLevel = 50 } },
        { text = "I doubt you trust the people you train.", next = "trust" },
        { text = "I should be practising something, I suppose.", next = "practise", when = { class = "ROGUE" } },
        { text = "The Defias pay better than SI:7, I hear.", next = "defias_pay", when = { class = "ROGUE" } },
        { text = "Ironforge taught me a smuggler's tricks. Any use here?", next = "dwarf_rogue", when = { race = "Dwarf", class = "ROGUE" } },
        { text = "A gnome can go where your people can't.", next = "gnome_rogue", when = { race = "Gnome", class = "ROGUE" } },
        { text = "You must have opinions on the other trainers in the city.", next = "others" },
        { text = "Does SI:7 ever use mages, Osborne?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Has SI:7 ever trained a warrior, Osborne?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are hunters and rogues much alike, Osborne?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What understanding does SI:7 have with the Lamb?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do SI:7's agents ever need a priest's help?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does SI:7 bend the law, Osborne?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a prowling cat any threat to your trade, Osborne?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do spirits ever give away a rogue's secrets, Osborne?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll be going.", next = "END" },
      },
    },

    name = {
      lines = { { id = "n_default", text = "Because I do my best work after dark, and because it sounds better than Osborne the Man Who Stands By the Door. A rogue's name is half his reputation, so choose yours carefully." } },
      choices = {
        { text = "What would you call me?", next = "name_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_you = {
      lines = {
        { id = "ny_default", text = "Nothing yet, because names are earned. Come back when people in Old Town start lowering their voices when you walk by, and I'll think of something." },
        { id = "ny_priest", when = { class = "PRIEST" }, text = "The Shepherd, maybe, though I'd guess you'd prefer something less ironic. Give it time; Old Town will name you." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    door = {
      big = true,
      lines = { { id = "d_default", text = "SI:7. The kingdom's eyes and ears, and its knife when it needs one. If you're not meant to be inside, you won't get further than me, and I'm much friendlier than what's past me.",
        fx = { learn = { "si7" } } } },
      choices = {
        { text = "A kingdom needs its knives.", next = "BACK", reply = "It does, and you're looking at one of them. Good of you to understand.", fx = { align = { order = 1 } } },
        { text = "Knives in the dark make for a frightened kingdom.", next = "BACK", reply = "Maybe so, but a kingdom without them is a kingdom that doesn't wake up. I'll keep mine sharp.", fx = { align = { order = -1 } } },
        { text = "Who runs it?", next = "door_shaw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    door_shaw = {
      lines = { { id = "ds_default", text = "Master Shaw, and Renzik under him, and that's more names than I should give you. Jasper sells supplies inside, if you've a reason to be there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ravenholdt = {
      lines = { { id = "r_default", text = "A lord in the Alterac foothills who keeps a manor full of people in our trade. He's no friend of the Syndicate and no servant of anyone, and he chooses his guests himself.",
        fx = { learn = { "syndicate" } } } },
      choices = {
        { text = "Has he chosen me?", next = "ravenholdt_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ravenholdt_me = {
      lines = {
        { id = "rm_default", text = "Not yet, or I'd have a letter for you. Keep working; he has a way of noticing people who get good enough." },
        { id = "rm_ready", when = { questActive = TODO_QUEST("A Simple Request") }, text = "He has, and you've the summons. Go soon, and go quietly; he doesn't like to be kept waiting, and he likes being talked about even less." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trust = {
      lines = { { id = "t_default", text = "I trust them to be exactly what they are, which is thieves with a royal licence. That's more honest than most of the court can claim." } },
      choices = {
        { text = "Honest thieves. I like that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Standing still. Every new rogue wants to learn to move, and the ones who live learn to wait in a doorway for an hour without fidgeting. After that, poisons, and after that, patience again." },
        { id = "practise_old", when = { minLevel = 40 },
          text = "You've the hands already; now practise your exits. Every room you walk into, find two ways out before you find the mark, and if there's only one, you're the mark." },
      },
      choices = {
        { text = "An hour in a doorway? Surely not.", next = "practise_door" },
        { text = "I'll practise until nobody sees me.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    practise_door = {
      lines = { { id = "practise_door_l", text = "Two, some nights, and I've stood in this one longer than that. The fidgeters get noticed, and the noticed get a visit from someone like me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    defias_pay = {
      big = true,
      lines = { { id = "defias_pay_l", text = "They do, at first, in coin they took off a farmer's corpse. VanCleef pays everyone well right up to the day he needs someone to hang for him, and that day always comes." } },
      choices = {
        { text = "Coin is coin, wherever it comes from.", next = "BACK", reply = "It is, until the noose finds you. VanCleef's coin is always heavy that way.", fx = { align = { honor = -2 }, affinity = -1 } },
        { text = "I'll not take a dead farmer's coin.", next = "BACK", reply = "Good. That's a better start than most of the lads who walk into Moonbrook.", fx = { affinity = 1, align = { honor = 2 } } },
        { text = "Why did VanCleef turn?", next = "defias_why" },
      },
    },
    defias_why = {
      lines = { { id = "defias_why_l", text = "Ask the nobles who never paid the Stonemasons, or ask Shaw, who knew him. I only know that a man with a grievance and a talent is the most dangerous thing in this city.", fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf_rogue = {
      lines = { { id = "dwarf_rogue_l", text = "Plenty, because a smuggler knows which guards look at cargo and which look at faces, and that's most of what I teach. Just remember the Watch here doesn't take its bribes in ale." } },
      choices = {
        { text = "Then what does it take them in?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I've left that life behind.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gnome_rogue = {
      lines = { { id = "gnome_rogue_l", text = "Under tables, through vents and into the gaps between the crates. I've watched gnomes clear a warehouse while the guards were looking for someone tall, and I'd be a fool not to use that." } },
      choices = {
        { text = "So long as you don't call me small.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Use it, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    others = {
      lines = { { id = "others_l", text = "The Cathedral's lot are honest, which makes them easy to read, and the mages think we're beneath them, which makes them easy to rob. The ones under the Slaughtered Lamb, I watch, and so does everyone behind this door." } },
      choices = {
        { text = "And the warriors' hall?", next = "others_warriors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_warriors = {
      lines = { { id = "others_warriors_l", text = "Wu Shen and his lot drill by daylight and drink by night, a few doors down, and they think a rogue is a warrior who's lost his nerve. I let them think it; it's cheaper than correcting them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt Manor is somewhere in the Alterac foothills, and they find you, not the other way round. I've heard they're very selective, and I'm told I was nearly selected once." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate are noble thieves, which is two kinds of thief at once. I'd not work for them, and I'd advise you don't either, because they never pay what they promise." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade's full of rogues who got caught, and a few of them were mine. I'd like to say it was their fault, but I taught them, so I suppose it's partly mine." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the best port in the world for a rogue to lose himself, and the goblins never ask questions. I spent a year there once, and I've still got the scars and most of the coin." } },
    knows = { { id = "tp_knows", text = "Plenty passes this door that never gets written down. Ask, and I'll decide what you can hear." } },
    background = { { id = "tp_bg", text = "I'm the Night Man. Anything before that was somebody else's life, and I've forgotten it on purpose." } },
    advice = { { id = "tp_ad", text = "Learn to listen before you learn to pick a lock. Most doors open once you know who has the key." } },
    si7 = { { id = "tp_si7", text = "The door behind me, and I'm all of it you'll see, unless you're one of us.", next = "door" } },
    _none = { { id = "tp_none", text = "Never heard of it, and very little gets past me in Old Town. Ask Renzik; he'll pretend he knows." } },
  },
}

P:NPC {
  key = "jasper_fel", id = TODO_NPC("Jasper Fel"), name = "Jasper Fel", title = "Shady Dealer",
  bible = "bibles/old_town.md", role = "vendor", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "careful" },
  notices = { "light", "kin", "stealth", "lock_shards" },
  impression = {
    first = "He knows more about my business than I have told anybody.",
    third = "{name} met Jasper Fel, the soft-spoken dealer who sells supplies inside SI:7.",
  },

  greetings = {
    { id = "g_quiet", text = "Speak softly in here, friend. The wrong word in these rooms has cost men their throats." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest, buying from me? I sell nothing that heals, friend, but if you need something that stops a heart, I'll keep your secret." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Stormwind born. Good, you'll understand why we keep the Defias in our sights; they were Stormwind born too, most of them." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "You're standing on the loose board, friend, so I've known you were there for a while. Come out and buy something." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 20 } },
      text = "Twenty shards, maybe more, and you're walking them through Old Town like a purse of coppers. Most folk who carry that kind of cargo learn to keep it quiet, and you'd do well to learn it too." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Anyone with coin and a quiet voice. Your spirits needn't approve, but they might keep a secret better than most." } },
      choices = {
        { text = "Poisons have no honour, Jasper. I'll pass.", next = "BACK", reply = "Then pass, and keep your honour. I'll keep my customers.", fx = { align = { honor = 1 } } },
        { text = "Coin and quiet. That's a fair arrangement.", next = "BACK", reply = "You'll find me very fair, friend. Quiet and coin, and nothing else changes hands.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd sell poison made from anything that works, friend, and I don't ask whether it was holy before I boiled it. If that troubles you, you'd best not ask what's in the green vials." } },
      choices = {
        { text = "Then I'll be watching what you boil, Jasper, and so will the guard.", next = "BACK", reply = "Watch all you like, friend. The guard buys from me too.", fx = { align = { order = 1 } } },
        { text = "What you sell is your affair, Jasper. I won't ask.", next = "BACK", reply = "A sensible customer. You'll do well on this street.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "SI:7 knows where everything in Old Town comes from, so I keep my books neat and my sources outside the King's lands. A man in my trade stays in business by being useful to Shaw and invisible to everyone else." } },
      choices = {
        { text = "Then you're on the right side, Jasper. Keep it that way.", next = "BACK", reply = "I intend to, friend. The right side pays better.", fx = { align = { order = 1 } } },
        { text = "Invisible to Shaw would be better still.", next = "BACK", reply = "It would, and I'd be dead by spring. I prefer visible and alive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A distraction that leaves no trace of the arcane behind, which pays handsomely in a city full of wizards. Every guard in the Mage Quarter can smell a spell, but none of them can smell powder once the smoke has cleared." } },
      choices = {
        { text = "I'd rather face my enemies with my own magic.", next = "BACK", reply = "Then you'll face them, and they'll know you're coming. Your choice, friend.", fx = { align = { honor = 1 } } },
        { text = "A clean escape is worth any trick, Jasper.", next = "BACK", reply = "It is, and I've a few that'll leave no trace. Come back when you need one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They buy candles, chalk and quiet, and they pay in coin that's always a little warm, which I've decided not to wonder about. I keep their business and SI:7's business on separate shelves, and so far nobody has asked me to choose." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They buy candles, chalk and quiet, and pay in coin that's always a little warm, and now I think I know where the warmth comes from, judging by the heat off your companion. I keep their business and SI:7's on separate shelves, so if it could stop looking at the second shelf, I'd be obliged." },
      },
      choices = {
        { text = "Keep it that way. The city needs its balance.", next = "BACK", reply = "Oh, I'll keep it. Balance is good for business, and business is good for me.", fx = { align = { order = 1 } } },
        { text = "When they ask you to choose, choose the Lamb.", next = "BACK", reply = "Then I'll never be asked, if I'm lucky. Choosing's bad for trade.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Throwing knives, mostly, for when the enemy's a little too far away for that sword. I've sold a few to Barracks men who swear they're only for practice, and I've never once asked them what they practise on." } },
      choices = {
        { text = "I'll take a few knives. Honest use only.", next = "BACK", reply = "Honest use, of course. Everyone says that, and I believe them all.", fx = { align = { honor = 1 } } },
        { text = "Sell me the sharpest, and don't ask questions.", next = "BACK", reply = "Now that's the kind of customer I like. The sharpest, and no questions.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, and some think it's dishonourable, which is a lovely sentiment until a bear's halfway up your leg. I don't take sides, I just take coin." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, and some think it's dishonourable, which is a lovely sentiment until a bear's halfway up your leg. Your {pet} has a good nose, so keep it away from the stock, please. Some of it doesn't smell like what it is." },
      },
      choices = {
        { text = "Poison is no way to hunt. A clean shot is enough.", next = "BACK", reply = "A clean shot's lovely, until it misses. I'll keep a vial for you anyway.", fx = { align = { honor = 1 } } },
        { text = "Whatever brings the beast down, I'll use it.", next = "BACK", reply = "There's a sensible hunter. I've just the thing for bears.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Poison's only a tool, the same as healing, and both get used on people who deserve it and some who don't. I don't sleep any worse than anyone else in Old Town." } },
      choices = {
        { text = "Healing and poison aren't the same, Jasper. You know it.", next = "BACK", reply = "They're not, I suppose, but they're closer than you'd think. Mind how you use yours.", fx = { align = { light = 1 } } },
        { text = "A tool's a tool. It's the hand that matters.", next = "BACK", reply = "Exactly. I'll sleep well tonight, thanks to you.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Here and there, and mostly there, and the guard doesn't ask because the guard buys some of it. SI:7 knows exactly what I sell, {class}, and they're the ones who keep me in business." } },
      choices = {
        { text = "SI:7 or not, the law should know what you sell.", next = "BACK", reply = "Then you'd have to tell SI:7 what they already know, {class}. Go ahead.", fx = { align = { order = 1 } } },
        { text = "If SI:7 protects you, it isn't my place to interfere.", next = "BACK", reply = "That's very wise of you, {class}. You'll go far in this city.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I've nothing for you, unless you've come to bless a vial, and I'll thank you not to." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, at my stall. You'll be wanting to know where my stock comes from, and I'll be wanting you to leave." },
        { id = "h_default", key = true,
          text = "Jasper Fel. I sell the tools of a quiet trade to the people who practise it, and I don't ask what they're for, so long as nobody asks me where I got them." },
        { id = "h_detonator", tags = { "news" }, when = { questActive = TODO_QUEST("Detonation at a Distance") },
          text = "You'll be wanting something that explodes from a safe distance, then. Something to do with your business in Moonbrook, I'd guess, and there's no need to look startled; SI:7 makes a habit of knowing what happens in the King's lands." },
        { id = "h_detonator_done", tags = { "news" }, when = { questDone = TODO_QUEST("Detonation at a Distance") },
          text = "I heard a bang from Westfall went off nicely. You were outside the caves, I trust, since you're standing here." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of ours. You'll want poisons, flash powder and the like, and I've the best in the city, at a fair price for a colleague." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at my stall, which is rare, because your people buy their tricks upstairs in the Sanctum. Still, a bit of flash powder never hurt anyone who threw it the right way." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "One of the Lamb's people, and you'll want something for your shadows, I expect. I don't sell soul shards, mind; you'll have to gather your own." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at my counter. You're not my usual customer, friend, but your coin's as good as anyone's." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, at my stall. I've a little poison for the arrows, if you've a mind to make them bite deeper, though I'd never call it that out loud." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at my stall. Your people know every plant in the forest that kills, I imagine, though you'd likely never admit it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I know your business already, more or less. Do you need anything for your blades, or are your spirits enough?" },
      },
      again = {
        { id = "h_again", text = "Anything else? Softly, please." },
        { id = "h_again2", text = "Yes? Lower your voice." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "You seem to know a lot about Moonbrook.", next = "moonbrook", when = { any = { { questActive = TODO_QUEST("Detonation at a Distance") }, { questDone = TODO_QUEST("Detonation at a Distance") } } } },
        { text = "I'd guess a shady dealer sells all sorts.", next = "wares" },
        { text = "Why keep quiet from my elf friend?", next = "alba",
          when = { any = { { questActive = TODO_QUEST("Detonation at a Distance") }, { questDone = TODO_QUEST("Detonation at a Distance") } } } },
        { text = "Want a gnome to look over that powder?", next = "gnome", when = { race = "Gnome" } },
        { text = "I doubt SI:7 knows where your stock comes from.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What would a mage want with flash powder?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What could a warrior buy from your stall, Jasper?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters use poison on their arrows, Jasper?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Lamb's people trade with you often?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does selling poison ever trouble you, Jasper?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where does your stock come from, Jasper?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you sell poison made from something I'd call sacred, Jasper?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you sell poison to anyone, Jasper?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    moonbrook = {
      big = true,
      lines = { { id = "m_default", text = "SI:7 keeps watch over all of Stormwind's lands, Westfall included, and Moonbrook closest of all these days. Somebody under those hills is poisoning the farmland, and if you mean to blow it up, I'm inclined to help.",
        fx = { learn = { "deadmines", "defias", "moonbrook" } } } },
      choices = {
        { text = "Why not do it yourselves?", next = "moonbrook_why" },
        { text = "Glad to have SI:7 behind me.", next = "BACK", reply = "Good. They'll be behind you, whether you like it or not.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd rather SI:7 wasn't watching me.", next = "BACK", reply = "Too late for that, friend. They're always watching.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonbrook_why = {
      lines = { { id = "mw_default", text = "Because a crown agent caught in Westfall is a scandal, and an adventurer caught there is just unlucky. Be sure you're well outside before you set it off; our engineers' prototypes are reliable, but not that reliable." } },
      choices = {
        { text = "So I take the risk and you take the credit.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wares = {
      lines = { { id = "w_default", text = "Poisons, flash powder, blinding powder, lockpicks and the occasional thing with no name. Most customers are rogues, and the rest are people who'd rather I didn't say." } },
      choices = {
        { text = "Who's the rest?", next = "wares_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wares_rest = {
      lines = { { id = "wr_default", text = "Ask me that again and I'll have to wonder why you want to know. Better you don't, friend, and better I don't wonder." } },
      choices = {
        { text = "Some questions are best unasked. Agreed.", next = "BACK", reply = "Agreed. You'll find I'm very good at not asking too.", fx = { align = { order = 1 }, trait = { discreet = 1 } } },
        { text = "A man who sells poison should answer for who buys it.", next = "BACK", reply = "Then you'd have to start with half the House of Nobles, friend. I'd not bother.", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },

    alba = {
      lines = { { id = "a_default", text = "Because your kaldorei friend in Westfall has her own people to answer to, and SI:7 prefers not to appear in anyone's reports but its own. Tell her an engineer helped you, which is true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "A gnome offering to check my explosives, and I'm meant to feel safer? Go on, then, but if you start humming while you work, I'm leaving the room." } },
      choices = {
        { text = "Your fuses are too short, by the way.", next = "gnome2" },
        { text = "On second thought, I like my eyebrows.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    gnome2 = {
      lines = { { id = "gnome2_l", text = "Too short? I'll have a word with my supplier, quietly, and you'll forget you ever saw the crate. SI:7 appreciates a sharp eye, even one at belt height." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt's the finest school of my trade, and its master makes poisons that could kill a dragon. I've had a few of his vials, and I've never been so jealous of anything in my life." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate buy from me now and then, through people who think I don't know who they work for. I know, and I sell to them anyway, because their gold's as good as anyone's." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The jungle trolls of Zul'Gurub brew poisons that make my stock look like water. I'd like a sample, though I'd not like to collect it myself." } },
    the_stockade = { { id = "tp_the_stockade", text = "A good few of the poisons in the Stockade came from my shelves, though I'll not say how they got there. The prisoners know how to find what they need, which is a skill I respect." } },
    knows = { { id = "tp_knows", text = "Everything that comes through SI:7's door passes my counter sooner or later. Ask carefully, and I'll answer carefully." } },
    background = { { id = "tp_bg", text = "I sell supplies to SI:7. Before that, I sold them to somebody else, and that's all I'll say." } },
    advice = { { id = "tp_ad", text = "Never tell a man more than he needs to know, and never trust a man who tells you more than you need. Both will get you killed." } },
    si7 = { { id = "tp_si7", text = "You're standing in SI:7, friend, so mind your voice." } },
    _none = { { id = "tp_none", text = "I don't sell that kind of information. Or any kind, to you, today." } },
  },
}
