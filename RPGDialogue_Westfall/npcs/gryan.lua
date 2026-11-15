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

  greetings = {
    { id = "g_hill", text = "Sentinel Hill, such as it is. Find a spot out of the wind." },
    { id = "g_sent", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") }, text = "Another one from Elwynn. Good. Come up, I'll not keep you standing." },
    { id = "g_militia", when = { questDone = TODO_QUEST("The People's Militia") }, text = "There's one of mine. Report." },
    { id = "g_hero", when = { townStanding = { town = "sentinel_hill", min = 55 } }, text = "The hill has started saying your name with mine. Mind you live up to it. I'm still trying." },
    { id = "g_distrust", when = { townStanding = { town = "sentinel_hill", max = -20 } }, text = "Say what you came to say. Then go." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "You carry yourself like the Silver Hand taught you. I know the walk; I learned it in Lordaeron. Don't let anyone tell you it's for parade grounds." },
    { id = "n_hero", cat = "reputation", place = "before", when = { townStanding = { town = "sentinel_hill", min = 30 } },
      text = "Half my militia wants to follow you into Moonbrook. The other half wants to know where you were last year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gryan Stoutmantle. I was born in Westfall. I got home and found it in the hands of thieves, so I'm taking it back. One farm at a time." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Elwynn sends me volunteers now. Not soldiers. Never soldiers. Volunteers will do." },
        { id = "h_militia_before", when = { questBefore = TODO_QUEST("The People's Militia") },
          text = "My scouts have marked Defias camps from the coast to Moonbrook. I've farmers with pitchforks and not enough of them. You, though. You'd do." },
        { id = "h_militia_active", tags = { "news" }, when = { questActive = TODO_QUEST("The People's Militia") },
          text = "Bring them down and the farmers sleep a night without one eye open. That's the whole of the war, out here." },
        { id = "h_militia_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The People's Militia"), days = 3 } },
          text = "That camp's gone quiet. A man walked up the hill this morning just to say so. That's what you bought: one man not afraid for a morning." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "You went under Moonbrook and walked out again. Edwin VanCleef has had his own way down there too long. Now he knows we can reach him." },
        { id = "h_paladin", when = { class = "PALADIN", minLevel = 12 },
          text = "The Light didn't send me home. Westfall did. The Light just came along and made itself useful." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, on my hill. The militia will want a blessing before every patrol. Give the first few. After that they'll just stand near you." },
        { id = "h_wiley", when = { heardLine = "wiley.h_defias" },
          text = "Wiley talked to you? Then you've had the truth with no manners attached. I should have left him where I found him. I'm glad I didn't." },
        { id = "h_light", when = { alignment = { axis = "light", min = 40 } },
          text = "A decency on you, I'd say. Out here it's rarer than iron. Don't spend it all in one place." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Your people lost a home and kept going. So did mine, out here. That's a better start than most of my volunteers had." },
        { id = "h_count", when = { metBefore = true }, text = "Walked the wall at dawn and counted the militia. Counted again. Still not enough, but they're all still here. That's a good morning, out here." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Look out there. Farms that had lamps in every window, once. I count the dark ones every night. I'd like to stop counting." },
      },
      again = {
        { id = "h_again", text = "What else? Ask it now. Quiet hours don't last out here." },
        { id = "h_again2", text = "Go on. The map will keep a minute." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask. I'm up till the watch changes anyway." },
      },
      choices = {
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
        { text = "I'm at your service.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
      },
    },

    westfall = {
      lines = {
        { id = "w_default", key = true,
          text = "It fed the kingdom once. After the Second War the farms went fallow and the Defias moved in. Families were driven off their own land at knifepoint." },
      },
      choices = {
        { text = "And you came back for it.", next = "back" },
        { text = "Who still holds out?", next = "holdouts" },
        { text = "I'll help you take it back.", next = "BACK", fx = { affinity = 2, learn = { "westfall" }, align = { order = 1 } } },
      },
    },
    holdouts = {
      lines = {
        { id = "ho_default", text = "Saldean, who won't budge. The Furlbrows, who tried to leave and couldn't. A few who still send the city its tithe every year. The city doesn't write back.",
          fx = { learn = { "westfall" } } },
      },
      choices = {
        { text = "Why pay a city that left them?", next = "tithe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tithe = {
      lines = { { id = "ti_default", text = "Habit. Pride. Hope that somebody in the Keep reads the ledger and remembers us. I'd have stopped paying years ago. I'm glad they haven't." } },
      choices = {
        { text = "That's a stubborn kind of loyalty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    back = {
      big = true,
      lines = {
        { id = "b_default", text = "I left the Third War with things I'd rather not carry. Lordaeron burned. I couldn't save it. This, I can save." },
        { id = "b_squire", when = { origin = "human_paladin_squire" },
          text = "You squired for the Silver Hand; you know what Lordaeron cost us. Some of us went home to make sure it didn't cost everything." },
      },
      choices = {
        { text = "Then let's save it.", next = "BACK", fx = { affinity = 2, align = { light = 1, order = 1 }, trait = { brave = 1 } } },
        { text = "You can't save everything.", next = "everything", fx = { trait = { skeptical = 1 } } },
        { text = "What did you see in Lordaeron?", next = "lordaeron" },
      },
    },
    everything = {
      lines = { { id = "e_default", text = "True. So you pick something. I picked here." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    lordaeron = {
      big = true,
      lines = { { id = "lo_default", text = "Enough. I was at Stratholme. That's all I'll say of it, and it's more than I say to most." } },
      choices = {
        { text = "Then I won't ask again.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "If you ever want to set it down, I'm a priest.", next = "BACK", when = { class = "PRIEST" },
          fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Silence won't heal it.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    stormwind = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "The House of Nobles went rotten, and the city's busy with its own troubles. Nobody's coming. So we stopped waiting.",
          fx = { hear = "stormwind_abandoned_westfall" } },
        { id = "s_bolvar", when = { heardLine = "bolvar.t_westfall" },
          text = "The Highlord said that, did he? I believe he means it. I'll believe in his soldiers when I see them on the road." },
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
      lines = { { id = "no_default", text = "Someone in the House of Nobles keeps telling the Regent that Westfall can wait. I don't know who. I know they've never stood on this hill." } },
      choices = {
        { text = "Then somebody should find out who.", next = "BACK", fx = { trait = { curious = 1 }, align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },

    leader = {
      lines = {
        { id = "l_default", text = "Someone who knows Stormwind's stones too well. My scouts and the city's quieter friends are working on a name. When I have it, you'll have it." },
        { id = "l_known", key = true, when = { deed = "dungeon:The Deadmines" },
          text = "VanCleef. A stonemason once. He helped build the city that wouldn't pay him, and he's never forgiven it." },
      },
      choices = {
        { text = "How will you get the name?", next = "hunt" },
        { text = "I'll keep my ears open.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    hunt = {
      lines = {
        { id = "hu_default", text = "A rogue in the Lakeshire inn owes me his life. Wiley. He'll hate telling me what he knows, which is how I'll know it's true." },
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
      lines = { { id = "wi_default", text = "I saved his neck once. He's never forgiven me for it. Some men can't bear a debt, even a kind one." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    watchers_truth = {
      lines = {
        { id = "wt_default", text = "Goblin work, bought with Defias coin and set in the fields to frighten superstitious farmers. It worked. Don't tell Saldean yet. He'd go after the goblins with a pitchfork.",
          fx = { learn = { "harvest_watchers" } } },
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
      },
    },
    masons = {
      big = true,
      lines = {
        { id = "ma_default", text = "The Stonemasons' Guild rebuilt Stormwind, and the nobles wouldn't pay them. That's a true wrong. It doesn't buy them a single farm out here.",
          fx = { learn = { "defias" } } },
        { id = "ma_vancleef", when = { deed = "dungeon:The Deadmines" },
          text = "I knew VanCleef's name long before this. Clever, tireless, proud of good work. It still unsettles me, what a man like that became." },
      },
      choices = {
        { text = "They were cheated. Can you blame them?", next = "masons_blame" },
        { text = "No grievance excuses murder.", next = "BACK", fx = { affinity = 1, align = { order = 1 }, opinion = { defias = "hardline" } } },
        { text = "Masons built the Cathedral I pray in.", next = "masons_cathedral", when = { class = "PRIEST" } },
      },
    },
    masons_blame = {
      lines = { { id = "mb_default", text = "Blame the nobles for the debt. Blame the masons for the knives. I can do both before breakfast. The farmers they robbed never owed them a copper." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { defias = "masons_wronged" } } } },
    },
    masons_cathedral = {
      lines = { { id = "mc_default", text = "Then pray for them there. And for the farmers they've robbed. If the Light can hold both at once, it's bigger than I am." } },
      choices = {
        { text = "It is. I'll pray for both.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    militia = {
      lines = {
        { id = "mi_default", text = "Three tasks, each further south than the last. Do them and I'll take your oath myself. These farmers have had enough of strangers who quit halfway." },
        { id = "mi_done", when = { questDone = TODO_QUEST("The People's Militia") },
          text = "You've done the work and you've had my word on it. Wear it well. Don't make me sorry." },
      },
      choices = {
        { text = "Who serves in it?", next = "militia_who" },
        { text = "An oath? Sworn to what?", next = "oath" },
        { text = "Something else.", next = "BACK" },
      },
    },
    militia_who = {
      lines = { { id = "mw_default", text = "Farmers, mostly. Danuvin was one, before I made him a captain. Galiaan maps the thieves, Riell watches from the tower. Not one of them is paid." } },
      choices = {
        { text = "Then they're braver than soldiers.", next = "BACK", fx = { affinity = 1, learn = { "people_militia" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "people_militia" } } },
      },
    },
    oath = {
      big = true,
      lines = { { id = "oa_default", text = "To the people of these farms, and to the Light. The Light because it's what I was taught. The people because they're who we're fighting for." } },
      choices = {
        { text = "Then I'll swear it.", next = "BACK", fx = { affinity = 2, align = { light = 1, order = 1 }, standing = { sentinel_hill = 2 } } },
        { text = "I'll fight. I won't swear.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    paladin = {
      lines = { { id = "pa_default", text = "Then you know what it asks. The Order's scattered since Lordaeron. The oath didn't scatter with it." } },
      choices = {
        { text = "Does the Light answer you out here?", next = "paladin_light" },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_light = {
      lines = { { id = "pl_default", text = "Every morning I ask it to help me keep these people alive. Most mornings it does. The other mornings, I do it myself." } },
      choices = { { text = "That's a prayer too.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } } },
    },

    priest = {
      lines = { { id = "pr_default", text = "Nobody fit for it. There's no chaplain on this hill. I say what I can over the graves, and the families are kind enough not to tell me it isn't the same." } },
      choices = {
        { text = "Let me say the words next time.", next = "priest_words" },
        { text = "And the Defias dead?", next = "priest_defias" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_words = {
      lines = { { id = "pw_default", text = "I'll hold you to that. There'll be a next time, priest. There always is." } },
      choices = { { text = "I'll be here.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, standing = { sentinel_hill = 2 } } } },
    },
    priest_defias = {
      big = true,
      lines = { { id = "pd_default", text = "We bury them too. Stormwind men, a lot of them, with Stormwind mothers. Someone ought to pray for them. I find I can't." } },
      choices = {
        { text = "I can.", next = "BACK", fx = { affinity = 1, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "They chose their road.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    farmhand = {
      lines = { { id = "fh_default", text = "Then you're home. Which farm? No, don't tell me. I'd only have to tell you who sleeps in it now." } },
      choices = { { text = "Thieves, I suppose.", next = "farmhand_home" } },
    },
    farmhand_home = {
      lines = { { id = "fh2_default", text = "Thieves, or watchers, or nobody. Help me clear it, and you can tell me its name when it's yours again." } },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { sentinel_hill = 2 } } },
        { text = "I left for a reason.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    noble = {
      lines = { { id = "nb_default", text = "Then you know the men who decided we could wait. Tell them Westfall's still waiting. Tell them we've stopped being polite about it." } },
      choices = {
        { text = "Not all of us forgot you.", next = "noble_defend" },
        { text = "I'm ashamed of them.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
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
      },
    },

    after = {
      big = true,
      lines = { { id = "af_default", text = "VanCleef's gone. The Brotherhood isn't, not yet, but this is the beginning of its end. Now the farmers come home, if they dare." } },
      choices = {
        { text = "Will Stormwind come now?", next = "after_city" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_city = {
      lines = { { id = "ac_default", text = "Now the hard part's done? Likely. They'll want their tithe. Let them come and see what we kept alive without them." } },
      choices = {
        { text = "You've earned the right to say so.", next = "BACK", fx = { affinity = 2, opinion = { westfall = "abandoned" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = {
      { id = "tp_bg", text = "Born here. Trained in Lordaeron. Came home. The middle part I don't discuss.", next = "back" },
      { id = "tp_bg2", text = "A farm boy from these parts who went north to learn the Light and came back to find his home stolen. That's all of it that matters." },
    },
    advice = { { id = "tp_ad", text = "Travel the road by day and never alone past the Molsen farm. And if a scarecrow turns its head, don't wait to see what it does next." } },
    defias = {
      { id = "tp_defias", text = "Not common thieves. Organized, fed, armed, and angry. Anyone who tells you otherwise hasn't been to Moonbrook.",
        fx = { hear = "defias_trained" } },
    },
    westfall = { { id = "tp_westfall", text = "Good land. Tired land. It'll grow again if we let it." } },
    people_militia = {
      { id = "tp_militia", text = "Farmers, mostly. Some old soldiers. All of them braver than they've any reason to be." },
      { id = "tp_militia2", text = "Ours. Ask what you want to know about it.", next = "militia" },
    },
    harvest_watchers = { { id = "tp_watchers", text = "Scarecrows that walk. Ask Saldean about them; he'll talk till sundown." } },
    moonbrook = { { id = "tp_moonbrook", text = "Their town now. Don't go in alone, and don't go in at night." } },
    riverpaw = { { id = "tp_gnolls", text = "The gnolls run with the thieves. Captain Danuvin's dealing with them." } },
    blackrock = { { id = "tp_blackrock", text = "Solomon's war, not mine. I'd help him if I could. I can't." } },
    _none = { { id = "tp_none", text = "I've a war to run with a hill and some farmers. That's not part of it." } },
  },
}
