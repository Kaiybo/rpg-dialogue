-- Gryan Stoutmantle, Sentinel Hill. Voice: bibles/gryan.md
-- Silver Hand-trained, Westfall-born, holding his homeland together with farmers.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gryan", id = TODO_NPC("Gryan Stoutmantle"), name = "Gryan Stoutmantle", title = "The People's Militia",
  bible = "bibles/gryan.md", role = "questgiver", tier = "major",
  communities = { "sentinel_hill" }, temper = { "steady" }, values = { "brave", "lawful", "kind" },
  spiritSensitive = true,
  prejudice = { class = "WARLOCK", amount = 12, why = "Fought the Horde in the Second War and saw what its warlocks did to men and land." },
  notices = { "reputation", "paladin" },
  impression = {
    first = "He hasn't owned a dry pair of socks since spring.",
    third = "{name} met Gryan Stoutmantle at Sentinel Hill, who raised the People's Militia to reclaim his homeland.",
  },

  greetings = {
    { id = "hum_g1", when = { race = "Human" }, priority = 5,
      text = "Another of Stormwind's children, come to see what the kingdom left behind. Welcome to Sentinel Hill, and I mean it, even if the welcome's thinner than it ought to be." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I saw what demon magic did to the Horde's own lands, and I fought the men it made in the Second War. Westfall has troubles enough without a demon-caller at my map table." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I'll not pretend I can't tell what you are. Say what you need from the Militia, and keep that creature of yours outside the tower." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've done right by Westfall more than once, and I've told the farmers so. I still don't care for what you carry, but I'll shake your hand." },
    { id = "g_op_militia_admire", when = { opinion = { topic = "peoples_militia", stance = "admire" } }, text = "Word comes up the road that you've been speaking well of the Militia, even as far as Lakeshire. The farmers stand straighter for it, and so do I." },
    { id = "g_op_tithe", when = { gossip = { topic = "westfall_tithe", stance = "militia" } }, text = "Saldean sent a cart of turnips up the hill this week instead of the city tithe, and he says it was your idea. I'll not refuse turnips, but you'll answer to the tax clerks." },
    { id = "g_op_bolvar_trust", when = { opinion = { topic = "bolvar", stance = "trusted" } }, text = "Here's the one who still trusts the Regent. I hope you're right, and I'd ask you to write and tell him so, because he'll not hear it from me." },
    { id = "g_hill", text = "Welcome to Sentinel Hill, such as it is. Find a spot out of the wind." },
    { id = "g_sent", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") }, text = "Another one from Elwynn, and glad I am of it. Come up out of the wind; I'll not keep you standing." },
    { id = "g_militia", when = { questDone = TODO_QUEST("The People's Militia") }, text = "There's one of my own militia. Report, then, and tell me how the roads look." },
    { id = "g_hero", when = { townStanding = { town = "sentinel_hill", min = 55 } }, text = "The hill has started saying your name alongside mine. Mind you live up to it; I'm still trying to live up to my own." },
    { id = "g_distrust", when = { townStanding = { town = "sentinel_hill", max = -20 } }, text = "Say what you came to say, and then be on your way." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone from the hill {away}, and I'll not pretend I didn't count. Come up out of the wind and tell me how the roads look." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "You've been away {away}, and you've come back a harder soldier than you left. I've seen that change in men before, so mind it doesn't take more than it gives." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You were green as Elwynn grass when you first climbed this hill, and you're not now. Westfall needs exactly what you've become." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The militia tell me you've been doing good work for the hill these past days. That's how we take Westfall back, one farm and one favour at a time." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear one of my people caught you in a lie. Thieves run this land on lies, so I'll thank you to tell me the truth on this hill." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "You carry yourself like the Silver Hand taught you. I know the walk; I learned it in Lordaeron. Don't let anyone tell you it's for parade grounds." },
    { id = "n_hero", cat = "reputation", place = "before", when = { townStanding = { town = "sentinel_hill", min = 30 } },
      text = "Some of my militia want to follow you into Moonbrook, and the rest want to know where you were last year." },
  },

  start = "hello",
  nodes = {
    op_bolvar = {
      lines = {
        { id = "op_bolvar_a", text = "By sight and by reputation, and he was a better knight than I'll ever be. Now he sits in the Keep while Westfall burns, and I can't tell whether that's his doing or the court's. You may have stood in that throne room, so what do you make of him?" },
      },
      choices = {
        { text = "He's a good man, Gryan. The court ties his hands.", next = "op_bolvar_1", fx = { opinion = { bolvar = "trusted", stormwind = "patience" }, align = { order = 1 } } },
        { text = "He's forgotten his oath. Uther would never have abandoned Westfall.", next = "op_bolvar_2", fx = { opinion = { bolvar = "soft", westfall = "abandoned" }, align = { order = -1 }, affinity = 1 } },
        { text = "He's a regent for a boy. He can't be everywhere at once.", next = "op_bolvar_3", fx = { opinion = { bolvar = "tired" }, trait = { practical = 1 } } },
        { text = "The Order taught us both. I'd trust him with my life.", next = "op_bolvar_4", when = { class = "PALADIN" }, fx = { opinion = { bolvar = "trusted", silver_hand = "respect" }, affinity = 2 } },
        { text = "I've never met the man, Commander.", next = "BACK" },
      },
    },
    op_bolvar_1 = {
      lines = { { id = "op_bolvar_r1", text = "I've told myself the same on bad nights, and it helps a little. If you see him again, tell him the hill still holds, and that we'd hold better with fifty spears." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    op_bolvar_2 = {
      lines = { { id = "op_bolvar_r2", text = "Careful, now; I said that once in Stormwind and they've not asked me back since. You're not wrong, mind, and that's the part that stings." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    op_bolvar_3 = {
      lines = { { id = "op_bolvar_r3", text = "No, and I can't either, and that's why I've a captain and a scout and a hill full of farmers. I'll give him that much, and grudge him the rest." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    op_bolvar_4 = {
      lines = { { id = "op_bolvar_r4", text = "Then I'll trust your judgement, since it's the Order's judgement too. Light keep him honest in that chair, because it's a heavier one than any armour." } },
      choices = { { text = "Something else, Commander.", next = "BACK" } },
    },
    xcl_stocks = {
      big = true,
      lines = { { id = "xcl_stocks_default", text = "Good, though I'll tell you plainly that Westfall won't feel it. The men in that prison have been out of the fight for years, and the ones burning our farms are still out there, so a quiet Stockade means a quiet city and nothing more for us." } },
      choices = {
        { text = "Justice in the city still matters, Gryan. It's a start.", next = "BACK", reply = "A start it is, and I'll not sneer at it, because the law has to begin somewhere. I only wish it would walk a little further west.", fx = { align = { order = 1 } } },
        { text = "You're right. Westfall needs swords here, not jailers there.", next = "BACK", reply = "Glad you see it that way. Bring that sword up the hill, and we'll put it where the farms need it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Did you know Thredd, before all this?", next = "xcl_stocks2" },
      },
    },
    xcl_stocks2 = {
      lines = { { id = "xcl_stocks2_default", text = "Only by name, from the Watch's reports after the stonemasons marched on the House of Nobles over their wages. Thredd was angry then, and I can't fault a man for that, but anger and a knife made something else of him." } },
      choices = {
        { text = "Anger needs a better road than the Brotherhood's.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Then you've walked past the towers the Stonemasons raised there, and you know the city never paid them in full. I've nothing against the Mage Quarter, but I'd not have you think Stormwind's hands were ever as clean as its streets." } },
      choices = {
        { text = "The Masons were wronged, but VanCleef's road is worse.", next = "BACK", reply = "That's my thinking exactly, and I'm glad to hear it from someone who's seen the towers. A wrong can be righted without burning a farmhouse.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The nobles cheated them. Stormwind earned this.", next = "BACK", reply = "Earned a wrong, maybe, but not this, not burned farms and dead families. The farmers never cheated anyone.", fx = { align = { order = -1 } } },
        { text = "What happened with the Stonemasons?", next = "masons" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I fought the Horde when its warlocks were burning Lordaeron, so I'll not thank you for that. Still, I lead a militia of farmers and broken men, and I'll judge you by what you do on this hill, not by what follows you onto it." } },
      choices = {
        { text = "Judge me, then. I'll answer for every deed.", next = "BACK", reply = "Then you'll have a place here, and I'll be watching every deed. That's fair to both of us.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll do whatever wins, Gryan, however it looks.", next = "BACK", reply = "However it looks matters, out here, because the farmers are watching. Win the right way or don't come back to my hill.", fx = { align = { honor = -1 } } },
        { text = "Tell me about the People's Militia.", next = "militia" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "I know it is. Nobody has turned a furrow in Moonbrook for years, and the harvest golems the Defias stole have torn up what was left. If you can coax anything green out of it, the farmers will remember you longer than they remember me." } },
      choices = {
        { text = "I'll mend what I can, and leave the rest stronger.", next = "BACK", reply = "That's all any of us can do, and more than most try. The farmers will thank you with a harvest, if one ever comes.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The land will heal itself once the people leave it be.", next = "BACK", reply = "The land's been left be for years, and the Defias moved onto it. It needs people, druid, the right ones.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hu_famine = {
      lines = {
        { id = "hum_famine", key = true,
          text = "One small decision at a time, friend, which is how most kingdoms fail their own. The crown bled the province for the Alliance's war and its debts, the harvests failed, the masons went unpaid, and by the time anyone in the Keep looked west, Westfall had stopped looking east." },
      },
      choices = {
        { text = "And the House of Nobles let it happen?", next = "hu_famine2" },
        { text = "Something else, Stoutmantle.", next = "BACK" },
      },
    },
    hu_famine2 = {
      big = true,
      lines = {
        { id = "hum_famine2",
          text = "Lady Prestor tells the Regent that Westfall can wait, and the House agrees with her, because waiting costs them nothing. I don't hate the nobles, friend, but I've learned that the folk who never miss a meal are the slowest to believe anyone else might." },
      },
      choices = {
        { text = "Then we stop waiting for them. The Militia's enough.", next = "BACK",
          reply = "It has to be, for now, and I'm proud of every farmer on this hill. But I'd still trade a royal speech for one company of footmen, and I'll keep asking for it.",
          fx = { align = { order = -1 }, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "The crown will come back to Westfall. Keep faith.", next = "BACK",
          reply = "I hope you're right, and I've not stopped writing. Keep faith if you can, friend, because some of my farmers have lost theirs, and someone on this hill ought to hold it for them.",
          fx = { align = { order = 1 }, opinion = { stormwind = "patience" } } },
        { text = "I'll be on my way, Stoutmantle.", next = "END" },
      },
    },
    hu_north = {
      lines = {
        { id = "hum_north", key = true,
          text = "I did, under the Silver Hand's teachers and later in the Alliance's ranks. I'll not talk about the end of Lordaeron, friend, because I've no words for it that I'd want a farmer to overhear." },
      },
      choices = {
        { text = "Then tell me what it was like before.", next = "hu_north2" },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    hu_north2 = {
      lines = {
        { id = "hum_north2",
          text = "Green, and proud, and full of people who'd have laughed at the idea of a famine. King Terenas fed Stormwind's refugees for years after the First War without counting the cost, and when I see Lordaeron's folk begging at our gates now, I remember who fed whom first." },
      },
      choices = {
        { text = "Our people should remember that too. Something else.", next = "BACK" },
        { text = "I'll be on my way, Stoutmantle.", next = "END" },
      },
    },
    hu_what = {
      lines = {
        { id = "hum_what", key = true,
          text = "To my mind it means you don't get long, so you'd best spend it on someone else. My farmers have nothing, and still they stand watch on this hill for neighbours who've already fled, and if that isn't what we're for, I don't know what is." },
      },
      choices = {
        { text = "Something else, Stoutmantle.", next = "BACK" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    hello = {
      lines = {
        { id = "hum_h1", when = { race = "Human" },
          text = "You'll have heard the talk in the city, that Westfall's all thieves now and the land's gone to dust. Look around you and judge for yourself, because these are our own people, and the city's half forgotten it." },
        { id = "dd_murkeye_gryan", when = { questDone = TODO_QUEST("The Coastal Menace") },
          text = "Captain Grayson's light burns a little steadier, they tell me, now that Old Murk-Eye is gone from the shore. I don't pretend to understand a ghost keeping a lighthouse, but I understand a coast made safe, and that's your work." },
        { id = "dd_bandanas_gryan", when = { questDone = TODO_QUEST("Red Leather Bandanas") },
          text = "Scout Galiaan brought me a sack of red bandanas with your name tied to it. Every one of those is a man who won't stand in front of a farmhouse with a torch again, and I've not forgotten it." },

        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "You've the look of {alt}, a {altclass} who stood with the People's Militia on this hill when we had precious few to stand. If that's kin of yours, then Westfall already owes your family something." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "{alt} came up the hill not long ago with a sack of red bandanas and a report I'd have been proud of from a sergeant. Between that one and you, I'm almost tempted to think Stormwind remembers us after all." },
        { id = "h_cl_stocks", tags = { "news" }, when = { cleared = "The Stockade", faction = "Alliance" },
          text = "I hear the Stockade riot's done and Bazil Thredd with it, and that you were the one who ended it. Thredd was one of Edwin's lieutenants, and I'd hoped he'd hang in Westfall where the farmers he robbed could watch." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Defias", min = 40 } }, text = "Word reaches the hill of Defias found dead in the fields, and more of them than I'd dare hope for. The People's Militia thanks you, and I'll thank you myself, because every one of those masks was a farm we couldn't hold." },
        { id = "h_druidx", when = { race = "NightElf", class = "DRUID" },
          text = "A druid of the kaldorei, out on my hill. I hope the land tells you something kinder than it tells me." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I came home from the Second War having seen what the orcs' warlocks did to men and land alike. I'll hear your business, but I won't pretend I'm glad of you." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've bled for these fields, and I don't forget that, whatever company you keep. Speak your mind; I'm listening." },
        { id = "h_default", text = "I'm Gryan Stoutmantle, born and raised in Westfall. I came home from the war to find it in the hands of thieves, so I'm taking it back, one farm at a time." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Elwynn sends me volunteers now, never soldiers, but volunteers will do. Volunteers are what built this militia in the first place." },
        { id = "h_militia_before", when = { questBefore = TODO_QUEST("The People's Militia") },
          text = "My scouts have marked Defias camps from the coast to Moonbrook, and all I have to answer them with is farmers with pitchforks, and not enough of those. You, though, would do nicely." },
        { id = "h_militia_active", tags = { "news" }, when = { questActive = TODO_QUEST("The People's Militia") },
          text = "Bring down those Defias and the farmers sleep a night without one eye open. That's the whole of the war, out here." },
        { id = "h_militia_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The People's Militia"), days = 3 } },
          text = "That camp's gone quiet, and a man walked all the way up the hill this morning just to tell me so. That's what you bought: one farmer who wasn't afraid, for one morning." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "You went under Moonbrook and walked out again. Edwin VanCleef has had his own way down there too long. Now he knows we can reach him." },
        { id = "h_paladin", when = { class = "PALADIN", minLevel = 12 },
          text = "A paladin. It wasn't the Light that sent me home from the north, it was Westfall, but the Light came along with me and made itself useful." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest on my hill, is it? The militia will want a blessing before every patrol, so give them the first few, and after that they'll be content just to stand near you." },
        { id = "h_wiley", when = { heardLine = "wiley.h_defias" },
          text = "Wiley talked to you? Then you've had the truth with no manners attached. I should have left him where I found him, though I'm glad I didn't." },
        { id = "h_light", when = { alignment = { axis = "light", min = 40 } },
          text = "There's a decency about you, I'd say, and out here that's rarer than iron. Don't spend it all in one place." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Your people lost a home and kept going. So did mine, out here. That's a better start than most of my volunteers had." },
        { id = "h_count", when = { metBefore = true }, text = "I walked the wall at dawn and counted the militia, then counted them again. It's still not enough, but nobody slipped away in the night, and that makes it a good morning in these parts." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Look out there, at farms that had a lamp in every window once. I count the dark ones every night, and I'd like very much to stop counting." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There you are. The lads were asking after you, and so was I, though don't tell them I said so; Sentinel Hill feels a little steadier with you on it." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "I'll take any help Westfall can get, but I'll not pretend I'm glad to see you. Speak your piece." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? Ask it now, while it's quiet; quiet hours never last long out here." },
        { id = "h_again2", text = "Go on, the map will keep for a minute." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask away; I'm up until the watch changes anyway." },
      },
      choices = {
        { text = "Your fields are sick, Stoutmantle. The soil itself is starving.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Westfall looks like it's been left to rot.", next = "westfall" },
        { text = "Why doesn't Stormwind help?", next = "stormwind" },
        { text = "Someone must be leading the Defias.", next = "leader" },
        { text = "How does someone join the militia?", next = "militia" },
        { text = "Tell me about yourself, Commander.", next = "gr_self" },
        { text = "I took the Silver Hand's oath too.", next = "paladin", when = { class = "PALADIN" } },
        { text = "Who says the words over your dead?", next = "priest", when = { class = "PRIEST" } },
        { text = "I grew up on a farm out here.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "About Magistrate Solomon's letter.", next = "solomon", when = { questActive = TODO_QUEST("Messenger to Westfall") } },
        { text = "VanCleef is dead. What happens now?", next = "after", when = { deed = "dungeon:The Deadmines" } },
        { text = "Bazil Thredd is dead, Gryan. The Stockade riot is over.", next = "xcl_stocks", when = { cleared = "The Stockade", faction = "Alliance" } },
        { text = "I'm at your service.", next = "END", reply = "Good, and welcome to Sentinel Hill. Find Danuvin, and he'll put you to work before your boots are dry.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Put me on the wall, Stoutmantle. I'm a soldier.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I can track the Defias through these hills.", next = "hunter", when = { class = "HUNTER" } },
        { text = "The land here is grieving, Stoutmantle. I can hear it.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "My father was a Stonemason. The nobles never paid him.", next = "mason_child", when = { origin = "human_stonemason_child" } },
        { text = "The Sentinels would never abandon a province like this.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "I studied in Stormwind's Mage Quarter, Gryan.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What follows me fights for Westfall now, Stoutmantle. Don't ask what it is.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How did Stormwind let Westfall come to this?", next = "hu_famine", when = { race = "Human" } },
        { text = "You served in Lordaeron, didn't you, Stoutmantle?", next = "hu_north", when = { race = "Human" } },
        { text = "What does being human mean to you, Stoutmantle?", next = "hu_what", when = { race = { "Dwarf", "Gnome", "NightElf" } } },
        { text = "I'll help, but I answer to no militia.", next = "END", reply = "That's your right, and I'll not hold it against you. Help however you will, and the farmers will remember it.", fx = { align = { order = -1 } } },
      },
    },

    westfall = {
      lines = {
        { id = "w_default", key = true,
          text = "Westfall fed the whole kingdom once. After the Second War the farms went fallow and the Defias moved in, and families were driven off their own land at knifepoint." },
      },
      choices = {
        { text = "And you came back for it.", next = "back" },
        { text = "Some folk must still hold out.", next = "holdouts" },
        { text = "I'll help you take it back.", next = "BACK", reply = "Then you're welcome at Sentinel Hill, and I'll be glad of the help. Every Defias you drive off this land is one more family that might come home.", fx = { affinity = 2, learn = { "westfall" }, align = { order = 1 } } },
        { text = "Maybe the Defias have earned a share of it.", next = "BACK", reply = "A share of what, the graves they've dug? I'll hear that from a farmer who lost nothing, and I've yet to meet one.", fx = { align = { order = -1 } } },
      },
    },
    holdouts = {
      lines = {
        { id = "ho_default", text = "There's Saldean, who won't budge, and the Furlbrows, who tried to leave and couldn't. There are even a few who still send the city its tithe every year, though the city never writes back.",
          fx = { learn = { "westfall" } } },
      },
      choices = {
        { text = "Why pay a city that left them?", next = "tithe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tithe = {
      lines = { { id = "ti_default", text = "Habit and pride, mostly, and some hope that somebody in the Keep reads the ledger and remembers us. I'd have stopped paying years ago, but I'm glad they haven't." } },
      choices = {
        { text = "That's a stubborn kind of loyalty.", next = "BACK", reply = "It is, and I'll own it gladly. Stubbornness is half of what's kept this hill standing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd have stopped paying years ago.", next = "BACK", reply = "Many have, and I don't blame them. But someone has to show the Keep that Westfall hasn't given up on the kingdom.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    back = {
      big = true,
      lines = {
        { id = "b_default", text = "I left the Third War carrying things I'd rather not. Lordaeron burned and I couldn't save it, but this land I can save." },
        { id = "b_squire", when = { origin = "human_paladin_squire" },
          text = "You squired for the Silver Hand; you know what Lordaeron cost us. Some of us went home to make sure it didn't cost everything." },
      },
      choices = {
        { text = "Then let's save it.", next = "BACK", reply = "Good, then we'll start with the next farm over. I'm glad to have you.", fx = { affinity = 2, align = { light = 1, order = 1 }, trait = { brave = 1 } } },
        { text = "Save what you like. I'll look after myself.", next = "BACK", reply = "Then look after yourself, and if you've a moment to spare, look after a farmer too. That's all I ask.", fx = { align = { light = -1 } } },
        { text = "You can't save everything.", next = "everything", fx = { trait = { skeptical = 1 } } },
        { text = "What did you see in Lordaeron?", next = "lordaeron" },
      },
    },
    everything = {
      lines = { { id = "e_default", text = "True enough, so you pick something worth the trying. I picked here." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
    lordaeron = {
      big = true,
      lines = { { id = "lo_default", text = "I was at Stratholme, and that's all I'll say of it, which is more than I tell most." } },
      choices = {
        { text = "Then I won't ask again.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "If you ever want to set it down, I'm a priest.", next = "BACK", when = { class = "PRIEST" },
          fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Some things are better buried than confessed, Commander.", next = "BACK", reply = "They are, and you understand that better than most who come up this hill. Thank you.", when = { class = "PRIEST" }, fx = { align = { light = -2 } } },
        { text = "Silence won't heal it.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    stormwind = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "The House of Nobles went rotten, and the city's busy with its own troubles. Nobody's coming for us, so we stopped waiting and saw to it ourselves.",
          fx = { hear = "stormwind_abandoned_westfall" } },
        { id = "s_bolvar", when = { heardLine = "bolvar.t_westfall" },
          text = "The Highlord said that, did he? I believe he means it, but I'll believe in his soldiers when I see them on the road." },
      },
      choices = {
        { text = "The city should be ashamed.", next = "BACK", fx = { opinion = { westfall = "abandoned" }, affinity = 1 } },
        { text = "The kingdom has bigger problems.", next = "bigger", fx = { opinion = { westfall = "patience" } } },
        { text = "Someone in the city must have decided this.", next = "nobles" },
      },
    },
    bigger = {
      lines = { { id = "bg_default", text = "Bigger than its own breadbasket? Then it'll be hungry while it solves them." } },
      choices = { { text = "Point taken. Something else.", next = "BACK" } },
    },
    nobles = {
      lines = { { id = "no_default", text = "Someone in the House of Nobles keeps telling the Regent that Westfall can wait. I don't know who, but I know they've never stood on this hill." } },
      choices = {
        { text = "Then somebody should find out who.", next = "BACK", reply = "Aye, and I've half a mind to ride to Stormwind and ask it myself. But a soldier who questions the House of Nobles finds himself posted somewhere colder, so I'll need friends who can ask for me.", fx = { trait = { curious = 1 }, align = { order = -1 } } },
        { text = "It isn't our place to question the House of Nobles.", next = "BACK", reply = "It's my place to ask, as a man of Westfall, even if no one answers. But I'll not trouble you with it further.", fx = { align = { order = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },

    leader = {
      lines = {
        { id = "l_default", text = "Someone who knows Stormwind's stones too well. My scouts and the city's quieter friends are working on a name. When I have it, you'll have it." },
        { id = "l_known", key = true, when = { deed = "dungeon:The Deadmines" },
          text = "Edwin VanCleef, a stonemason once. He helped build the city that wouldn't pay him, and he's never forgiven it." },
      },
      choices = {
        { text = "How will you get the name?", next = "hunt" },
        { text = "I'll keep my ears open.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    hunt = {
      lines = {
        { id = "hu_default", text = "There's a rogue called Wiley in the Lakeshire inn who owes me his life. He'll hate telling me what he knows, which is how I'll know it's true." },
        { id = "hu_active", when = { questActive = TODO_QUEST("The Defias Brotherhood") },
          text = "You're on the trail already. Follow it where it goes and bring every scrap back to me. I'll do the sorting." },
      },
      choices = {
        { text = "Wiley must owe you plenty.", next = "wiley" },
        { text = "Wiley's note says goblins built the watchers.", next = "watchers_truth", when = { heardLine = "wiley.h_defias" } },
        { text = "What about the stonemasons people mention?", next = "masons" },
        { text = "Send me in. I go where soldiers can't.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "rg_default", text = "One of your trade, Wiley, already owes me his life, and I'd sooner not be owed by two. Go where my farmers can't, then, and bring me back the truth." } },
      choices = {
        { text = "The truth, and nothing I pocket on the way.", next = "BACK", reply = "That's a rare promise from a rogue, and I'll take you at your word. Go carefully.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Mostly the truth.", next = "BACK", reply = "Mostly, {g:he|she} says, and grins, just like Wiley. I'll take what I get, I suppose.", fx = { affinity = -1, align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },
    wiley = {
      lines = { { id = "wi_default", text = "I saved his neck once, and he's never forgiven me for it. Some men can't bear to owe a debt, even a kind one." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    watchers_truth = {
      lines = {
        { id = "wt_default", text = "Goblin work, bought with Defias coin and set in the fields to frighten superstitious farmers, and it worked. Don't tell Saldean just yet, or he'll go after the goblins with a pitchfork.",
          fx = { expose = "watchers_set_loose", learn = { "harvest_watchers" } } },
      },
      choices = {
        { text = "Wiley says this was never about farms.", next = "wt_farms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wt_farms = {
      big = true,
      lines = { { id = "wf_default", text = "It's about farms to me. Let Wiley lose sleep over what they're building under Moonbrook. I'll lose mine over whose fields they're standing in." } },
      choices = {
        { text = "Both matter.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Then the farms come first.", next = "BACK", reply = "Good, because that's what I'm fighting for. Wiley can lose sleep for both of us.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Whatever's under Moonbrook matters more than any field.", next = "BACK", reply = "Maybe so, and Wiley would agree with you. But a farmer can't eat a secret.", fx = { align = { light = -1 } } },
      },
    },
    masons = {
      big = true,
      lines = {
        { id = "ma_default", text = "The Stonemasons' Guild rebuilt Stormwind and the nobles wouldn't pay them, and that's a true wrong. It still doesn't buy them a single farm out here.",
          fx = { learn = { "defias" } } },
        { id = "ma_vancleef", when = { deed = "dungeon:The Deadmines" },
          text = "I knew VanCleef's name long before any of this: clever, tireless, proud of good work. It still unsettles me to think what a man like that became." },
      },
      choices = {
        { text = "They were cheated. Can you blame them?", next = "masons_blame" },
        { text = "No grievance excuses murder.", next = "BACK", reply = "No, it doesn't, and I'll say so to their faces if I ever get the chance. Thank you for seeing it.", fx = { affinity = 1, align = { order = 1 }, opinion = { defias = "hardline" } } },
        { text = "The nobles cheated them first, and I'd have fought too.", next = "BACK", reply = "Then you'd have been wrong, as they are. Fight the nobles if you must, but leave the farmers out of it.", fx = { align = { order = -1 } } },
        { text = "Masons built the Cathedral I pray in.", next = "masons_cathedral", when = { class = "PRIEST" } },
      },
    },
    masons_blame = {
      lines = { { id = "mb_default", text = "Blame the nobles for the debt and the masons for the knives; I can do both before breakfast. The farmers they've robbed never owed them a copper." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { defias = "masons_wronged" } } } },
    },
    masons_cathedral = {
      lines = { { id = "mc_default", text = "Then pray for them there, and for the farmers they've robbed as well. If the Light can hold both at once, it's bigger than I am." } },
      choices = {
        { text = "It is. I'll pray for both.", next = "BACK", reply = "Then you're a better man of faith than I am. I'm grateful someone can.", fx = { affinity = 2, align = { light = 2 } } },
        { text = "I'll pray for the farmers. The thieves chose their road.", next = "BACK", reply = "That's fair, and it's what I'd do, if I could pray at all. The farmers will thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    militia = {
      lines = {
        { id = "mi_default", text = "Three tasks, each further south than the last. Do them and I'll take your oath myself. These farmers have had enough of strangers who quit halfway." },
        { id = "mi_done", when = { questDone = TODO_QUEST("The People's Militia") },
          text = "You've done the work and you've had my word on it, so wear it well and don't make me sorry I gave it." },
      },
      choices = {
        { text = "Who serves in it?", next = "militia_who" },
        { text = "An oath? Sworn to what?", next = "oath" },
        { text = "Something else.", next = "BACK" },
      },
    },
    militia_who = {
      lines = { { id = "mw_default", text = "Farmers, mostly; Danuvin was one himself before I made him a captain. Galiaan maps the thieves and Riell watches from the tower, and not one of them is paid a copper." } },
      choices = {
        { text = "Then they're braver than soldiers.", next = "BACK", fx = { affinity = 1, learn = { "people_militia" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "people_militia" } } },
        { text = "How long can they really hold, Commander?", tag = "Persuade", next = "militia_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { questDone = TODO_QUEST("The People's Militia") } } } },
          fail = { next = "militia_hold", fx = { affinity = -1 } } },
      },
    },
    oath = {
      big = true,
      lines = { { id = "oa_default", text = "To the people of these farms, and to the Light: the Light because it's what I was taught, and the people because they're who we're fighting for." } },
      choices = {
        { text = "Then I'll swear it.", next = "BACK", reply = "Then welcome, truly, and the people of these farms are yours to keep safe. That's no light thing.", fx = { affinity = 2, align = { light = 1, order = 1 }, standing = { sentinel_hill = 2 } } },
        { text = "I'll fight. I won't swear.", next = "BACK", reply = "That's fair, and I'll not ask more. A sword's worth as much as an oath, out here.", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
      },
    },

    paladin = {
      lines = { { id = "pa_default", text = "Then you know what it asks of a man. The Order's been scattered since Lordaeron, but the oath didn't scatter with it." } },
      choices = {
        { text = "The Light must feel far away out here.", next = "paladin_light" },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_light = {
      lines = { { id = "pl_default", text = "Every morning I ask it to help me keep these people alive, and most mornings it does. The other mornings, I do it myself." } },
      choices = {
        { text = "That's a prayer too.", next = "BACK", reply = "Maybe it is, and I'll not argue the point. Either way, they're still alive this morning.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Then it's you keeping them alive, not the Light.", next = "BACK", reply = "Maybe, but I'd rather think the Light's in my hands than nowhere. Let me keep that.", fx = { align = { light = -1 } } },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "Nobody fit for it, I'm afraid; there's no chaplain on this hill. I say what I can over the graves, and the families are kind enough not to tell me it isn't the same." } },
      choices = {
        { text = "Let me say the words next time.", next = "priest_words" },
        { text = "And the Defias dead?", next = "priest_defias" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_words = {
      lines = { { id = "pw_default", text = "I'll hold you to that, priest, because there'll be a next time. There always is, out here." } },
      choices = {
        { text = "I'll be here.", next = "BACK", reply = "Good, because they'll need you, and so will I. Thank you, priest.", fx = { affinity = 2, align = { light = 2 }, standing = { sentinel_hill = 2 } } },
        { text = "Don't count on me. I go wherever the work is.", next = "BACK", reply = "Then I'll not count on you, but I'll hope. That's the way of this hill.", fx = { align = { light = -1 } } },
      },
    },
    priest_defias = {
      big = true,
      lines = { { id = "pd_default", text = "We bury them too. A lot of them were Stormwind men with Stormwind mothers, and someone ought to pray for them, but I find I can't." } },
      choices = {
        { text = "I can.", next = "BACK", reply = "Then I'm grateful, more than I can say. Someone should, and it can't be me.", fx = { affinity = 1, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "They chose their road.", next = "BACK", reply = "They did, and their mothers didn't. I'll leave it there.", fx = { align = { light = -2 }, trait = { stern = 1 } } },
      },
    },

    farmhand = {
      lines = { { id = "fh_default", text = "Then you've come home. Don't tell me which farm, though, or I'll have to tell you who sleeps in it now." } },
      choices = { { text = "Thieves, I suppose.", next = "farmhand_home" } },
    },
    farmhand_home = {
      lines = { { id = "fh2_default", text = "Thieves, or watchers, or nobody. Help me clear it, and you can tell me its name when it's yours again." } },
      choices = {
        { text = "I will.", next = "BACK", reply = "Then let's go and clear it, and I'll be glad to hear its name. Welcome home, or nearly.", fx = { affinity = 2, align = { order = 1 }, standing = { sentinel_hill = 2 } } },
        { text = "I left for a reason.", next = "BACK", reply = "Many did, and I don't blame them. But it's still yours, if you ever want it.", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
      },
    },

    noble = {
      lines = { { id = "nb_default", text = "Then you know the men who decided we could wait. Tell them Westfall's still waiting. Tell them we've stopped being polite about it." } },
      choices = {
        { text = "Not all of us forgot you.", next = "noble_defend" },
        { text = "I'm ashamed of them.", next = "BACK", reply = "Shame's a start, but I'd rather have a letter in their hands. Tell them anyway.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "My family has its reasons, and I'll keep them.", next = "BACK", reply = "Then keep them, and I'll keep my opinions. Westfall's still waiting either way.", fx = { align = { honor = -1 } } },
      },
    },
    noble_defend = {
      lines = { { id = "nd_default", text = "Some of my farmers still send the city a tithe. I'll believe in the ones who remember us when something comes back down that road." } },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },

    solomon = {
      big = true,
      lines = { { id = "so_default", text = "I've read it. He wants my men to hold Lakeshire until the King's reserves come. He doesn't know the war we fight here, or he'd never have asked." } },
      choices = {
        { text = "What will you tell him?", next = "solomon_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    solomon_answer = {
      lines = { { id = "sa_default", text = "I'll tell him my heart's heavy for every good man he loses, and that I lose mine the same way, for the same reason. Nobody's coming, for either of us." } },
      choices = {
        { text = "He'll understand.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then the two of you should stand together.", next = "BACK", reply = "We would, if there were a road between us that didn't run through orcs and gnolls. I'll write back, at least.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Then stop waiting on Stormwind and go your own way.", next = "BACK", reply = "And go where? Westfall is mine and Redridge is his, and neither of us is leaving it. We'll wait, and fight.", fx = { align = { order = -1 } } },
      },
    },

    after = {
      big = true,
      lines = { { id = "af_default", text = "VanCleef's gone, and though the Brotherhood isn't, not yet, this is the beginning of its end. Now the farmers can come home, if they dare." } },
      choices = {
        { text = "Will Stormwind come now?", next = "after_city" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_city = {
      lines = { { id = "ac_default", text = "Now that the digging and the burying's done? Likely enough, since they'll want their tithe. Let them come, and let them see what we kept alive without them." } },
      choices = {
        { text = "You've earned the right to say so.", next = "BACK", fx = { affinity = 2, opinion = { westfall = "abandoned" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    militia_truth = {
      big = true,
      lines = {
        { id = "mt_default", text = "One more winter, if the watchers don't take the last good fields and the gnolls stay this side of the river. I tell the farmers we'll hold as long as it takes, and they believe me because they've nothing else to believe." },
        { id = "mt_after", text = "After that it's Danuvin and Galiaan and a handful of the stubborn ones on this hill, and the rest of Westfall walking the road to Goldshire like the Furlbrows tried to. Keep that to yourself; it's not a thing they need to hear from anyone but me." },
        { id = "mt_priest", when = { class = "PRIEST" }, text = "You've a priest's way of asking, so you'll get the truth a priest would: I pray every night that I'm wrong about the winter, and I plan every morning as though I'm right." },
      },
      choices = {
        { text = "Then we make sure it doesn't come to that.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Your secret's safe with me, Commander.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    militia_hold = {
      lines = {
        { id = "mh_default", text = "As long as it takes. That's the answer I give the farmers, and it's the one you'll get too, because a commander who doubts aloud soon has nobody left to command." },
        { id = "mh_default2", text = "They'll hold, because they've nowhere else to go and nobody else coming. Ask me something I can answer without frightening the lads at the gate." },
      },
      choices = {
        { text = "Understood, Commander.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "warrior_l", text = "There's no wall, friend, only a hill and a tower and men who used to be farmers. But if you want a post, take the road to Moonbrook at dusk and stand where the Defias can see you; they've grown used to nobody standing anywhere." },
        { id = "warrior_guard", when = { origin = "human_city_guard" },
          text = "A Watch soldier, come out from the city on your own? That's more than the Keep has sent me this year. There's no wall here, only a hill, but take the Moonbrook road at dusk and stand where the Defias can see you." },
      },
      choices = {
        { text = "Then I'll stand there.", next = "warrior2", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "You could march on Moonbrook.", next = "warrior_march" },
      },
    },
    warrior2 = {
      lines = { { id = "warrior2_l", text = "Then you'll be the first soldier this province has seen in a season. Come back and tell me who blinked first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior_march = {
      lines = { { id = "warrior_march_l", text = "With what? Danuvin's drilled farmers and Galiaan's map? The Defias have the mines, the ships and the gnolls, and we have a hill. We bleed them slowly, or they bleed us quickly." } },
      choices = {
        { text = "Slowly, then. Rushing the Deadmines would only bury farmers.", next = "BACK", reply = "Patience, aye, it's all I've got. Thank you for seeing it.", fx = { align = { order = 1 } } },
        { text = "Slowly lets them grow. Strike now.", next = "BACK", reply = "Maybe it does, but I'll not throw farmers at the Deadmines to prove a point. Slowly, I'm afraid.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    hunter = {
      lines = {
        { id = "hunter_l", text = "Can you? Then you're worth three of my men, because the Defias have learned to move by the dry creek beds where a boot leaves no mark. Galiaan's been trying to map them for months." },
        { id = "hunter_woods", when = { origin = "human_eastvale_woodsman" },
          text = "An Eastvale woodsman, with a bow and a beast. Then you're worth three of my men, because the Defias move by the dry creek beds where a boot leaves no mark." },
      },
      choices = {
        { text = "My beast doesn't need boot marks.", next = "hunter2" },
        { text = "I'll go and see Galiaan.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hunter2 = {
      lines = { { id = "hunter2_l", text = "No, I suppose it doesn't. Bring Galiaan anything it finds, and if it finds VanCleef's bedroll, I'll buy it a ham." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "Grieving? Aye, I'd believe that; it's had enough to grieve over. I don't know what to make of a dwarf who hears the earth talk, but if it says anything about where the Defias are hiding, tell me first." } },
      choices = {
        { text = "It says the dust is hiding something under Moonbrook.", next = "shaman2" },
        { text = "It doesn't speak of Defias. Only of loss.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    shaman2 = {
      lines = { { id = "shaman2_l", text = "Under Moonbrook. Of course it is; that's where the old mine runs. Your earth and my scouts agree, and that's the first good news I've had in a week." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "defias" } } } },
    },
    mason_child = {
      big = true,
      lines = { { id = "mason_child_l", text = "Then your father was wronged, and I'll say so to anyone in Stormwind who'll listen. But some of the men he laid stone beside are out there in red masks, and I've buried farmers they killed, so that's as far as I can go." } },
      choices = {
        { text = "He never wore a mask. He stayed honest.", next = "mason_child2" },
        { text = "The masks are what the nobles bought with their debts.", next = "BACK", reply = "They are, and that's the bitterest part of it. I'll still fight them, but I'll not forget why they're masked.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "A wrong done to you doesn't excuse a farmer's grave.", next = "BACK", reply = "No, it doesn't, and I'm glad you see it. Your father would be proud, I think.", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    mason_child2 = {
      lines = { { id = "mason_child2_l", text = "Then he did the hardest thing of all, which is to stay angry and stay decent at once. If you've half of that in you, there's a place on this hill for you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    kaldorei = {
      lines = { { id = "kaldorei_l", text = "Maybe they wouldn't, and I'd be glad to see a few of them on this hill if Darnassus is offering. Stormwind didn't abandon us, exactly; it just forgot to remember, which is worse." } },
      choices = {
        { text = "Then the Alliance should remember for it.", next = "BACK", reply = "It should, and I'd thank Darnassus for any help it sends. We've stopped being proud.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A kingdom that forgets doesn't deserve its provinces.", next = "BACK", reply = "Careful, friend, I'm still the king's man, whatever the kingdom's done. I'll not hear treason on my hill.", fx = { align = { order = -1 } } },
      },
    },

    -- 0.71.0 depth: Gryan himself (sub-hub): the north, the nobles, his people, what he asks of you, the captured lad.
    gr_self = {
      hub = true,
      lines = {
        { id = "gxs_default", text = "There's not much to tell that the hill doesn't already know, but ask and I'll answer what I can. Mind, there's a part in the middle I don't talk about, and you'll know it when you reach it." },
        { id = "gxs_warm", when = { disposition = { min = 70 } }, text = "For you I'll make the time, and I'll answer straighter than I would for most. Sit on that crate; it's the only one the wind hasn't claimed." },
      },
      again = {
        { id = "gxs_again", text = "What else? The wind's picking up, so ask it quick." },
        { id = "gxs_again2", text = "Go on, then. I've answered worse questions from Danuvin before breakfast." },
      },
      choices = {
        { text = "What took a Westfall lad away to war?", next = "gr_north" },
        { text = "Do you hold a grudge against Stormwind's nobles, Commander?", next = "gr_nobles" },
        { text = "You've gathered a strange crew around you, Commander.", next = "gr_people" },
        { text = "What do you need from me, Commander?", next = "gr_ask" },
        { text = "What do you do with a Defias you catch?", next = "gr_lad" },
        { text = "Do you remember the harvest fairs in Moonbrook?", next = "gr_fair", when = { origin = "human_westfall_farmhand" } },
        { text = "Did you know any of the masons, before?", next = "gr_masons", when = { origin = "human_stonemason_child" } },
        { text = "The Watch never once spoke of Westfall, Commander.", next = "gr_guard", when = { origin = "human_city_guard" } },
        { text = "Do you ever regret coming home from the war?", next = "gr_doubt", when = { disposition = { min = 65 } } },
        { text = "Back to the war, then.", next = "hello" },
      },
    },

    gr_north = {
      lines = {
        { id = "gxn_default", text = "My father wanted me behind a plough and my mother wanted me in a chapel, so when the Silver Hand began taking young men for training in Lordaeron, I split the difference and went north. Lordaeron gave me the Light and a trade in war, and I never thought I'd need either one at home." },
      },
      choices = {
        { text = "Did you ever meet Lord Uther?", next = "gr_uther" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    gr_uther = {
      lines = {
        { id = "gxu_default", text = "Once or twice, close enough to be shouted at, which I was. He held that a paladin's first duty is to the people in front of him and not the crown behind him, and I've never heard better advice, though it's done my standing in Stormwind no favours." },
        { id = "gxu_paladin", when = { class = "PALADIN" }, text = "You'll know he's dead and the Order scattered after him. I don't hold that the oath died with the Order, and I don't think you do either, or you'd not be wearing it on my hill." },
      },
      choices = {
        { text = "Did you know Bolvar Fordragon in the Order?", next = "op_bolvar" },
        { text = "The people in front of you. That's a good creed.", next = "gr_uther2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_uther2 = {
      lines = {
        { id = "gxu2_default", text = "It is, and it cuts both ways, because it means you've to know who's standing in front of you. So I'll ask you, since you've a soldier's look about you: who is it you fight for, when it comes to it?" },
      },
      choices = {
        { text = "My family, Commander. Everything else comes after.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "The Light, before anyone with a name.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Whoever's paying me this week, truth be told.", next = "BACK", fx = { affinity = -2, trait = { greedy = 1 } } },
        { text = "Whoever's in front of me, like Uther said.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },

    gr_nobles = {
      lines = {
        { id = "gxb_default", text = "Bitter's a fair word for it. The lords who hold the deeds to half these farms live behind Stormwind's walls and haven't seen a furrow in years, and the House of Nobles cheated the Stonemasons and then acted surprised when the masons came out here angry." },
      },
      choices = {
        { text = "So who's more to blame, the nobles or the Defias?", next = "gr_nobles2" },
        { text = "Not every noble house is the same, Commander.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_nobles2 = {
      lines = {
        { id = "gxb2_default", text = "I'll not weigh it for you, because I've done that sum a hundred nights and it comes out different every time. The nobles broke their word and the Brotherhood broke Westfall, and the farmers never signed either bargain, so I keep both on my list and the farmers off it." },
        { id = "gxb2_vancleef", when = { deed = "dungeon:The Deadmines" }, text = "I knew Edwin VanCleef's name when it meant good stonework, and I can't forgive the nobles for what they made of him, nor him for what he made of himself. Both debts were real, and neither of them was Westfall's to pay." },
      },
      choices = {
        { text = "Debt or no debt, they chose the masks.", next = "BACK", fx = { affinity = 1, opinion = { defias = "hardline" } } },
        { text = "The nobles made the Defias, plain and simple.", next = "BACK", fx = { opinion = { defias = "masons_wronged" } } },
      },
    },

    gr_people = {
      lines = {
        { id = "gxp_default", text = "I've a captain who was a farmer, a scout who never sleeps and a tower full of volunteers, and I'd not trade one of them for a company of the King's regulars. Ask me about any of them, or about the folk beyond the hill, and I'll tell you true." },
      },
      choices = {
        { text = "Tell me about your captain.", next = "gr_danuvin" },
        { text = "And Marshal Dughan, over in Goldshire?", next = "gr_dughan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_danuvin = {
      lines = {
        { id = "gxd_default", text = "Danuvin was a farmer until the thieves took his fields, and he's the angriest man on this hill and the most careful, and those are the two things I wanted in a captain. He tells the volunteers it's a fight for their dignity, and he's right, though I'd sooner they fought for their supper and lived to eat it." },
      },
      choices = {
        { text = "And the scout who never sleeps?", next = "gr_galiaan" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    gr_galiaan = {
      lines = {
        { id = "gxg_default", text = "Galiaan worked out that the Brotherhood's bands each wear their own bandanas, and that's the only reason my map's worth the paper it's drawn on. He'll tell you the front keeps moving, and it does, because they've more men than I have and they know these hills as well as we do." },
      },
      choices = {
        { text = "I'll bring him whatever I find out there.", next = "BACK", fx = { affinity = 1, learn = { "people_militia" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_dughan = {
      lines = {
        { id = "gxdu_default", text = "Dughan's a good man with a bad job, holding all of Elwynn with a handful of guards and a desk. He tells Goldshire the Defias are common thieves so the farmers there keep planting, and I'd quarrel with him over it if I didn't understand exactly why he does it." },
      },
      choices = {
        { text = "Should he tell them the truth?", next = "gr_dughan2" },
        { text = "Dughan told me soldiers are coming west by spring.", tag = "Deceive", next = "gr_spring",
          check = { pass = { any = { { class = "ROGUE" }, { trait = "witty" }, { disposition = { min = 70 } } } } },
          fail = { next = "gr_spring_no", fx = { affinity = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_dughan2 = {
      lines = {
        { id = "gxdu2_default", text = "If Goldshire panics, the Stormwind road fills with carts and Westfall loses the only friendly town at its back, so no, not yet. But the day the Brotherhood comes past Westbrook Garrison, he'd better have told them, because a kind lie won't hold a door shut." },
      },
      choices = {
        { text = "Then I'll keep an eye on Westbrook too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_spring = {
      lines = {
        { id = "gxsp_default", text = "By spring? Then Light help me, I'll finally do it. I've a plan for Moonbrook I've shown nobody but Danuvin, a night march down the old cart road with every man on the hill, and I've never dared it because it needs twice the swords I have, so if the Keep actually sends them, we take the town back in one night and the farmers walk home behind us." },
      },
      choices = {
        { text = "I hope it comes to that, Commander.", next = "BACK" },
      },
    },
    gr_spring_no = {
      lines = {
        { id = "gxsn_default", text = "Dughan never said any such thing, because Dughan hasn't a soldier to send and he'd not promise me what he hasn't got. I've had enough false hope out of Stormwind to last me, so don't you bring me more of it." },
      },
      choices = {
        { text = "Forgive me, Commander.", next = "BACK" },
      },
    },

    gr_ask = {
      lines = {
        { id = "gxa_default", text = "I'll ask you one first, since you've been asking me plenty. Westfall's not on the way to anywhere a sensible soul wants to go, so I'd like to know what brought you up my hill." },
      },
      choices = {
        { text = "Elwynn sent me, and I go where I'm sent.", next = "gr_ask2", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "The farmers. Someone should stand up for them.", next = "gr_ask2", fx = { affinity = 2, trait = { kind = 1 }, standing = { sentinel_hill = 1 } } },
        { text = "The Defias carry coin, and I like coin.", next = "gr_ask2", fx = { affinity = -2, trait = { greedy = 1 } } },
        { text = "I wanted to see this fight for myself.", next = "gr_ask2", fx = { trait = { brave = 1 } } },
      },
    },
    gr_ask2 = {
      lines = {
        { id = "gxa2_default", text = "That's a straight answer, and I'll take it over a pretty one any day. What I need from you is this: when you go back to the city, tell anyone who'll listen what you saw out here, the empty farms and the masks and the scarecrows that walk, because the Keep believes reports and it doesn't believe farmers." },
      },
      choices = {
        { text = "I'll tell them, Commander. What should I say?", next = "gr_ask3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_ask3 = {
      lines = {
        { id = "gxa3_default", text = "Say it plainly, and don't let them tell you it's being looked into. If they ask what Westfall wants, tell them it wants its roads patrolled and a fair price for the grain it sends, and nothing more, because we've never once asked for more than that." },
      },
      choices = {
        { text = "I'll carry it word for word, Commander.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 1 } } },
        { text = "The Keep won't listen to me either.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    gr_lad = {
      big = true,
      lines = {
        { id = "gxl_default", text = "Here's one the hill argued over last week, and I'd like your answer before I give you mine. My scouts caught a lad of sixteen in a red mask with a sack of seed corn on his back, and he wept the whole way up the hill, so tell me: what would you have done with him?" },
      },
      choices = {
        { text = "Put him to work for the farms he robbed.", next = "BACK", reply = "That's close to my own answer, and it does my heart good to hear it. A boy put to honest work is one the Brotherhood doesn't get back.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hang him by the tower, so the others see it.", next = "BACK", reply = "Some on the hill said the same, and I understand it. But I'll not hang a weeping boy for seed corn, not while I command here.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "What did you do with him?", next = "gr_lad2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_lad2 = {
      lines = {
        { id = "gxl2_default", text = "I gave him a pitchfork and put him under Danuvin, who watched him like a hawk for a month, and now he walks the south road with the rest of my volunteers. It saddens me to condemn any man and I'll do it when I must, but the Brotherhood recruits from hungry boys, so I mean to recruit them first." },
      },
      choices = {
        { text = "And if he runs back to them?", next = "gr_lad3" },
        { text = "That's a decent answer, Commander.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gr_lad3 = {
      lines = {
        { id = "gxl3_default", text = "Then I was wrong, and I'll say so in front of the whole hill, and it'll cost me. That's the price of mercy out here, and I'd sooner pay it now and then than become the sort of man who never has to." },
      },
      choices = {
        { text = "Something else, Commander.", next = "BACK" },
      },
    },

    gr_fair = {
      lines = {
        { id = "gxf_default", text = "Do I! Moonbrook used to hang lanterns the length of its high street at harvest, and the miners came down from the Jangolode in their dust to dance with the farm girls until the lamps burned out. You'd have been small then and I was off in Lordaeron missing it, so tell me, does your family still talk about it?" },
      },
      choices = {
        { text = "My mother still sings the harvest songs.", next = "gr_fair2", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Nobody talks about Westfall at all, now.", next = "gr_fair2", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    gr_fair2 = {
      lines = {
        { id = "gxf2_default", text = "Then we'll have the songs back, if I've anything to do with it, and the lanterns too, though it'll be a few seasons yet. Help me clear Moonbrook, and I'd like to see you dance down that street before I'm too old to watch." },
      },
      choices = {
        { text = "I'll hold you to that, Commander.", next = "BACK", fx = { affinity = 1, standing = { sentinel_hill = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_masons = {
      lines = {
        { id = "gxm_default", text = "A few, aye. Westfall lads went to the city to cut stone after the Second War because good coin was promised in it, and I came home from Lordaeron to find some of those same lads wearing masks in Moonbrook. I've stopped asking after the ones I knew by name, because I'd rather not learn which of them I've buried." },
      },
      choices = {
        { text = "My father said they were good men, once.", next = "gr_masons2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_masons2 = {
      lines = {
        { id = "gxm2_default", text = "They were, and that's the bitter part of it. The House of Nobles took good men and made thieves of them for want of a fair wage, and I'll curse the nobles for it until I'm in the ground, but I'll not let a cheated man take a farmer's last cow and call it justice." },
      },
      choices = {
        { text = "My father would say the same, Commander.", next = "BACK", fx = { affinity = 2 } },
        { text = "Some of them were owed more than a farm's worth.", next = "BACK", fx = { affinity = -1, opinion = { defias = "masons_wronged" } } },
      },
    },
    gr_guard = {
      lines = {
        { id = "gxw_default", text = "No, it wouldn't, because the Watch has its hands full with the Trade District and the canals, and Westfall's on no patrol they walk. But you came out anyway, so tell me straight: did anyone in the Keep ever speak of sending soldiers west?" },
      },
      choices = {
        { text = "Never, Commander. Not once while I served.", next = "gr_guard2", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "There was talk, but nobody believed it.", next = "gr_guard2", fx = { trait = { skeptical = 1 } } },
      },
    },
    gr_guard2 = {
      lines = {
        { id = "gxw2_default", text = "That's what I thought, and it's no more than I expected, but I'm glad to hear it from someone who'd know. Stay on the hill a while, then, because a soldier who's walked a city beat knows how to keep a watch, and my farmers keep theirs by guessing." },
      },
      choices = {
        { text = "I'll take a watch, Commander.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gr_doubt = {
      lines = {
        { id = "gxdb_default", text = "Every night, and since you asked it straight, I'll answer it straight. Lordaeron needed every sword it had and I took mine home because my own land was burning, and some nights I think I was right and some nights I think I ran, and nothing I do on this hill settles it." },
      },
      choices = {
        { text = "You came home to save what could be saved.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Lordaeron was lost either way, Commander.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "That's kindly said, and I'll carry it down to the men on the wall, because they've had precious little thanks from anyone east of the river. It does a man good to hear that somebody sees what we're about." },
        { id = "s2", text = "You honour the Militia, and I'll not turn that away. We've stood on this hill with borrowed swords and no pay, and a good word is most of what we're paid in." },
      },
      fail = {
        { id = "f1", text = "I've had fine words from Stormwind for years, friend, and not one soldier came with them. Westfall can't eat praise, and I've lost my taste for it." },
        { id = "f2", text = "Save that for the House of Nobles, who trade in it. On Sentinel Hill we judge folk by whether they come back from the Jangolode with their sword still wet." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Aye, a knight commanding farmers from a half-built tower, and I know how it looks. You've the nerve to say it to my face, and I've need of folk with nerve." },
        { id = "s2", text = "That's a sharp tongue, and I'd sooner have it on my side of the wall than on the Defias side. Laugh at the Militia all you like, friend, so long as you fight beside it." },
      },
      fail = {
        { id = "f1", text = "My people have buried sons in these fields while the Keep looked the other way, and I'll not hear them mocked on their own hill. Mind yourself." },
        { id = "f2", text = "It's easy to jeer from behind someone else's wall. Go and walk the road to Moonbrook alone, and then tell me what's laughable about Westfall." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Peace, friend. I've no wish to cross blades with you while VanCleef's men are laughing in the fields, so I'll hear your demand and weigh it fairly." },
        { id = "s2", text = "You've a fearsome way about you, and I'll own that it gave me pause. I've few enough fighters that I'll bend on this, though I'd rather you turned that look on the Defias." },
      },
      fail = {
        { id = "f1", text = "I've faced the Horde's charge and the Brotherhood's knives, and neither made me give up this hill. You'll not do it with a hard word." },
        { id = "f2", text = "Threats are what the Defias deal in, and I'd thought better of you. Stand down, or you'll learn how well farmers with pitchforks hold together when their captain's leaned on." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's not something I'll speak of to one I've not yet seen stand with us. Do a turn for Westfall, and you'll find me more open." },
      { id = "gt2", text = "I'll hold my tongue on that for now, friend. Too many ears on this hill have turned out to be the Brotherhood's, and I've learned to know a body first." },
    },
    deadmines = {
      { id = "tp_deadmines", text = "The Defias are dug into the old Moonbrook mines, and somewhere in the dark below that town VanCleef gives his orders. When we have the proof, I'll ask the bravest people in Westfall to go down after him, and I'll ask you first." },
      { id = "tp_deadmines2", when = { class = "PALADIN" }, text = "The Deadmines will need a paladin's light in the dark, and I can't leave this hill to carry it myself. If you go down after VanCleef, go with the Light held high and come back to me." },
    },
    stonemasons = { { id = "tp_stonemasons", text = "I knew Edwin VanCleef when he was a master mason and the Stonemasons' Guild built this kingdom back from the ashes. The nobles cheated them, and I've said so to the House of Nobles' face, but it doesn't give him the right to take Westfall." } },
    silver_hand = { { id = "tp_silver_hand", text = "I was trained by the Silver Hand, and I'd not trade a day of it for all the gold in Stormwind. The order's broken now, scattered by the plague in the north, but it trained me for a war like this." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light doesn't ask whether a man's a noble or a farmer, and it doesn't ask whether he can pay. That's the sermon I preach on this hill, and the militia hear it every morning." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "We serve the same Light, you and I, and on this hill it serves farmers who can't fight and fight anyway. Remember that whenever someone in Stormwind tells you the Light is for the gentry." },
    },
    bolvar = { { id = "tp_bolvar", text = "Bolvar Fordragon is an honest man trying to hold a kingdom together with both hands and a council around his wrists. I've no quarrel with him, only with the men who keep his ear." } },
    varian = { { id = "tp_varian", text = "King Varian would have seen this injustice and set it right, I believe, before the Defias had a name. Now he's missing and the boy is too young, and Westfall pays for both." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor has the Highlord's ear, and she's never once spoken well of Westfall in council, so I'm told. I'll not judge a woman I've never met, but I'll note that she speaks against us easily." } },
    second_war = { { id = "tp_second_war", text = "I came back from the Second War to a homeland I'd fought to keep, and found the Defias had taken it while I was away. The orcs never managed that, and I'll not let a mason's grudge manage it either." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "The Scarlet Crusade has the Light on its banners and murder in its heart, from what my brothers in the north write. I'd not trust a man who's sure of everything, and the Crusade is sure of everything." } },
    the_stockade = { { id = "tp_the_stockade", text = "Too many of the Defias I send to the Stockade come back to Westfall, and I've stopped wondering how. When I'm done with VanCleef, I'll have a word with whoever's holding the keys." } },
    knows = {
      { id = "tp_knows", text = "Every scout and farmer in Westfall reports to this hill sooner or later, so I've heard most of what goes on out there. Ask me about any of this." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you I'll make the time, and I'll not soften any of it. Ask away." },
    },
    background = {
      { id = "tp_bg", text = "I was born here, trained in Lordaeron and came home again. The middle part I don't discuss.", next = "back" },
      { id = "tp_bg2", text = "I'm a farm boy from these parts who went north to learn the Light and came back to find his home stolen. That's all of it that matters." },
    },
    advice = { { id = "tp_ad", text = "Travel the road by day and never alone past the Molsen farm. And if a scarecrow turns its head, don't wait to see what it does next." } },
    defias = {
      { id = "tp_defias", text = "They're not common thieves; they're organized, fed, armed and angry. Anyone who tells you otherwise hasn't been to Moonbrook.",
        fx = { hear = "defias_trained" } },
    },
    westfall = { { id = "tp_westfall", text = "It's good land, only tired. It'll grow again if we let it." } },
    people_militia = {
      { id = "tp_militia", text = "They're farmers, mostly, and a few old soldiers, all of them braver than they've any reason to be." },
      { id = "tp_militia2", text = "It's ours, built from nothing. Ask what you want to know about it.", next = "militia" },
    },
    harvest_watchers = { { id = "tp_watchers", text = "They're scarecrows that walk. Ask Farmer Saldean about them; he'll talk till sundown." } },
    moonbrook = { { id = "tp_moonbrook", text = "It's their town now. Don't go in alone, and never go in at night." } },
    riverpaw = { { id = "tp_gnolls", text = "The gnolls run with the thieves, and Captain Danuvin's dealing with them." } },
    blackrock = { { id = "tp_blackrock", text = "That's Magistrate Solomon's war, over in Redridge, not mine. I'd help him if I could, but I can't spare a single pitchfork." } },
    _none = { { id = "tp_none", text = "I've a war to run with a hill and some farmers. That's not part of it." } },
  },
}
