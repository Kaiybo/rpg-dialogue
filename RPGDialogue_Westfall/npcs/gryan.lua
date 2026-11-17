-- Gryan Stoutmantle, Sentinel Hill. Voice: bibles/gryan.md
-- Silver Hand-trained, Westfall-born, holding his homeland together with farmers.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gryan", id = TODO_NPC("Gryan Stoutmantle"), name = "Gryan Stoutmantle", title = "The People's Militia",
  bible = "bibles/gryan.md", role = "questgiver", tier = "major",
  communities = { "sentinel_hill" }, temper = { "steady" }, values = { "brave", "lawful", "kind" },
  spiritSensitive = true,
  notices = { "reputation", "paladin" },
  impression = {
    first = "Gryan Stoutmantle came home from the war to find Westfall in thieves' hands, and he means to take it back one farm at a time. He carries the whole hill on his shoulders without a word about the weight.",
    third = "{name} met Gryan Stoutmantle at Sentinel Hill, who raised the People's Militia to reclaim his homeland.",
  },

  greetings = {
    { id = "g_hill", text = "Sentinel Hill, such as it is. Find a spot out of the wind." },
    { id = "g_sent", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") }, text = "Another one from Elwynn, and glad I am of it. Come up out of the wind; I'll not keep you standing." },
    { id = "g_militia", when = { questDone = TODO_QUEST("The People's Militia") }, text = "There's one of my own militia. Report, then, and tell me how the roads look." },
    { id = "g_hero", when = { townStanding = { town = "sentinel_hill", min = 55 } }, text = "The hill has started saying your name alongside mine. Mind you live up to it; I'm still trying to live up to my own." },
    { id = "g_distrust", when = { townStanding = { town = "sentinel_hill", max = -20 } }, text = "Say what you came to say, and then be on your way." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "You carry yourself like the Silver Hand taught you. I know the walk; I learned it in Lordaeron. Don't let anyone tell you it's for parade grounds." },
    { id = "n_hero", cat = "reputation", place = "before", when = { townStanding = { town = "sentinel_hill", min = 30 } },
      text = "Half my militia wants to follow you into Moonbrook. The other half wants to know where you were last year." },
  },

  start = "hello",
  nodes = {
    xcl_stocks = {
      big = true,
      lines = { { id = "xcl_stocks_default", text = "Good, though I'll tell you plainly that Westfall won't feel it. The men in that prison have been out of the fight for years, and the ones burning our farms are still out there, so a quiet Stockade means a quiet city and nothing more for us." } },
      choices = {
        { text = "Justice in the city still matters, Gryan. It's a start.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Westfall needs swords here, not jailers there.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
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
        { text = "The Masons were wronged, but VanCleef's road is worse.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The nobles cheated them. Stormwind earned this.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What happened with the Stonemasons?", next = "masons" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I fought the Horde when its warlocks were burning Lordaeron, so forgive me if I don't thank you for that. Still, I lead a militia of farmers and broken men, and I'll judge you by what you do on this hill, not by what follows you onto it." } },
      choices = {
        { text = "Judge me, then. I'll answer for every deed.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll do whatever wins, Gryan, however it looks.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Tell me about the People's Militia.", next = "militia" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "I know it is. Nobody has turned a furrow in Moonbrook for years, and the harvest golems the Defias stole have torn up what was left. If you can coax anything green out of it, the farmers will remember you longer than they remember me." } },
      choices = {
        { text = "I'll mend what I can, and leave the rest stronger.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The land will heal itself once the people leave it be.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_stocks", tags = { "news" }, when = { cleared = "The Stockade", faction = "Alliance" },
          text = "I hear the Stockade riot's done and Bazil Thredd with it, and that you were the one who ended it. Thredd was one of Edwin's lieutenants, and I'd hoped he'd hang in Westfall where the farmers he robbed could watch." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Defias", min = 40 } }, text = "Word reaches the hill of Defias found dead in the fields, and more of them than I'd dare hope for. The People's Militia thanks you, and I'll thank you myself, because every one of those masks was a farm we couldn't hold." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid of the kaldorei, out on my hill. I hope the land tells you something kinder than it tells me." },
        { id = "h_default", text = "I'm Gryan Stoutmantle, born and raised in Westfall. I came home from the war to find it in the hands of thieves, so I'm taking it back, one farm at a time." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Elwynn sends me volunteers now, never soldiers, but volunteers will do. Volunteers are what built this militia in the first place." },
        { id = "h_militia_before", when = { questBefore = TODO_QUEST("The People's Militia") },
          text = "My scouts have marked Defias camps from the coast to Moonbrook, and all I have to answer them with is farmers with pitchforks, and not enough of those. You, though, would do nicely." },
        { id = "h_militia_active", tags = { "news" }, when = { questActive = TODO_QUEST("The People's Militia") },
          text = "Bring them down and the farmers sleep a night without one eye open. That's the whole of the war, out here." },
        { id = "h_militia_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The People's Militia"), days = 3 } },
          text = "That camp's gone quiet, and a man walked all the way up the hill this morning just to tell me so. That's what you bought: one farmer who wasn't afraid, for one morning." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "You went under Moonbrook and walked out again. Edwin VanCleef has had his own way down there too long. Now he knows we can reach him." },
        { id = "h_paladin", when = { class = "PALADIN", minLevel = 12 },
          text = "It wasn't the Light that sent me home; it was Westfall. The Light simply came along with me and made itself useful." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest on my hill, is it? The militia will want a blessing before every patrol, so give them the first few, and after that they'll be content just to stand near you." },
        { id = "h_wiley", when = { heardLine = "wiley.h_defias" },
          text = "Wiley talked to you? Then you've had the truth with no manners attached. I should have left him where I found him, though I'm glad I didn't." },
        { id = "h_light", when = { alignment = { axis = "light", min = 40 } },
          text = "There's a decency about you, I'd say, and out here that's rarer than iron. Don't spend it all in one place." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Your people lost a home and kept going. So did mine, out here. That's a better start than most of my volunteers had." },
        { id = "h_count", when = { metBefore = true }, text = "I walked the wall at dawn and counted the militia, then counted them again. It's still not enough, but every one of them is still here, and that makes it a good morning in these parts." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Look out there, at farms that had a lamp in every window once. I count the dark ones every night, and I'd like very much to stop counting." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There you are. The lads were asking after you, and so was I, if I'm honest; Sentinel Hill feels a little steadier with you on it." },
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
        { text = "What happened to Westfall?", next = "westfall" },
        { text = "Why doesn't Stormwind help?", next = "stormwind" },
        { text = "Who leads the Defias?", next = "leader" },
        { text = "How does someone join the militia?", next = "militia" },
        { text = "I took the Silver Hand's oath too.", next = "paladin", when = { class = "PALADIN" } },
        { text = "Who says the words over your dead?", next = "priest", when = { class = "PRIEST" } },
        { text = "I grew up on a farm out here.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "About Magistrate Solomon's letter.", next = "solomon", when = { questActive = TODO_QUEST("Messenger to Westfall") } },
        { text = "VanCleef is dead. What happens now?", next = "after", when = { deed = "dungeon:The Deadmines" } },
        { text = "Bazil Thredd is dead, Gryan. The Stockade riot is over.", next = "xcl_stocks", when = { cleared = "The Stockade", faction = "Alliance" } },
        { text = "I'm at your service.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Put me on the wall, Stoutmantle. I'm a soldier.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I can track the Defias through these hills.", next = "hunter", when = { class = "HUNTER" } },
        { text = "The land here is grieving, Stoutmantle. I can hear it.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "My father was a Stonemason. The nobles never paid him.", next = "mason_child", when = { origin = "human_stonemason_child" } },
        { text = "The Sentinels would never abandon a province like this.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "I studied in Stormwind's Mage Quarter, Gryan.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I command a demon, Stoutmantle. It fights for Westfall now.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll help, but I answer to no militia.", next = "END", fx = { align = { order = -1 } } },
      },
    },

    westfall = {
      lines = {
        { id = "w_default", key = true,
          text = "Westfall fed the whole kingdom once. After the Second War the farms went fallow and the Defias moved in, and families were driven off their own land at knifepoint." },
      },
      choices = {
        { text = "And you came back for it.", next = "back" },
        { text = "Who still holds out?", next = "holdouts" },
        { text = "I'll help you take it back.", next = "BACK", fx = { affinity = 2, learn = { "westfall" }, align = { order = 1 } } },
        { text = "Maybe the Defias have earned a share of it.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "That's a stubborn kind of loyalty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd have stopped paying years ago.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Then let's save it.", next = "BACK", fx = { affinity = 2, align = { light = 1, order = 1 }, trait = { brave = 1 } } },
        { text = "Save what you like. I'll look after myself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You can't save everything.", next = "everything", fx = { trait = { skeptical = 1 } } },
        { text = "What did you see in Lordaeron?", next = "lordaeron" },
      },
    },
    everything = {
      lines = { { id = "e_default", text = "True enough, so you pick something worth the trying. I picked here." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    lordaeron = {
      big = true,
      lines = { { id = "lo_default", text = "That's enough of that. I was at Stratholme, and that's all I'll say of it, which is more than I tell most." } },
      choices = {
        { text = "Then I won't ask again.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "If you ever want to set it down, I'm a priest.", next = "BACK", when = { class = "PRIEST" },
          fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Some things are better buried than confessed, Commander.", next = "BACK", when = { class = "PRIEST" }, fx = { align = { light = -2 } } },
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
        { text = "Who in the city decided this?", next = "nobles" },
      },
    },
    bigger = {
      lines = { { id = "bg_default", text = "Bigger than its own breadbasket? Then it'll be hungry while it solves them." } },
      choices = { { text = "Point taken. Something else.", next = "BACK" } },
    },
    nobles = {
      lines = { { id = "no_default", text = "Someone in the House of Nobles keeps telling the Regent that Westfall can wait. I don't know who, but I know they've never stood on this hill." } },
      choices = {
        { text = "Then somebody should find out who.", next = "BACK", fx = { trait = { curious = 1 }, align = { order = -1 } } },
        { text = "It isn't our place to question the House of Nobles.", next = "BACK", fx = { align = { order = 1 } } },
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
        { text = "Why does Wiley owe you?", next = "wiley" },
        { text = "Wiley's note says goblins built the watchers.", next = "watchers_truth", when = { heardLine = "wiley.h_defias" } },
        { text = "What about the stonemasons people mention?", next = "masons" },
        { text = "Send me in. I go where soldiers can't.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "rg_default", text = "One of your trade already owes me his life. I'd sooner not be owed by two. Go where my farmers can't, then, and bring me back the truth." } },
      choices = {
        { text = "The truth, and nothing I pocket on the way.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Mostly the truth.", next = "BACK", fx = { affinity = -1, align = { honor = -1 }, trait = { witty = 1 } } },
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
        { text = "Then the farms come first.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Whatever's under Moonbrook matters more than any field.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "No grievance excuses murder.", next = "BACK", fx = { affinity = 1, align = { order = 1 }, opinion = { defias = "hardline" } } },
        { text = "The nobles cheated them first, and I'd have fought too.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "It is. I'll pray for both.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "I'll pray for the farmers. The thieves chose their road.", next = "BACK", fx = { align = { light = -1 } } },
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
      lines = { { id = "oa_default", text = "To the people of these farms, and to the Light. The Light because it's what I was taught. The people because they're who we're fighting for." } },
      choices = {
        { text = "Then I'll swear it.", next = "BACK", fx = { affinity = 2, align = { light = 1, order = 1 }, standing = { sentinel_hill = 2 } } },
        { text = "I'll fight. I won't swear.", next = "BACK", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
      },
    },

    paladin = {
      lines = { { id = "pa_default", text = "Then you know what it asks of a man. The Order's been scattered since Lordaeron, but the oath didn't scatter with it." } },
      choices = {
        { text = "Does the Light answer you out here?", next = "paladin_light" },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_light = {
      lines = { { id = "pl_default", text = "Every morning I ask it to help me keep these people alive, and most mornings it does. The other mornings, I do it myself." } },
      choices = {
        { text = "That's a prayer too.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Then it's you keeping them alive, not the Light.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "I'll be here.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, standing = { sentinel_hill = 2 } } },
        { text = "Don't count on me. I go wherever the work is.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    priest_defias = {
      big = true,
      lines = { { id = "pd_default", text = "We bury them too. A lot of them were Stormwind men with Stormwind mothers, and someone ought to pray for them, but I find I can't." } },
      choices = {
        { text = "I can.", next = "BACK", fx = { affinity = 1, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "They chose their road.", next = "BACK", fx = { align = { light = -2 }, trait = { stern = 1 } } },
      },
    },

    farmhand = {
      lines = { { id = "fh_default", text = "Then you've come home. Don't tell me which farm, though, or I'll have to tell you who sleeps in it now." } },
      choices = { { text = "Thieves, I suppose.", next = "farmhand_home" } },
    },
    farmhand_home = {
      lines = { { id = "fh2_default", text = "Thieves, or watchers, or nobody. Help me clear it, and you can tell me its name when it's yours again." } },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { sentinel_hill = 2 } } },
        { text = "I left for a reason.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
      },
    },

    noble = {
      lines = { { id = "nb_default", text = "Then you know the men who decided we could wait. Tell them Westfall's still waiting. Tell them we've stopped being polite about it." } },
      choices = {
        { text = "Not all of us forgot you.", next = "noble_defend" },
        { text = "I'm ashamed of them.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "My family has its reasons, and I'll keep them.", next = "BACK", fx = { align = { honor = -1 } } },
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
      lines = { { id = "sa_default", text = "That my heart's heavy for every good man he loses. That I lose mine the same way, for the same reason. Nobody's coming, for either of us." } },
      choices = {
        { text = "He'll understand.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then the two of you should stand together.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Then stop waiting on Stormwind and go your own way.", next = "BACK", fx = { align = { order = -1 } } },
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
      lines = { { id = "ac_default", text = "Now that the hard part's done? Likely enough, since they'll want their tithe. Let them come, and let them see what we kept alive without them." } },
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
        { text = "Why not march on Moonbrook?", next = "warrior_march" },
      },
    },
    warrior2 = {
      lines = { { id = "warrior2_l", text = "Then you'll be the first soldier this province has seen in a season. Come back and tell me who blinked first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior_march = {
      lines = { { id = "warrior_march_l", text = "With what? Danuvin's drilled farmers and Galiaan's map? The Defias have the mines, the ships and the Deadmines, and we have a hill. We bleed them slowly, or they bleed us quickly." } },
      choices = {
        { text = "Slowly, then. Patience wins.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Slowly lets them grow. Strike now.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
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
      lines = { { id = "mason_child_l", text = "Then your father was wronged, and I'll say so to anyone in Stormwind who'll listen. But some of the men he laid stone beside are out there in red masks, and I've buried farmers they killed, so forgive me if I can't say more than that." } },
      choices = {
        { text = "He never wore a mask. He stayed honest.", next = "mason_child2" },
        { text = "The masks are what the nobles bought with their debts.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "A wrong done to you doesn't excuse a farmer's grave.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    mason_child2 = {
      lines = { { id = "mason_child2_l", text = "Then he did the hardest thing of all, which is to stay angry and stay decent at once. If you've half of that in you, there's a place on this hill for you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    kaldorei = {
      lines = { { id = "kaldorei_l", text = "Maybe they wouldn't, and I'd be glad to see a few of them on this hill if Darnassus is offering. Stormwind didn't abandon us, exactly; it just forgot to remember, which is worse." } },
      choices = {
        { text = "Then the Alliance should remember for it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A kingdom that forgets doesn't deserve its provinces.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every scout and farmer in Westfall reports to this hill sooner or later, so I've heard most of what goes on out there. Ask me about any of this." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you I'll make the time, and I'll not soften any of it. Ask away." },
    },
    background = {
      { id = "tp_bg", text = "I was born here, trained in Lordaeron and came home again. The middle part I don't discuss.", next = "back" },
      { id = "tp_bg2", text = "A farm boy from these parts who went north to learn the Light and came back to find his home stolen. That's all of it that matters." },
    },
    advice = { { id = "tp_ad", text = "Travel the road by day and never alone past the Molsen farm. And if a scarecrow turns its head, don't wait to see what it does next." } },
    defias = {
      { id = "tp_defias", text = "They're not common thieves; they're organized, fed, armed and angry. Anyone who tells you otherwise hasn't been to Moonbrook.",
        fx = { hear = "defias_trained" } },
    },
    westfall = { { id = "tp_westfall", text = "It's good land, only tired. It'll grow again if we let it." } },
    people_militia = {
      { id = "tp_militia", text = "Farmers, mostly, and a few old soldiers, all of them braver than they've any reason to be." },
      { id = "tp_militia2", text = "It's ours, built from nothing. Ask what you want to know about it.", next = "militia" },
    },
    harvest_watchers = { { id = "tp_watchers", text = "Scarecrows that walk. Ask Saldean about them; he'll talk till sundown." } },
    moonbrook = { { id = "tp_moonbrook", text = "It's their town now. Don't go in alone, and never go in at night." } },
    riverpaw = { { id = "tp_gnolls", text = "The gnolls run with the thieves, and Captain Danuvin's dealing with them." } },
    blackrock = { { id = "tp_blackrock", text = "That's Solomon's war, not mine. I'd help him if I could, but I can't spare a single pitchfork." } },
    _none = { { id = "tp_none", text = "I've a war to run with a hill and some farmers. That's not part of it." } },
  },
}
