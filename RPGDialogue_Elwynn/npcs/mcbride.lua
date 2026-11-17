-- Marshal McBride, Northshire Abbey. Voice: bibles/mcbride.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mcbride", id = TODO_NPC("Marshal McBride"), name = "Marshal McBride",
  bible = "bibles/mcbride.md", role = "questgiver", tier = "major",
  communities = { "northshire" }, temper = { "steady", "sharp" },
  notices = { "greenness", "kit", "follow_through" },
  impression = {
    first = "Marshal McBride calls everyone recruit, and he means it as a duty more than an insult. He has a whole valley to hold and nowhere near enough people to hold it.",
    third = "{name} reported to Marshal McBride, who holds Northshire Valley and likes his recruits to stay alive.",
  },

  greetings = {
    { id = "g_brief", text = "Speak up, recruit, and make it quick. I've a valley to hold." },
    { id = "g_reports", text = "If it's the mine, I've read the reports. If it isn't, speak up." },
    { id = "g_regular", when = { timesTalked = { min = 4 } }, text = "You again, recruit? Good, that means you're still alive, and I like my recruits that way." },
    { id = "g_dusk", when = { timeOfDay = "dusk" }, text = "Keep your voice down, recruit. The brothers are at their prayers." },
    { id = "g_count", when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } }, text = "Count's not done, recruit." },
    { id = "g_echo", when = { questObjective = { TODO_QUEST("Skirmish at Echo Ridge"), left = { min = 1 } } }, text = "Echo Ridge isn't going to clear itself." },
  },

  notice = {
    { id = "n_kit_broken", cat = "kit", place = "before", when = { durability = { max = 0.25 } },
      text = "Before you say anything, get that armor to a smith. I don't send recruits out held together with string." },
    { id = "n_kit_naked", cat = "kit", place = "replace", when = { nearlyNaked = true },
      text = "Where is your armor, recruit? No, I don't want to know; just go and find some." },
    { id = "n_green_deaths", cat = "greenness", place = "after", when = { band = "Greenhorn", deaths = { min = 3 } },
      text = "You keep coming back down that hill in worse shape than you went up, recruit. They carry candles, not swords, so think hard about how you're losing to them." },
    { id = "n_ressick", cat = "greenness", place = "before", when = { resSick = true },
      text = "You look like the brothers just finished with you. Sit down before you fall down." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I can still hear you breathing, recruit. Stand where I can see you." },
    { id = "r_imp", on = "pet", when = { pet = { family = "Imp" } }, text = "Keep that thing off my maps. The last one set fire to a requisition." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I need the kobolds cleared out of the vineyard and the Defias kept off the Abbey road, and I've four guards to do it with. A mage who can follow orders is worth a dozen who can't, so learn to follow them." } },
      choices = {
        { text = "I'll follow your orders, Marshal. You'll have no trouble from me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll get results, Marshal, but I'll choose how.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not for sport, no. They've been taking our sheep, and I can't let a farmer's flock suffer for the sake of a wolf." } },
      choices = {
        { text = "That's fair. Protect the flock.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wolves hunt to live. Show some mercy.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "The garrison's spread thin, so I'll be brief. What do you need?" },
        { id = "h_from_willem", key = true, when = { questRecent = { TODO_QUEST("A Threat Within"), days = 1 }, metBefore = false },
          text = "Willem sent you up, then. Stand where the light's on you. Let's see what I'm working with." },
        { id = "h_return", tags = { "news" }, priority = 15, when = { metBefore = true, daysSince = { min = 7 } },
          text = "Thought we'd lost you to Goldshire. What brings you back up the hill?" },
        { id = "h_dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" },
          text = "A dwarf who talks to the weather. I've had stranger recruits this year, though not many." },
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
          text = "That's the count? Good, then hand it in properly and I'll sign it off." },
        { id = "q_kobold_recent", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Kobold Camp Cleanup"), days = 2 } },
          text = "First quiet night the brothers have had in a week. They'll pray for you. I'll settle for you staying sharp." },
        { id = "q_adventurer", when = { questActive = TODO_QUEST("The Adventurer") },
          text = "There's a newcomer camped on the road by Goldshire, probably harmless. Find out for me, and tell me if I'm wrong." },
        { id = "q_echo_active", when = { questActive = TODO_QUEST("Investigate Echo Ridge") },
          text = "My scouts say there are more of them than we thought. Go and see for yourself, and count them, recruit; don't charge them." },
        { id = "q_echo_later", when = { questLater = { TODO_QUEST("Skirmish at Echo Ridge"), days = 5 } },
          text = "Echo Ridge has gone quiet. They always come back, mind, but there are fewer of them since you went through." },
        { id = "q_thieves_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Brotherhood of Thieves"), days = 2 } },
          text = "Willem's tally of bandanas is the only thing in this valley growing faster than the kobolds. Your doing, I hear." },
        { id = "e_dughan_thieves", tags = { "news" }, when = { heardLine = "dughan.d_common_thieves" },
          text = "Dughan told you they're common thieves? Common thieves don't drill, recruit, and these do. Someone is training them.",
          fx = { hear = "defias_trained" } },
        { id = "h_priest", when = { class = "PRIEST", maxLevel = 10 },
          text = "One of Anetta's, are you? Good, because recruits bleed and kobolds bite, and if you keep my people on their feet you're worth three swords to me." },
        { id = "h_veteran", when = { minLevel = 20, metBefore = true },
          text = "Look at you. Most of the ones I send down that road never come back up it, and the ones who do don't look like this." },
        { id = "h_novice", when = { origin = "human_abbey_novice", maxLevel = 10 },
          text = "I know you; you were carrying the brothers' candles through these halls last spring. Now you'll be taking the kobolds' candles off them instead, which is the same job with more teeth." },
        { id = "h_warm", when = { disposition = { min = 72 } },
          text = "There's a face I'm glad to see. You're the sort of recruit I'd hand the valley to for an afternoon, and I don't say that lightly." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You. State your business and keep it short, recruit, because I've not forgotten the last time." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, here in Northshire! I've kobolds in the vineyard and wolves in the hills, so I'll gladly take whatever help you're offering." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and fresh from the Library Wing, I'd guess. Khelden's told me about you; he says you read faster than you listen." },
      },
      again = {
        { id = "h_again", text = "What else do you need, recruit? Be quick about it." },
        { id = "h_again2", text = "Go on, then. The maps aren't going anywhere, and neither, sadly, are the kobolds." },
        { id = "h_again3", when = { minLevel = 20 }, text = "Something else? You've earned a few more minutes than most." },
      },
      choices = {
        { text = "Do you hunt the wolves for sport, Marshal?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Reporting for duty, Marshal.", next = "orders",
          fx = { align = { order = 2 }, trait = { stern = 1 }, affinity = 1 },
          journal = { first = "Reported to Marshal McBride. He looked at me like a man counting how many of us come back.",
                      third = "{name} reported to Marshal McBride at Northshire Abbey." } },
        { text = "I'm here for the pay, Marshal, not the banner.", next = "orders", fx = { align = { order = -2 } } },
        { text = "Kobolds? You need soldiers for kobolds?", next = "kobolds", fx = { trait = { witty = 1 }, affinity = -1 } },
        { text = "I've run vermin off a farm before. These can't be worse.", next = "farmhand",
          when = { origin = "human_westfall_farmhand" }, fx = { affinity = 1 } },
        { text = "What do you make of the Defias in the valley?", next = "defias" },
        { text = "Where do recruits go after Northshire?", next = "goldshire" },
        { text = "The brothers want me in the infirmary, Marshal.", next = "priest", when = { class = "PRIEST", maxLevel = 15 } },
        { text = "Why take volunteers who aren't from Stormwind?", next = "allies", when = { race = { "Dwarf", "Gnome", "NightElf", "Skyborne" } } },
        { text = "I've seen a garrison spread too thin before. Up north.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "You sent me down that road once, Marshal.", next = "veteran", when = { minLevel = 20, metBefore = true } },
        { text = "Your letter smelled of brimstone, Marshal.", next = "warlock", when = { class = "WARLOCK", maxLevel = 15 } },
        { text = "Your letter was in cipher, Marshal.", next = "rogue", when = { class = "ROGUE", maxLevel = 15 } },
        { text = "I've brought my own beast, Marshal.", next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "The spirits of the stone brought me here, Marshal.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "What do you need from a mage, Marshal?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "That's all, Marshal.", next = "END" },
      },
    },

    kobolds = {
      lines = {
        { id = "k_default", text = "Laugh if you like, but they've moved into Echo Ridge Mine and they come out bolder every week. I'd rather do my laughing after." },
      },
      choices = {
        { text = "What are they doing in the mine?", next = "kobolds_mine" },
        { text = "Fair enough. Point me at them.", next = "orders", fx = { affinity = 1 } },
        { text = "I'll see for myself.", next = "END" },
      },
    },
    kobolds_mine = {
      lines = {
        { id = "km_default", text = "Digging, deeper every week, and the deeper they dig the harder they are to root out. One at a time they're thieves and cowards, but in numbers they're a threat to this whole valley.",
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
          text = "You cleared more of it than anyone. There may still be some down there, and I'll send others after them; that's not a failure, recruit, it's what a garrison is for." },
      },
      choices = {
        { text = "Then I'll keep coming back.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "That sounds exhausting.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 } } },
      },
    },

    orders = {
      lines = {
        { id = "o_default", text = "Good, because I've more work than hands. Let's see what fits you." },
        { id = "o_kobolds", when = { questBefore = TODO_QUEST("Kobold Camp Cleanup") },
          text = "There's a kobold camp in the woods to the north. Thin it out, then report back to me, not to the brothers." },
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
        { id = "ga_default", text = "Soldiers. Half the guard is fighting in other lands, so we take anyone willing to defend their home. We're getting a lot of you these days, and I hope it's enough." },
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
          text = "I've asked, twice, and the answer came back with a seal on it and nothing inside. Keep that to yourself, recruit." },
      },
      choices = {
        { text = "Understood, Marshal.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Someone in the city should hear about this.", next = "BACK", fx = { trait = { stern = 1 }, align = { order = -1 } } },
        { text = "You've already asked the Keep, haven't you, Marshal?", tag = "Persuade", next = "garrison_letters",
          check = { pass = { any = { { disposition = { min = 65 } }, { origin = "human_abbey_novice" }, { questDone = TODO_QUEST("Skirmish at Echo Ridge") } } } },
          fail = { next = "garrison_drop", fx = { affinity = -1 } } },
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
        { id = "dl_default", text = "I don't know, and that's what keeps me up at night. Thieves don't hold a line, but these do, and Garrick Padfoot fights like a man who's been drilled." },
        { id = "dl_garrick", when = { questDone = TODO_QUEST("Bounty on Garrick Padfoot") },
          text = "I don't know. You've met Garrick Padfoot, though, so tell me: did he fight like a cutthroat to you, or like a man who'd been drilled?" },
      },
      choices = {
        { text = "Drilled. Someone trained him.", next = "BACK", fx = { hear = "defias_trained", affinity = 1 } },
        { text = "Like a desperate man.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Like a cutthroat, and he'll die like one.", next = "BACK", fx = { align = { light = -1 } } },
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
        { id = "du_default", text = "A good officer with too much ground to hold. He'll tell you the Defias are Westfall's problem, because that keeps Goldshire calm, and I don't blame him for it, but I don't agree with him either." },
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
        { id = "fh_default", text = "Westfall, is it? Every one of you who comes up this hill says 'before the Defias came', and that tells me all I need to know about them.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Then put me where they are.", next = "orders", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Good; I'd rather have one healer than three more swords. Stay behind the fighters, and if you ever find yourself in front of them, something's gone wrong, and it's usually my fault." },
      },
      choices = {
        { text = "And if the fighting comes to me?", next = "priest_fight" },
        { text = "Behind the fighters. Understood.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    priest_fight = {
      lines = {
        { id = "pf_default", text = "Then you swing whatever you're holding; the Light won't mind, and neither will I. After that, you heal the idiot who let it through." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    allies = {
      lines = {
        { id = "al_default", text = "Because the Alliance is supposed to mean something. We're enlisting anyone willing to defend their home and their alliance, and that means you as much as any farm lad from Elwynn." },
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
        { id = "lo_default", text = "Lordaeron, yes. Then you know why I don't laugh at kobolds, or bandits, or anything else that grows while nobody's watching it." },
      },
      choices = {
        { text = "That's why I'm here.", next = "BACK", fx = { affinity = 3, align = { order = 1 } } },
        { text = "I came south to look after myself, not to stand watch.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Nobody watched for us.", next = "lordaeron_watch" },
      },
    },
    lordaeron_watch = {
      lines = { { id = "lw_default", text = "No, nobody did, so I watch now. That's all a marshal really is, recruit: someone who keeps watch so the brothers can sleep." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    veteran = {
      lines = {
        { id = "v_default", text = "I did, and I remember the ones who come back. What brings someone your size back up my hill?" },
      },
      choices = {
        { text = "Visiting the Abbey. And you.", next = "veteran_visit", fx = { affinity = 2 } },
        { text = "Checking you still need me.", next = "veteran_need" },
      },
    },
    veteran_visit = {
      lines = { { id = "vv_default", text = "Me? Light's sake, don't let the recruits hear you say that, or they'll think I've gone soft." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran_need = {
      lines = { { id = "vn_default", text = "Always, though not for kobolds. Go and do what we trained you for, somewhere it matters more than my woods." } },
      choices = {
        { text = "Then I'll go where the fight matters most.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go where I please, Marshal.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    garrison_letters = {
      big = true,
      lines = {
        { id = "gl_default", text = "Twice, in my own hand, with the kobold counts attached. The first came back from the Highlord's clerk saying he'd consider it, and the second came back from Lady Prestor's office saying the valley must make do with what it has." },
        { id = "gl_after", text = "So we make do. The brothers bind my recruits for nothing, Willem counts bandanas, and I write a third letter in my head every night and never send it. That stays on this hill, recruit." },
      },
      choices = {
        { text = "It stays here, Marshal.", next = "BACK", fx = { affinity = 2 } },
        { text = "The valley deserves better than making do.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    garrison_drop = {
      lines = {
        { id = "gd_default", text = "What I've asked and of whom is between me and the Keep, recruit. Your business is the kobolds, so let's keep it there." },
        { id = "gd_default2", text = "Recruits who ask about the garrison's letters end up writing them, and you don't want that job. Drop it." },
      },
      choices = {
        { text = "Yes, Marshal.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    warlock = {
      big = true,
      lines = { { id = "warlock_l", text = "It did, and I wrote it anyway, because the kingdom asked me to send every recruit to their teacher, and La Salle is yours. I don't have to like it, recruit, and I don't." } },
      choices = {
        { text = "You'll be glad of me when the Defias come.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "I don't need your approval, Marshal.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Why does the kingdom allow us at all?", next = "warlock2" },
      },
    },
    warlock2 = {
      lines = { { id = "warlock2_l", text = "Because the orcs had warlocks, and we lost the First War. That's all the answer I've ever been given, and it's enough to keep me writing the letters." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "rogue_l", text = "It was. Kerridan insists, and I've stopped arguing; a recruit who can't read a cipher can't find his teacher, and that's apparently the first lesson." } },
      choices = {
        { text = "Did you read it before you sent it?", next = "rogue2" },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    rogue2 = {
      lines = { { id = "rogue2_l", text = "I tried. It said something about the price of turnips, and I'm fairly sure it was mocking me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    hunter = {
      lines = { { id = "hunter_l", text = "So I see. Keep it off the Abbey's flowerbeds and away from the brothers' chickens, and it can hunt every kobold and wolf in the valley for all I care." } },
      choices = {
        { text = "It only hunts what I point it at.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No promises about the chickens.", next = "BACK", fx = { trait = { witty = 1 }, align = { order = -1 } } },
      },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "The stone, is it. Ironforge's letter said to expect you and said nothing about what you'd be, so I'll judge you on kobolds like everyone else. Is that fair?" } },
      choices = {
        { text = "More than fair, Marshal.", next = "BACK", fx = { affinity = 2 } },
        { text = "The spirits judge differently.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I keep a map of this valley in my head and a pile of reports on my desk. Ask me about any of this, recruit, and I'll give it to you straight." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer on these, and quickly, because I've a valley to hold." },
    },
    background = { { id = "tp_bg", text = "A marshal of the Stormwind Army with a valley to hold and not enough soldiers to hold it. That's the whole story, recruit.", next = "garrison" } },
    advice = { { id = "tp_ad", text = "Count before you charge: scouts first, steel second. Most of the recruits I've had to bury got that the wrong way round." } },
    kobolds = { { id = "t_kobolds", text = "Vermin with candles and shovels. Don't underestimate the shovels." } },
    echo_ridge = { { id = "t_echo", text = "An old mine north of here. The kobolds took it, and they dig deeper every week." } },
    defias = { { id = "t_defias", text = "Organized, and closer to the Abbey than I like. Ask Willem, since he's been counting their bandanas.", fx = { hear = "defias_trained" } } },
    hogger = { { id = "t_hogger", text = "Dughan's problem, thank the Light. Don't go near him at your size." } },
    northshire_abbey = { { id = "tp_abbey", text = "The brothers pray and I post sentries, and between the two of us the Abbey stays standing." } },
    _none = { { id = "t_none", text = "That's not a garrison matter. Ask the brothers; they read." } },
  },
}
