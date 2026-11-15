-- Marshal McBride, Northshire Abbey. Voice: bibles/mcbride.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mcbride", id = TODO_NPC("Marshal McBride"), name = "Marshal McBride",
  bible = "bibles/mcbride.md", role = "questgiver", tier = "major",
  communities = { "northshire" }, temper = { "steady", "sharp" },
  notices = { "greenness", "kit", "follow_through" },

  greetings = {
    { id = "g_brief", text = "Recruit. Make it quick." },
    { id = "g_reports", text = "If it's the mine, I've read the reports. If it isn't, speak up." },
    { id = "g_regular", when = { timesTalked = { min = 4 } }, text = "You again. Good. Means you're still alive." },
    { id = "g_dusk", when = { timeOfDay = "dusk" }, text = "Quietly. The brothers are at prayers." },
    { id = "g_count", when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } }, text = "Count's not done, recruit." },
    { id = "g_echo", when = { questObjective = { TODO_QUEST("Skirmish at Echo Ridge"), left = { min = 1 } } }, text = "Echo Ridge isn't going to clear itself." },
  },

  notice = {
    { id = "n_kit_broken", cat = "kit", place = "before", when = { durability = { max = 0.25 } },
      text = "Before you say anything, get that armor to a smith. I don't send recruits out held together with string." },
    { id = "n_kit_naked", cat = "kit", place = "replace", when = { nearlyNaked = true },
      text = "Where is your armor, recruit? No. I don't want to know. Go and find some." },
    { id = "n_green_deaths", cat = "greenness", place = "after", when = { band = "Greenhorn", deaths = { min = 3 } },
      text = "You keep coming back down that hill in worse shape than you went up. They carry candles, recruit. Not swords." },
    { id = "n_ressick", cat = "greenness", place = "before", when = { resSick = true },
      text = "You look like the brothers just finished with you. Sit down before you fall down." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I can still hear you breathing, recruit. Stand where I can see you." },
    { id = "r_imp", on = "pet", when = { pet = { family = "Imp" } }, text = "Keep that thing off my maps. The last one set fire to a requisition." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "The garrison's spread thin, so I'll be brief. What do you need?" },
        { id = "h_from_willem", key = true, when = { questRecent = { TODO_QUEST("A Threat Within"), days = 1 }, metBefore = false },
          text = "Willem sent you up, then. Stand where the light's on you. Let's see what I'm working with." },
        { id = "h_return", tags = { "news" }, priority = 15, when = { metBefore = true, daysSince = { min = 7 } },
          text = "Thought we'd lost you to Goldshire. What brings you back up the hill?" },
        { id = "h_dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" },
          text = "A dwarf who talks to the weather. I've had stranger recruits this year. Not many." },
        { id = "h_human_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A hunter. Good. I've wolves on one side and kobolds on the other, and I'd like both of them counted from a distance." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Skyborne. I'm told the Kirin Tor vouched for your people. Out here the kobolds will judge you on your own." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "A long way from your forests. If you're lost, Goldshire's south. If you're not, I've work." },
        { id = "h_champion", when = { band = "Champion" },
          text = "You're a long way past kobolds. If you're visiting the Abbey, the brothers will be pleased. I'll be suspicious." },
        { id = "q_kobold_before", when = { questBefore = TODO_QUEST("Kobold Camp Cleanup"), band = "Greenhorn" },
          text = "There's a kobold camp in the woods north of here, and they're getting bold. I need it thinned." },
        { id = "q_kobold_progress", when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } },
          text = "That count isn't done. They multiply in those woods faster than I can find recruits." },
        { id = "q_kobold_ready", when = { questReady = TODO_QUEST("Kobold Camp Cleanup") },
          text = "That's the count? Good. Hand it in properly and I'll sign it off." },
        { id = "q_kobold_recent", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Kobold Camp Cleanup"), days = 2 } },
          text = "First quiet night the brothers have had in a week. They'll pray for you. I'll settle for you staying sharp." },
        { id = "q_adventurer", when = { questActive = TODO_QUEST("The Adventurer") },
          text = "There's a newcomer camped on the road by Goldshire. Probably harmless. Find out, and tell me if I'm wrong." },
        { id = "q_echo_active", when = { questActive = TODO_QUEST("Investigate Echo Ridge") },
          text = "My scouts say there's more of them than we thought. Go and see. Count, don't charge." },
        { id = "q_echo_later", when = { questLater = { TODO_QUEST("Skirmish at Echo Ridge"), days = 5 } },
          text = "Echo Ridge has gone quiet. They always come back, mind. Fewer, since you went through." },
        { id = "q_thieves_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Brotherhood of Thieves"), days = 2 } },
          text = "Willem's tally of bandanas is the only thing in this valley growing faster than the kobolds. Your doing, I hear." },
        { id = "e_dughan_thieves", tags = { "news" }, when = { heardLine = "dughan.d_common_thieves" },
          text = "Dughan told you they're common thieves? Common thieves don't drill. Someone is training them.",
          fx = { hear = "defias_trained" } },
        { id = "h_priest", when = { class = "PRIEST", maxLevel = 10 },
          text = "One of Anetta's. Good. Recruits bleed and kobolds bite. Keep my people on their feet and you're worth three swords to me." },
        { id = "h_veteran", when = { minLevel = 20, metBefore = true },
          text = "Look at you. Most of the ones I send down that road don't come back up it. The ones who do never look like this." },
        { id = "h_novice", when = { origin = "human_abbey_novice", maxLevel = 10 },
          text = "I know you. You were carrying the brothers' candles through these halls last spring. Now you'll go and take the kobolds' candles off them. Same job, more teeth." },
      },
      again = {
        { id = "h_again", text = "What else, recruit? Quickly." },
        { id = "h_again2", text = "Go on. The maps aren't going anywhere. Neither are the kobolds." },
        { id = "h_again3", when = { minLevel = 20 }, text = "Something else? You've earned a few more minutes than most." },
      },
      choices = {
        { text = "Reporting for duty, Marshal.", next = "orders",
          fx = { align = { order = 2 }, trait = { stern = 1 }, affinity = 1 },
          journal = { first = "Reported to Marshal McBride. He looked at me like a man counting how many of us come back.",
                      third = "{name} reported to Marshal McBride at Northshire Abbey." } },
        { text = "Kobolds? You need soldiers for kobolds?", next = "kobolds", fx = { trait = { witty = 1 }, affinity = -1 } },
        { text = "I've run vermin off a farm before. These can't be worse.", next = "farmhand",
          when = { origin = "human_westfall_farmhand" }, fx = { affinity = 1 } },
        { text = "What do you make of the Defias in the valley?", next = "defias" },
        { text = "Where do recruits go after Northshire?", next = "goldshire" },
        { text = "The brothers want me in the infirmary, Marshal.", next = "priest", when = { class = "PRIEST", maxLevel = 15 } },
        { text = "Why take volunteers who aren't from Stormwind?", next = "allies", when = { race = { "Dwarf", "Gnome", "NightElf", "Skyborne" } } },
        { text = "I've seen a garrison spread too thin before. Up north.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "You sent me down that road once, Marshal.", next = "veteran", when = { minLevel = 20, metBefore = true } },
        { text = "That's all, Marshal.", next = "END" },
      },
    },

    kobolds = {
      lines = {
        { id = "k_default", text = "Laugh if you like. They've moved into Echo Ridge Mine, and they come out bolder every week. I'd rather laugh after." },
      },
      choices = {
        { text = "What are they doing in the mine?", next = "kobolds_mine" },
        { text = "Fair enough. Point me at them.", next = "orders", fx = { affinity = 1 } },
        { text = "I'll see for myself.", next = "END" },
      },
    },
    kobolds_mine = {
      lines = {
        { id = "km_default", text = "Digging. Deeper every week, and the deeper they dig, the harder they are to root out. Thieves and cowards, one at a time. A threat in numbers.",
          fx = { learn = { "echo_ridge", "kobolds" } } },
      },
      choices = {
        { text = "Will it ever be finished?", next = "kobolds_never" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kobolds_never = {
      lines = {
        { id = "kn_default", text = "No. Nothing in this valley is ever finished. You clear the mine, and next month there may be more. Then I find someone else to send." },
        { id = "kn_done", when = { questDone = TODO_QUEST("Skirmish at Echo Ridge") },
          text = "You cleared more of it than anyone. There may still be some down there. I'll send others. That's not a failure, recruit. That's a garrison." },
      },
      choices = {
        { text = "Then I'll keep coming back.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "That sounds exhausting.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    orders = {
      lines = {
        { id = "o_default", text = "Good. I've more work than hands. Let's see what fits you." },
        { id = "o_kobolds", when = { questBefore = TODO_QUEST("Kobold Camp Cleanup") },
          text = "Kobold camp, north woods. Thin it out, then report to me. Not to the brothers." },
        { id = "o_done_here", when = { questDone = TODO_QUEST("Skirmish at Echo Ridge") },
          text = "Nothing left here that needs you. Marshal Dughan in Goldshire can use a recruit who finishes things." },
      },
      choices = {
        { text = "Show me the work.", next = "BUSINESS" },
        { text = "What's the garrison short of?", next = "garrison" },
        { text = "Understood.", next = "END" },
      },
    },
    garrison = {
      lines = {
        { id = "ga_default", text = "Soldiers. Half the guard's fighting in other lands. So we take anyone willing to defend their home. We're getting a lot of you. I hope it's enough." },
      },
      choices = {
        { text = "Can't Stormwind send more?", next = "garrison_more" },
        { text = "It'll be enough.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    garrison_more = {
      big = true,
      lines = {
        { id = "gm_default", text = "Ask me something else, recruit." },
        { id = "gm_liked", when = { affinity = { min = 4 } },
          text = "I've asked. Twice. The answer came back with a seal on it and nothing in it. Keep that to yourself." },
      },
      choices = {
        { text = "Understood, Marshal.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Someone in the city should hear about this.", next = "BACK", fx = { trait = { stern = 1 }, align = { order = -1 } } },
      },
    },

    defias = {
      big = true,
      lines = {
        { id = "d_default", key = true,
          text = "They're in the valley and they're organized. A thief with a cause is still a thief. Some of them were honest men, once.",
          fx = { hear = "defias_trained", learn = { "defias" } } },
        { id = "d_kind", when = { alignment = { axis = "light", min = 30 } },
          text = "You'll want to tell me they're desperate men. Some are. Desperate men still put knives in my recruits.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Then give them a chance to surrender first.", next = "BACK",
          fx = { align = { light = 3 }, trait = { kind = 1 }, opinion = { defias = "mercy" } },
          journal = { first = "Told McBride the Defias should get a chance to surrender. He didn't argue. He didn't agree either.",
                      third = "{name} told McBride the Defias deserved a chance to surrender." } },
        { text = "A thief's a thief. I'll treat them like one.", next = "BACK",
          fx = { align = { order = 3 }, trait = { stern = 1 }, opinion = { defias = "hardline" }, affinity = 1 },
          journal = { first = "McBride asked about the Defias. I told him a thief's a thief. He nodded like I'd passed something.",
                      third = "{name} told McBride the Defias should be treated as thieves, nothing more." } },
        { text = "Who's organizing them? That's who I'd want.", next = "defias_leaders",
          fx = { align = { honor = -2 }, trait = { curious = 1 }, opinion = { defias = "follow_the_leaders" } },
          journal = { first = "Asked McBride who's behind the Defias. He didn't know. He didn't like not knowing.",
                      third = "{name} asked Marshal McBride who leads the Defias. He had no answer." } },
      },
    },
    defias_leaders = {
      lines = {
        { id = "dl_default", text = "I don't know. That's what keeps me up. Thieves don't hold a line. These do. Garrick Padfoot fights like a man who's been drilled." },
        { id = "dl_garrick", when = { questDone = TODO_QUEST("Bounty on Garrick Padfoot") },
          text = "I don't know. You've met Garrick Padfoot. Did he fight like a cutthroat to you? Or like a man who'd been drilled?" },
      },
      choices = {
        { text = "Drilled. Someone trained him.", next = "BACK", fx = { hear = "defias_trained", affinity = 1 } },
        { text = "Like a desperate man.", next = "BACK", fx = { align = { light = 1 } } },
      },
    },

    goldshire = {
      lines = {
        { id = "gs_default", text = "South road, past the border gates, to Goldshire. Marshal Dughan has all of Elwynn to hold and fewer men to hold it than I have." },
      },
      choices = {
        { text = "What's Dughan like?", next = "dughan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dughan = {
      lines = {
        { id = "du_default", text = "A good officer with too much ground. He'll tell you the Defias are Westfall's problem. He keeps Goldshire calm that way. I don't blame him. I don't agree with him." },
      },
      choices = {
        { text = "Should I tell him you said so?", next = "dughan_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dughan_tell = {
      lines = {
        { id = "dt_default", text = "Tell him what you've seen yourself. He'll believe that sooner than he'll believe me. We've known each other too long to listen to each other." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { hear = "defias_trained" } } },
    },

    farmhand = {
      lines = {
        { id = "fh_default", text = "Westfall. Every one of you up this hill says 'before the Defias came'. That tells me what I need to know about them.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Then put me where they are.", next = "orders", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Good. I'd rather one healer than three more swords. Stay behind the fighters. If you're in front, something's gone wrong, and it's usually my fault." },
      },
      choices = {
        { text = "And if the fighting comes to me?", next = "priest_fight" },
        { text = "Behind the fighters. Understood.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    priest_fight = {
      lines = {
        { id = "pf_default", text = "Then you swing whatever you're holding. The Light won't mind, and neither will I. Then you heal the idiot who let it through." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    allies = {
      lines = {
        { id = "al_default", text = "Because the Alliance is supposed to mean something. We're enlisting anyone willing to defend their home, and their alliance. That means you." },
        { id = "al_dwarf", when = { race = "Dwarf" },
          text = "Ironforge stood with us in the Second War. I'll not turn a dwarf away from a kobold. You lot are better in tunnels than we are anyway." },
        { id = "al_skyborne", when = { race = "Skyborne" },
          text = "The Kirin Tor vouched for your people, and the army took them at their word. The kobolds won't care where you're from. Neither will I." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },

    lordaeron = {
      big = true,
      lines = {
        { id = "lo_default", text = "Lordaeron. Yes. Then you know why I don't laugh at kobolds, or bandits, or anything else that grows while nobody's watching." },
      },
      choices = {
        { text = "That's why I'm here.", next = "BACK", fx = { affinity = 3, align = { order = 1 } } },
        { text = "Nobody watched for us.", next = "lordaeron_watch" },
      },
    },
    lordaeron_watch = {
      lines = { { id = "lw_default", text = "No. So I watch now. That's all a marshal is, recruit. Someone who watches so the brothers can sleep." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    veteran = {
      lines = {
        { id = "v_default", text = "I did. And I remember the ones who come back. What brings someone your size back up my hill?" },
      },
      choices = {
        { text = "Visiting the Abbey. And you.", next = "veteran_visit", fx = { affinity = 2 } },
        { text = "Checking you still need me.", next = "veteran_need" },
      },
    },
    veteran_visit = {
      lines = { { id = "vv_default", text = "Me? Light's sake. Don't let the recruits see. They'll think I'm soft." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran_need = {
      lines = { { id = "vn_default", text = "Always. Not for kobolds, though. Go and do what we trained you for, somewhere it matters more than my woods." } },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { order = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A marshal of the Stormwind Army with a valley to hold and not enough soldiers to hold it. That's the whole story, recruit.", next = "garrison" } },
    advice = { { id = "tp_ad", text = "Count before you charge. Scouts first, steel second. Most of the recruits I bury got that the wrong way round." } },
    kobolds = { { id = "t_kobolds", text = "Vermin with candles and shovels. Don't underestimate the shovels." } },
    echo_ridge = { { id = "t_echo", text = "An old mine north of here. The kobolds took it, and they dig deeper every week." } },
    defias = { { id = "t_defias", text = "Organized, and closer to the Abbey than I like. Ask Willem. He's been counting bandanas.", fx = { hear = "defias_trained" } } },
    hogger = { { id = "t_hogger", text = "Dughan's problem, thank the Light. Don't go near him at your size." } },
    northshire_abbey = { { id = "tp_abbey", text = "The brothers pray. I post sentries. Between us, the Abbey stays standing." } },
    _none = { { id = "t_none", text = "Not a garrison matter. Ask the brothers. They read." } },
  },
}
