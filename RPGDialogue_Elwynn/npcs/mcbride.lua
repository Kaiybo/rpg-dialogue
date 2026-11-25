-- Marshal McBride, Northshire Abbey. Voice: bibles/mcbride.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mcbride", id = TODO_NPC("Marshal McBride"), name = "Marshal McBride",
  bible = "bibles/mcbride.md", role = "questgiver", tier = "major",
  communities = { "northshire" }, temper = { "steady", "sharp" }, likesTone = "blunt",
  notices = { "greenness", "kit", "follow_through" },
  impression = {
    first = "He has a whole valley to hold and too few holding it.",
    third = "{name} reported to Marshal McBride, who holds Northshire Valley and likes his recruits to stay alive.",
  },

  greetings = {
    { id = "hum_g1", when = { race = "Human" }, priority = 5,
      text = "Another Elwynn recruit. Good, because you'll already know which end of a kobold is dangerous, and I won't have to explain it." },
    { id = "g_brief", text = "Speak up, recruit, and make it quick. I've a valley to hold." },
    { id = "g_reports", text = "If it's the mine, I've read the reports. If it isn't, speak up." },
    { id = "g_regular", when = { timesTalked = { min = 4 } }, text = "You again, recruit? Good, that means you're still alive, and I like my recruits that way." },
    { id = "g_dusk", when = { timeOfDay = "dusk" }, text = "Keep your voice down, recruit. The brothers are at their prayers." },
    { id = "g_count", when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } }, text = "Your kobold count's not done yet, recruit." },
    { id = "g_echo", when = { questObjective = { TODO_QUEST("Skirmish at Echo Ridge"), left = { min = 1 } } }, text = "The kobolds in Echo Ridge Mine won't clear themselves, recruit." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, recruit, and you came back on your own feet. That's more than I can say for some." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "You've been gone {away}, and you don't walk like a recruit any longer. I'll keep calling you one, mind, because that's my privilege." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come a long way from the kobold camps since we last spoke, recruit. Northshire trained you well, and I'll take a little of the credit." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear someone in the valley caught you in a lie, recruit. Report to me straight, because a soldier who lies in his reports gets people killed." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The brothers tell me you've been pulling your weight around the Abbey. Good work, recruit, so keep it up." },
  },

  notice = {
    { id = "n_kit_broken", cat = "kit", place = "before", when = { durability = { max = 0.25 } },
      text = "Before you say anything, get that armor to a smith. I don't send recruits out held together with string." },
    { id = "n_kit_naked", cat = "kit", place = "replace", when = { nearlyNaked = true },
      text = "Where is your armor, recruit? No, I don't want to know; just go and find some." },
    { id = "n_green_deaths", cat = "greenness", place = "after", when = { band = "Greenhorn", deaths = { min = 3 } },
      text = "You keep coming back down that hill in worse shape than you went up, recruit. Those kobolds carry candles, not swords, so think hard about how you're losing to them." },
    { id = "n_ressick", cat = "greenness", place = "before", when = { resSick = true },
      text = "You look like the brothers just finished with you. Sit down before you fall down." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I can still hear you breathing, recruit. Stand where I can see you." },
    { id = "r_imp", on = "pet", when = { pet = { family = "Imp" } }, text = "Keep that thing off my maps. The last one set fire to a requisition." },
  },

  start = "hello",
  nodes = {
    dd_rolf = {
      lines = {
        { id = "dd_rolf_a", text = "So am I. Rolf was a stubborn man and a good sergeant, and he'd have charged that camp himself before he'd have sent a recruit ahead of him. That's what killed him, I'd wager, and it's what I'd want written on his stone." },
      },
      choices = {
        { text = "He died leading from the front. There's honor in that.", next = "dd_rolf_2", fx = { align = { honor = 1 } } },
        { text = "He should have waited for more men. Pride got him killed.", next = "dd_rolf_2", fx = { align = { honor = -1 } } },
      },
    },
    dd_rolf_2 = {
      lines = {
        { id = "dd_rolf_2a", text = "Maybe so, and I've said both of those things myself on different nights. Keep him in mind the next time you're tempted to rush something, recruit, because I'd rather not write to Dughan about you." },
      },
      choices = { { text = "I'll remember, Marshal. Something else.", next = "BACK" } },
    },

    xpt_mcbride = {
      big = true,
      lines = { { id = "xpt_mcbride_default", text = "They do, and they'll tell you so at length, though they'll also want you to stay for vespers. My own concern is simpler: so long as there are kobolds in Echo Ridge and Defias in the vineyards, I'll welcome anyone who can hold a blade." } },
      choices = {
        { text = "The monks' prayers do as much good as any blade.", next = "BACK", reply = "Maybe so, and I'd never say otherwise in their hearing. But prayer doesn't stand watch on the vineyard wall at night, recruit, and my guards do.", fx = { align = { light = 1 } } },
        { text = "Blades keep the abbey safe, Marshal. Prayer comes after.", next = "BACK", reply = "That's my view, though I'll thank you not to say it near Brother Sammuel. Keep your blade sharp and your mouth shut at vespers.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The vineyard, where the Defias pick at our grapes, and the kobold camps to the east, where the miners stopped going. Llane Beshere has your training, but I have the map, and the map's mostly red." } },
      choices = {
        { text = "Put me where the line's thinnest, Marshal.", next = "BACK", reply = "Good answer, and I'll hold you to it. The vineyard's thinnest right now, so start there.", fx = { align = { order = 1 } } },
        { text = "I'll go where the fighting's best, Marshal.", next = "BACK", reply = "That's a soldier who wants glory, and glory gets recruits killed. You'll go where I send you, and you'll be glad of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I need the kobolds cleared out of the vineyard and the Defias kept off the Abbey road, and I've four guards to do it with. A mage who can follow orders is worth a dozen who can't, so learn to follow them." } },
      choices = {
        { text = "I'll follow your orders, Marshal. You'll have no trouble from me.", next = "BACK", reply = "Good, because I've no time for mages who think they know better than the map. Report to the vineyard when you're ready.", fx = { align = { order = 1 } } },
        { text = "I'll get results, Marshal, but I'll choose how.", next = "BACK", reply = "Results without discipline are how fires start, and I've lost one barn already. Choose wisely, then, and choose my way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not for sport, no. They've been taking our sheep, and I can't let a farmer's flock suffer for the sake of a wolf." } },
      choices = {
        { text = "That's fair. Protect the flock.", next = "BACK", reply = "Glad you see it plainly. I take no joy in it, but the farmers need their sheep more than the wolves need their supper.", fx = { align = { order = 1 } } },
        { text = "Wolves hunt to live. Show some mercy.", next = "BACK", reply = "Mercy's a fine thing for a druid, and I'll not mock it. But the farmer who loses his flock goes hungry, and I'll not put a wolf before a family.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Fewer than I'd lose without the Abbey, and more than I'd like to write home about. The kobolds in the mine aren't much, but a recruit who panics is worse than any kobold, and I can't train the panic out of them fast enough." } },
      choices = {
        { text = "Then I'll help steady them when the panic comes.", next = "BACK", reply = "I'd be grateful for it, because a calm voice saves more lives than a sharp blade. Stay close to the new ones.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Panic culls the weak, Marshal. Better here than at the front.", next = "BACK", reply = "That's a hard view, and I don't share it. Every recruit I lose here is one less man at the front, so I'll train them, not cull them.", fx = { align = { light = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "On the line, between the recruits and whatever's coming at them, because that's where the Light does the most good. I've read the old histories, and the Silver Hand never won a fight from a pew." } },
      choices = {
        { text = "Then I'll stand on the line, Marshal.", next = "BACK", reply = "Good, then I'll know where to find you when it counts. The recruits fight better with a paladin beside them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll serve where my conscience sends me, Marshal.", next = "BACK", reply = "Then I hope your conscience sends you to the line, because that's where I need you. I'll not order a paladin, but I'll ask.", fx = { align = { order = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    hu_valley = {
      lines = {
        { id = "hum_valley", key = true,
          text = "Because the Abbey's been teaching the Light longer than most of the noble houses have had names, recruit, and the kingdom likes its soldiers to start near the Light. It also likes them to start somewhere the kobolds can't kill too many of them, though nobody says that part aloud." },
      },
      choices = {
        { text = "And the Defias by the vineyards, Marshal?", next = "hu_valley2" },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    hu_valley2 = {
      lines = {
        { id = "hum_valley2",
          text = "Those are what stick in my throat, recruit. Thieves in Northshire, a stone's throw from the Abbey, and every one of them a Stormwind man who used to tip his cap to the brothers, so see Deputy Willem if you want to do something about it." },
      },
      choices = {
        { text = "They chose the mask, Marshal. They're traitors now.", next = "BACK",
          reply = "They did, and the law will treat them so. I only find I can't hate a man I might have stood beside at a christening, which is a poor habit in a marshal.",
          fx = { align = { order = 1 } } },
        { text = "They're our own, Marshal. Someone failed them first.", next = "BACK",
          reply = "Somebody did, and it wasn't the brothers. Say so in the valley if you like, but take the bounty anyway, because failed men still put knives in farmers.",
          fx = { align = { order = -1 } } },
        { text = "That's all, Marshal.", next = "END" },
      },
    },
    hu_expect = {
      lines = {
        { id = "hum_expect", key = true,
          text = "I do, and I won't apologise for it. A dwarf who runs from a kobold has run from someone else's war, recruit, but a human who runs from one has run from his own front door." },
      },
      choices = {
        { text = "That's not fair to us, Marshal.", next = "hu_expect2" },
        { text = "Then I won't run. Something else.", next = "BACK" },
      },
    },
    hu_expect2 = {
      big = true,
      lines = {
        { id = "hum_expect2",
          text = "No, it isn't, and neither is the valley. The kingdom's stretched from Redridge to the Wetlands and the King hasn't come home, so the ones whose country it is carry the extra weight, and you'll carry it too, recruit, or you'll go back to Goldshire." },
      },
      choices = {
        { text = "I'll carry it. It's my kingdom too.", next = "BACK",
          reply = "Good. Echo Ridge first, and the kingdom after.",
          fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll carry what I choose, Marshal, not what I'm handed.", next = "BACK",
          reply = "Then choose well and choose quickly, recruit, because the kobolds won't wait while you decide.",
          fx = { align = { order = -1 } } },
        { text = "That's all, Marshal.", next = "END" },
      },
    },
    hu_what = {
      lines = {
        { id = "hum_what", key = true,
          text = "We're short-lived and we know it, so we build in a hurry, fight in a hurry and pray in between. The brothers would say we're the Light's stubbornest children, and I'd say we're too busy to be anything else." },
      },
      choices = {
        { text = "Something else, Marshal.", next = "BACK" },
        { text = "That's all, Marshal.", next = "END" },
      },
    },
    hello = {
      narr = {
        { text = "He looks you over from boots to collar, the way he checks a sentry's kit before the night watch.", when = { metBefore = false } },
        { text = "He glances up from the map spread across the courtyard table, a stub of charcoal still between his fingers." },
      },
      lines = {
        { id = "hum_h1", when = { race = "Human" },
          text = "You'll have grown up hearing about Northshire, recruit, so you'll know the Abbey's more than a church. Stormwind's own learn their trade in this valley, and I'd like you to learn it properly." },
        { id = "dd_rolf", when = { questDone = TODO_QUEST("Discover Rolf's Fate") },
          text = "Dughan wrote to me about Rolf and his men at the murloc camp by the lake, and that you were the one who found them. I trained two of those footmen myself, recruit, so I thank you for bringing them home in word, if not in body." },
        { id = "dd_hogger_mcb", when = { killed = { name = "Hogger" } },
          text = "They tell me Hogger's dead and that you were there when it happened. I remember when you couldn't keep a kobold off your back, recruit, so don't let it go to your head." },

        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "Another recruit with the look of {alt}, I see. That {altclass} came through Northshire before you and did good work, so I'll expect the same from you." },
        { id = "h_alt_higher", when = { alt = { higher = true }, metBefore = true }, cooldown = "5d",
          text = "I hear {alt} has gone a long way since passing through this abbey, and the garrison still talks about it. See that you give them something to talk about as well." },
        { id = "h_pt_mcbride", tags = { "news" }, when = { party = true },
          text = "You've brought a company back to Northshire. Good; the abbey has always done better when its graduates come home with friends than when they come home alone and wounded." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A healer. Priestess Anetta will claim you, but the barracks will claim you first, so sleep where you can." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Brother Sammuel will have you, but the garrison needs you more, so don't spend all day in the chapel." },
        { id = "h_default", text = "The garrison's spread thin, with kobolds in the mine and worse in the woods, so I'll be brief. What do you need?" },
        { id = "h_from_willem", key = true, when = { questRecent = { TODO_QUEST("A Threat Within"), days = 1 }, metBefore = false },
          text = "Deputy Willem sent you up, then. Stand where the light's on you and let's see what I'm working with." },
        { id = "h_return", tags = { "news" }, priority = 15, when = { metBefore = true, daysSince = { min = 7 } },
          text = "I thought we'd lost you to Goldshire. What brings you back up the hill?" },
        { id = "h_dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" },
          text = "A dwarf who talks to the weather. I've had stranger recruits this year, though not many." },
        { id = "h_human_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A hunter, good. I've wolves on one side and kobolds on the other, and I'd like both of them counted from a distance." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Skyborne. I'm told the Kirin Tor vouched for your people. Out here the kobolds will judge you on your own." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "You're a long way from your forests. If you're lost, Goldshire's south, and if you're not, I've work." },
        { id = "h_champion", when = { band = "Champion" },
          text = "You're a long way past kobolds. If you're visiting the Abbey, the brothers will be pleased, but I'll be suspicious." },
        { id = "q_kobold_before", when = { questBefore = TODO_QUEST("Kobold Camp Cleanup"), band = "Greenhorn" },
          text = "There's a kobold camp in the woods north of here, and they're getting bold. I need it thinned." },
        { id = "q_kobold_progress", when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } },
          text = "That count isn't done. They multiply in those woods faster than I can find recruits." },
        { id = "q_kobold_ready", when = { questReady = TODO_QUEST("Kobold Camp Cleanup") },
          text = "That's the count? Good, then hand it in properly and I'll sign it off." },
        { id = "q_kobold_recent", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Kobold Camp Cleanup"), days = 2 } },
          text = "The brothers have had their first quiet night in a week, and they'll pray for you. I'll settle for you staying sharp." },
        { id = "q_adventurer", when = { questActive = TODO_QUEST("The Adventurer") },
          text = "There's a newcomer camped on the road by Goldshire, probably harmless. Find out for me, and tell me if I'm wrong." },
        { id = "q_echo_active", when = { questActive = TODO_QUEST("Investigate Echo Ridge") },
          text = "My scouts say there are more kobolds in Echo Ridge than we thought. Go and see for yourself, and count them, recruit; don't charge them." },
        { id = "q_echo_later", when = { questLater = { TODO_QUEST("Skirmish at Echo Ridge"), days = 5 } },
          text = "Echo Ridge has gone quiet. They always come back, mind, but there are fewer of them since you went through." },
        { id = "q_thieves_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Brotherhood of Thieves"), days = 2 } },
          text = "Deputy Willem's tally of bandanas is the only thing in this valley growing faster than the kobolds. Your doing, I hear." },
        { id = "e_dughan_thieves", tags = { "news" }, when = { heardLine = "dughan.d_common_thieves" },
          text = "Marshal Dughan told you they're common thieves? Common thieves don't drill, recruit, and these do. Someone is training them.",
          fx = { hear = "defias_trained" } },
        { id = "h_priest", when = { class = "PRIEST", maxLevel = 10 },
          text = "One of Priestess Anetta's, are you? Good, because recruits bleed and kobolds bite, and if you keep my people on their feet you're worth three swords to me." },
        { id = "h_veteran", when = { minLevel = 20, metBefore = true },
          text = "Look at you. Most of the ones I send down that road never come back up it, and the ones who do don't look like this." },
        { id = "h_novice", when = { origin = "human_abbey_novice", maxLevel = 10 },
          text = "I know you; you were carrying the brothers' candles through these halls last spring. Now you'll be taking the kobolds' candles off them instead, which is the same job with more teeth." },
        { id = "h_warm", when = { disposition = { min = 72 } },
          text = "There's a face I'm glad to see. You're the sort of recruit I'd hand the valley to for an afternoon, and I don't say that lightly." },
        { id = "h_cold", when = { disposition = { max = 34 } }, narr = "He keeps his eyes on the map and doesn't put down the charcoal.",
          text = "You. State your business and keep it short, recruit, because I've not forgotten the last time." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, here in Northshire! I've kobolds in the vineyard and wolves in the hills, so I'll gladly take whatever help you're offering." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and fresh from the Library Wing, I'd guess. Khelden Bremen's told me about you; he says you read faster than you listen." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, I'll put you where the line's thinnest, and in Northshire that's everywhere." },
      },
      again = {
        { id = "h_again", text = "What else do you need, recruit? Be quick about it." },
        { id = "h_again2", text = "Go on, then. The maps aren't going anywhere, and neither, sadly, are the kobolds." },
        { id = "h_again3", when = { minLevel = 20 }, text = "Something else? You've earned a few more minutes than most." },
        { id = "h_tone_blunt", when = { chance = 0.5, tone = "blunt" }, text = "Straight to it, recruit. Good, because I've no time for speeches and neither have the kobolds." },
        { id = "h_tone_plain", when = { chance = 0.5, tone = "blunt", metBefore = true }, text = "You talk like a soldier, recruit, plain and to the point. That's the first thing I teach them, and the last thing most of them learn." },
        { id = "h_tone_polite", when = { chance = 0.5, tone = "polite" }, text = "You can save the bowing for the brothers, recruit. Tell me what you need and I'll tell you what I can spare." },
      },
      choices = {
        { text = { normal = "I found Rolf's men by the lake, Marshal. I'm sorry.",
                 polite = "I found Rolf's men by the lake, Marshal. I'm truly sorry, sir.",
                 blunt = "Rolf's men are dead by the lake. I'm sorry." }, next = "dd_rolf", when = { questDone = TODO_QUEST("Discover Rolf's Fate") } },

        { text = { normal = "You seem to hunt the wolves for sport, Marshal.",
                 polite = "If I may say, Marshal, you seem to hunt the wolves for sport.",
                 blunt = "You hunt the wolves for sport." }, next = "druid_q", when = { class = "DRUID" } },
        { text = { normal = "Reporting for duty, Marshal.",
                 polite = "Reporting for duty, Marshal, at your service.",
                 blunt = "Reporting for duty." }, next = "orders",
          fx = { align = { order = 2 }, trait = { stern = 1 }, affinity = 1 },
          journal = { first = "Reported to Marshal McBride. He looked at me like a man counting how many of us come back.",
                      third = "{name} reported to Marshal McBride at Northshire Abbey." } },
        { text = { normal = "I'm here for the pay, Marshal, not the banner.",
                 polite = "With respect, Marshal, I'm here for the pay, not the banner.",
                 blunt = "I'm here for the pay, not the banner." }, next = "orders", fx = { align = { order = -2 } } },
        { text = { normal = "Soldiers for kobolds. That seems a bit much.",
                 polite = "Forgive me, Marshal, but soldiers for kobolds seems a bit much.",
                 blunt = "Soldiers for kobolds is overkill." }, next = "kobolds", fx = { trait = { witty = 1 }, affinity = -1 } },
        { text = { normal = "I've run vermin off a farm before. These can't be worse.",
                 polite = "I've run vermin off a farm before, sir, so these can't be much worse.",
                 blunt = "I've run vermin off farms. These can't be worse." }, next = "farmhand",
          when = { origin = "human_westfall_farmhand" }, fx = { affinity = 1 } },
        { text = { normal = "What do you make of the Defias in the valley?",
                 polite = "If I may ask, Marshal, what do you make of the Defias here?",
                 blunt = "What about the Defias in the valley?" }, next = "defias" },
        { text = { normal = "Where do recruits go after Northshire?",
                 polite = "Would you tell me where recruits go after Northshire, Marshal?",
                 blunt = "Where do I go after Northshire?" }, next = "goldshire" },
        { text = { normal = "The brothers want me in the infirmary, Marshal.",
                 polite = "The brothers have asked for me in the infirmary, Marshal, if you'll allow it.",
                 blunt = "The brothers want me in the infirmary." }, next = "priest", when = { class = "PRIEST", maxLevel = 15 } },
        { text = { normal = "Why take volunteers who aren't from Stormwind?",
                 polite = "If I may ask, sir, why take volunteers who aren't from Stormwind?",
                 blunt = "Why take outsiders like me?" }, next = "allies", when = { race = { "Dwarf", "Gnome", "NightElf", "Skyborne" } } },
        { text = { normal = "I've seen a garrison spread too thin before. Up north.",
                 polite = "I've seen a garrison spread too thin before, sir, up north in Lordaeron.",
                 blunt = "I've seen garrisons stretched this thin up north." }, next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = { normal = "You sent me down that road once, Marshal.",
                 polite = "You sent me down that road once, Marshal, and I thank you for it.",
                 blunt = "You sent me down that road once." }, next = "veteran", when = { minLevel = 20, metBefore = true } },
        { text = { normal = "Your letter smelled of brimstone, Marshal.",
                 polite = "Forgive me, Marshal, but your letter smelled of brimstone.",
                 blunt = "Your letter stank of brimstone." }, next = "warlock", when = { class = "WARLOCK", maxLevel = 15 } },
        { text = { normal = "Your letter was in cipher, Marshal.",
                 polite = "Your letter was in cipher, Marshal, if you'll pardon my mentioning it.",
                 blunt = "Your letter was in cipher." }, next = "rogue", when = { class = "ROGUE", maxLevel = 15 } },
        { text = { normal = "I've brought my own beast, Marshal.",
                 polite = "I've brought my own beast, Marshal, if that suits you.",
                 blunt = "I brought my own beast." }, next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = { normal = "The spirits of the stone brought me here, Marshal.",
                 polite = "With respect, Marshal, the spirits of the stone brought me here.",
                 blunt = "The stone spirits sent me here." }, next = "shaman", when = { class = "SHAMAN" } },
        { text = { normal = "What do you need from a mage, Marshal?",
                 polite = "How may a mage be of use to you, Marshal?",
                 blunt = "What do you need from a mage?" }, next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = { normal = "Where is the line thinnest in Northshire, Marshal?",
                 polite = "Would you tell me where the line is thinnest, Marshal?",
                 blunt = "Where's the line thinnest?" }, next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = { normal = "You must lose a good many recruits, Marshal.",
                 polite = "Forgive me, Marshal, but you must lose a good many recruits.",
                 blunt = "You lose a lot of recruits." }, next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = { normal = "Where does a paladin serve best, Marshal?",
                 polite = "Where would a paladin serve you best, Marshal?",
                 blunt = "Where do you want a paladin?" }, next = "xapala", when = { class = "PALADIN" } },
        { text = { normal = "The monks of Northshire seem to welcome travellers like us.",
                 polite = "The monks of Northshire have been very kind to travellers like us, sir.",
                 blunt = "The Northshire monks welcome travellers like us." }, next = "xpt_mcbride", when = { party = true } },
        { text = "Why does Stormwind start its recruits in Northshire, Marshal?", next = "hu_valley", when = { race = "Human" } },
        { text = "You expect more of humans than the others, Marshal.", next = "hu_expect", when = { race = "Human" } },
        { text = "What are humans like, Marshal, from the inside?", next = "hu_what", when = { race = { "Dwarf", "Gnome", "NightElf" } } },
        { text = { normal = "That's all, Marshal.",
                 polite = "That's all, Marshal. Thank you for your time.",
                 blunt = "That's all." }, next = "END" },
      },
    },

    kobolds = {
      lines = {
        { id = "k_default", text = "Laugh if you like, but they've moved into Echo Ridge Mine and they come out bolder every week. I'd rather do my laughing after." },
      },
      choices = {
        { text = "What are they doing in the mine?", next = "kobolds_mine" },
        { text = "Then point me at the mine.", next = "orders", fx = { affinity = 1 } },
        { text = "I'll see for myself.", next = "END" },
      },
    },
    kobolds_mine = {
      lines = {
        { id = "km_default", text = "Digging, deeper every week, and the deeper they dig the harder they are to root out. One at a time they're thieves and cowards, but in numbers they're a threat to this whole valley.",
          fx = { learn = { "echo_ridge", "kobolds" } } },
      },
      choices = {
        { text = "It sounds like work that's never finished.", next = "kobolds_never" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kobolds_never = {
      lines = {
        { id = "kn_default", text = "It isn't, because nothing in this valley is ever finished. You clear the mine, next month there may be more, and then I find someone else to send." },
        { id = "kn_done", when = { questDone = TODO_QUEST("Skirmish at Echo Ridge") },
          text = "You cleared more of it than anyone. There may still be some down there, and I'll send others after them; that's not a failure, recruit, it's what a garrison is for." },
      },
      choices = {
        { text = "Then I'll keep coming back.", next = "BACK", narr = "He gives you one short nod and goes back to marking the mine on his map.", reply = "Good, because I'll need you. The kingdom's soldiers are spread thin, and I'll take every pair of hands that keeps coming.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "That sounds exhausting.", next = "BACK", reply = "It is, and I've been doing it for years. Don't complain to me about tired legs, recruit.", fx = { align = { order = -1 }, trait = { witty = 1 } } },
      },
    },

    orders = {
      lines = {
        { id = "o_default", text = "Good, because I've more work than hands. Let's see what fits you." },
        { id = "o_kobolds", when = { questBefore = TODO_QUEST("Kobold Camp Cleanup") },
          text = "There's a kobold camp in the woods to the north. Thin it out, then report back to me, not to the brothers." },
        { id = "o_done_here", when = { questDone = TODO_QUEST("Skirmish at Echo Ridge") },
          text = "There's nothing left here that needs you, so go south; Marshal Dughan in Goldshire can use a recruit who finishes things." },
      },
      choices = {
        { text = "Show me the work.", next = "BUSINESS" },
        { text = "What's the garrison short of?", next = "garrison" },
        { text = "Understood.", next = "END" },
      },
    },
    garrison = {
      lines = {
        { id = "ga_default", text = "Soldiers, because half the guard is fighting in other lands, so we take anyone willing to defend their home. We're getting a lot of you these days, and I hope it's enough." },
      },
      choices = {
        { text = "Surely Stormwind could send more.", next = "garrison_more" },
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
        { text = "Understood, Marshal.", next = "BACK", reply = "Good. Off you go, then.", fx = { align = { order = 1 } } },
        { text = "Someone in the city should hear about this.", next = "BACK", reply = "They should, and you're welcome to be the one who tells them. Mind you go through the proper channels, recruit.", fx = { trait = { stern = 1 }, align = { order = -1 } } },
        { text = "You've already asked the Keep, haven't you, Marshal?", tag = "Persuade", next = "garrison_letters",
          check = { pass = { any = { { disposition = { min = 65 } }, { origin = "human_abbey_novice" }, { questDone = TODO_QUEST("Skirmish at Echo Ridge") } } } },
          fail = { next = "garrison_drop", fx = { affinity = -1 } } },
      },
    },

    defias = {
      big = true,
      narr = "He taps two fingers on the vineyard at the edge of his map, where someone has inked a row of small crosses.",
      lines = {
        { id = "d_default", key = true,
          text = "The Defias are in the valley and they're organized, and some of them were honest men once. But a thief with a cause is still a thief.",
          fx = { hear = "defias_trained", learn = { "defias" } } },
        { id = "d_kind", when = { alignment = { axis = "light", min = 30 } },
          text = "You'll want to tell me the Defias are desperate men, and some are, but desperate men still put knives in my recruits.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Then give them a chance to surrender first.", next = "BACK",
          fx = { align = { light = 3 }, trait = { kind = 1 }, opinion = { defias = "mercy" } },
          journal = { first = "Told McBride the Defias should get a chance to surrender. He didn't argue, but he didn't agree either.",
                      third = "{name} told McBride the Defias deserved a chance to surrender." } },
        { text = "A thief's a thief. I'll treat them like one.", next = "BACK",
          fx = { align = { order = 3 }, trait = { stern = 1 }, opinion = { defias = "hardline" }, affinity = 1 },
          journal = { first = "McBride asked about the Defias, and I told him a thief's a thief. He nodded as if I'd passed some test.",
                      third = "{name} told McBride the Defias should be treated as thieves, nothing more." } },
        { text = "Who's organizing them? That's who I'd want.", next = "defias_leaders",
          fx = { align = { honor = -2 }, trait = { curious = 1 }, opinion = { defias = "follow_the_leaders" } },
          journal = { first = "Asked McBride who's behind the Defias. He didn't know, and he didn't like not knowing.",
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
        { text = "Like a desperate man.", next = "BACK", reply = "Desperate men break, recruit, and these don't. Somebody's training them, and I'd like to know who.", fx = { align = { light = 1 } } },
        { text = "Like a cutthroat, and he'll die like one.", next = "BACK", reply = "I'd not argue, but I'd sooner know who taught him to fight like that. Keep your eyes open in the vineyard.", fx = { align = { light = -1 } } },
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
        { id = "dt_default", text = "Tell him what you've seen yourself. He'll believe that sooner than he'll believe me, because we've known each other too long to listen to each other." },
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
          text = "Ironforge stood with us in the Second War, so I'll not turn a dwarf away from a kobold, and you lot are better in tunnels than we are anyway." },
        { id = "al_skyborne", when = { race = "Skyborne" },
          text = "The Kirin Tor vouched for your people, and the army took them at their word. The kobolds won't care where you're from, and neither will I." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },

    lordaeron = {
      big = true,
      narr = "His eyes go past you to the hills north of the Abbey wall and stay there for a breath.",
      lines = {
        { id = "lo_default", text = "Lordaeron, yes. Then you know why I don't laugh at kobolds, or bandits, or anything else that grows while nobody's watching it." },
      },
      choices = {
        { text = "That's why I'm here.", next = "BACK", reply = "Then you're welcome here, and you'll understand my orders better than most. Watch the small things, recruit.", fx = { affinity = 3, align = { order = 1 } } },
        { text = "I came south to look after myself, not to stand watch.", next = "BACK", reply = "Then you'd best look after yourself somewhere else. I've no use for a soldier who won't stand watch.", fx = { align = { order = -1 } } },
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
        { text = "Visiting the Abbey, and you, Marshal.", next = "veteran_visit", fx = { affinity = 2 } },
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
        { text = "Then I'll go where the fight matters most.", next = "BACK", reply = "That's what I hoped you'd say. Stormwind needs that more than my woods do.", fx = { align = { order = 1 } } },
        { text = "I'll go where I please, Marshal.", next = "BACK", reply = "You will, I expect, but I hope your feet take you somewhere useful. Go with the Light, recruit.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    garrison_letters = {
      big = true,
      lines = {
        { id = "gl_default", narr = "He turns his shoulder to the brothers sweeping the courtyard and lowers his voice.", text = "Twice, in my own hand, with the kobold counts attached. The first came back from the Highlord's clerk saying he'd consider it, and the second came back from Lady Prestor's office saying the valley must make do with what it has." },
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
      narr = "He folds his arms across his tabard and doesn't step any closer.",
      lines = { { id = "warlock_l", text = "It did, and I wrote it anyway, because the kingdom asked me to send every recruit to their teacher, and Drusilla La Salle is yours. I don't have to like it, recruit, and I don't." } },
      choices = {
        { text = "You'll be glad of me when the Defias come.", next = "BACK", reply = "Maybe I will, recruit, and I'll be the first to say so if it happens. Until then, mind how you go in my valley.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "I don't need your approval, Marshal.", next = "BACK", reply = "You don't, and I'll not offer it. Do your work and stay out of the Abbey after dark.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Why does the kingdom allow us at all?", next = "warlock2" },
      },
    },
    warlock2 = {
      lines = { { id = "warlock2_l", text = "Because the orcs had warlocks, and we lost the First War. That's all the answer I've ever been given, and it's enough to keep me writing the letters." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "rogue_l", text = "It was. Jorik Kerridan insists, and I've stopped arguing; a recruit who can't read a cipher can't find his teacher, and that's apparently the first lesson." } },
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
        { text = "It only hunts what I point it at.", next = "BACK", reply = "Then point it at the kobolds and not the chickens. I'll be watching.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No promises about the chickens.", next = "BACK", reply = "Then it'll answer to Brother Danil, and you'll answer to me. Off you go.", fx = { trait = { witty = 1 }, align = { order = -1 } } },
      },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "The stone, is it? Ironforge's letter said to expect you and said nothing about what you'd be, so I'll judge you on kobolds like everyone else. Is that fair?" } },
      choices = {
        { text = "More than fair, Marshal.", next = "BACK", fx = { affinity = 2 } },
        { text = "The spirits judge differently.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Hm. I don't hear much of that in this valley, recruit, and I'll not say it's unwelcome. Now put the same effort into the kobolds and we'll get on." },
        { id = "s2", text = "That's well said, and I'll take it for the garrison, since they hold Northshire and I only count them. You've a decent head on you, recruit." },
      },
      fail = {
        { id = "f1", text = "I've a valley to hold, recruit, and no time to be told how well I'm holding it. Save your breath for the climb to Echo Ridge." },
        { id = "f2", text = "A recruit who polishes the marshal instead of a sword is no use to the Stormwind Army. Speak plainly or go back to your drills." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You've more spine than the last dozen they sent me, and they'd not have dared say that to my face. Keep it, recruit, because the kobolds won't be half so forgiving." },
        { id = "s2", text = "That's bold talk for somebody still wearing the Abbey's dust on their boots. I like it, though, and a soldier who'll stand up to me will stand up to a Defias." },
      },
      fail = {
        { id = "f1", text = "You'll watch your tongue on my ground, recruit. I've buried soldiers who'd earned the right to joke with me, and you've not yet earned a clean mail shirt." },
        { id = "f2", text = "I've heard better from drunken footmen and thought less of them for it. If you've breath for mockery, you've breath for another patrol of the vineyards." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Stand easy, recruit, I take your meaning. You've more steel in you than I'd reckoned, and I'll not waste it by quarrelling, so have your say." },
        { id = "s2", text = "Well, now. I've stared down plenty of raw recruits, and it's not often that one stares back hard enough for me to feel it. Very well, I'll give you that one." },
      },
      fail = {
        { id = "f1", text = "I've held this valley against worse than a recruit with a scowl. Stand down, before I have you scrubbing the Abbey's steps until the brothers can pray in the shine." },
        { id = "f2", text = "You'd threaten a marshal of Stormwind in front of his own garrison? That's a short road to the Stockade, recruit, and I'd turn round on it now." },
      },
    },
  },
  confides = {
    { id = "cnf_1", text = "The Defias in the vineyards change their watch at sunset, and for a few minutes the shack by the vines is held by Padfoot alone. That's when I'd go, if I had anyone to send." },
    { id = "cnf_2", text = "Brother Neals in the Abbey's bell tower can see the whole valley from his window, and he keeps a notebook of everything that moves. He'll show it to you if you ask him about the bells first." },
    { id = "cnf_3", text = "There's an old shaft at the back of Echo Ridge that the miners sealed before the kobolds came. Somebody's opened it, and it wasn't the kobolds, because the timbers were cut clean." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you're a good recruit, and I've had a great many of the other kind. You listen, you come back, and you report, which is the whole of the job." },
      { id = "rg_2", text = "I think you'll do, recruit, which is high praise from me. Ask Deputy Willem; he's been waiting three years to hear me say it." },
      { id = "rg_earned", when = { fondness = { best = "earned" } }, text = "You've done more for this valley than the last two drafts from Stormwind put together. I don't say that to flatter you; I say it because it's in my reports." },
      { id = "rg_order", when = { alignment = { axis = "order", min = 30 } }, text = "You follow orders without needing them shouted, and you think about them first. That's the best kind of soldier there is." },
      { id = "rg_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "You've your own way of doing things, recruit, and I'd not have it in my ranks. But you've not lost a fight in this valley yet, so I'll keep my mouth shut." },
    },
    confide = {
      { id = "cf_1", text = "I've asked Stormwind for more soldiers twice this season and been turned down twice. The recruits don't know, and I'd rather they didn't." },
      { id = "cf_2", text = "The brothers in the Abbey think I'm hard on them because I don't believe in prayer. I do; I just believe in a locked gate more." },
      { id = "cf_3", text = "Every recruit I've lost in this valley, I've written to their family myself. There are eleven letters this year, and I remember every name." },
    },
    trust = {
      { id = "tr_1", text = "Trust Deputy Willem; he's been with me since the Second War and he's never once given me a bad report. And trust Marshal Dughan in Goldshire, even if he thinks I'm jumpy." },
      { id = "tr_2", text = "Trust the Brotherhood at the Abbey with your wounds and your soul, recruit, but not with your tactics. They're good men who've never had to hold a door." },
      { id = "tr_3", text = "Trust anyone who's been in Echo Ridge Mine and come back sober. Folk who haven't seen the kobolds' work don't know what they're talking about." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the kobolds' candles, recruit; where the lights go out, there's a nest. Don't follow them into the dark." },
      { id = "wo_2", text = "Watch the vineyards to the east and anyone in a red bandana. The Defias aren't just thieves, and they're closer to the Abbey than I like." },
      { id = "wo_low", when = { maxLevel = 10 }, text = "Watch the wolves along the treeline, recruit. They look like nothing, and they've put more recruits on the brothers' tables than the kobolds have." },
    },
    worries = {
      { id = "wy_1", text = "I worry the kobolds are digging for something they shouldn't find. Kobolds want candles and copper, and these ones are digging past both." },
      { id = "wy_2", text = "I worry that I'll be the marshal who lost Northshire Abbey, recruit. It's stood since before the First War, and I'd hate to be the one it fell under." },
      { id = "wy_3", text = "I worry about the recruits I send out and the ones I can't. Too few soldiers means every one I send goes alone, and alone is how they die." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to see a full garrison here before I retire, recruit, every post manned and every patrol doubled. I'd sleep a whole night, for once." },
      { id = "hp_2", text = "I hope some of the recruits I've trained go on to command, and remember to count before they charge. That's all I'd want for a legacy." },
      { id = "hp_3", text = "I'd like to walk the valley one day without a sword on my hip. Just walk it, recruit, the way the brothers do, and see the river for what it is." },
    },
    favor = {
      { id = "fv_1", text = "Come back now and then, recruit, and train the new ones a little. They'll listen to a veteran who's not their marshal more than they'll listen to me." },
      { id = "fv_2", text = "If you're in Stormwind and anybody in the Keep asks how Northshire's holding, tell them the truth. I've run out of ways to say it politely." },
    },
    friendship = {
      { id = "fr_1", text = "I do, recruit, though I'll still call you recruit, because I call everyone that. With you, it's meant kindly." },
      { id = "fr_2", text = "Aye, a friend, and I've few enough. Most of mine are on the Army's rolls, and too many of them on its memorial stones." },
      { id = "fr_order", when = { alignment = { axis = "order", min = 40 } }, text = "A friend, and a soldier I'd trust with my flank. In my trade, there's no closer word than that." },
    },
    never_told = {
      { id = "nt_1", text = "I was offered a post in the Stormwind garrison, behind good walls, with a proper pension. I turned it down, because I didn't trust anyone else to hold this valley, and that's pride, recruit, not duty." },
      { id = "nt_2", text = "I lost my first command in the Second War because I charged before I counted. That's why I tell every recruit to count first, and I've never told one of them why." },
    },
    _gated = {
      { id = "gt1", text = "That's not for a recruit I've barely had time to judge. Do some work for the valley first, and then ask me." },
      { id = "gt2", text = "I'll not discuss that with you yet, recruit. I talk freely to soldiers I trust, and you've still that to earn." },
    },
    knows = {
      { id = "tp_knows", text = "I keep a map of this valley in my head and a pile of reports on my desk. Ask me about any of this, recruit, and I'll give it to you straight." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer on these, and quickly, because I've a valley to hold." },
    },
    background = { { id = "tp_bg", text = "A marshal of the Stormwind Army with a valley to hold and not enough soldiers to hold it. That's the whole story, recruit.", next = "garrison" } },
    advice = { { id = "tp_ad", text = "Count before you charge: scouts first, steel second. Most of the recruits I've had to bury got that the wrong way round." } },
    kobolds = { { id = "t_kobolds", text = "Kobolds are vermin with candles and shovels, so don't underestimate the shovels." } },
    echo_ridge = { { id = "t_echo", text = "Echo Ridge is an old mine north of here, and the kobolds took it and dig deeper every week." } },
    defias = { { id = "t_defias", text = "The Defias are organized, and closer to the Abbey than I like. Ask Deputy Willem, since he's been counting their bandanas.", fx = { hear = "defias_trained" } } },
    hogger = { { id = "t_hogger", text = "Hogger's a gnoll in Marshal Dughan's woods, and thank the Light he's Dughan's problem. Don't go near him at your size." } },
    northshire_abbey = { { id = "tp_abbey", text = "The brothers pray and I post sentries, and between the two of us the Abbey stays standing." } },
    _none = { { id = "t_none", text = "That's not a garrison matter. Ask the brothers; they read." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood of Northshire keeps this Abbey and its library, and I keep the Brotherhood. It's a fair division, recruit, and they pray for my soldiers, which I need more than I'll admit." } },
    varian = { { id = "tp_varian", text = "The king is missing and the army's orders come from the Highlord now. A soldier's duty doesn't change because the man at the top does, so I'll hear no more of it on my ground." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Fordragon is a paladin and a soldier both, and he signs my requests for men even when he can't fill them. I'd follow him into worse than Echo Ridge." } },
    scourge = { { id = "tp_scourge", text = "Northshire was founded by clerics from Lordaeron, and the brothers still pray for that land every evening. Most of what they pray for is gone, recruit, and they know it." } },
    second_war = { { id = "tp_second_war", text = "The Abbey was a ruin in the Second War, and the Twilight's Hammer made a nest of it. We built it back stone by stone, and I'll not see it lost again, to kobolds or anyone else.", fx = { learn = { "twilights_hammer" } } } },
    holy_light = {
      { id = "tp_holy_light", text = "I'm no priest, but I've seen the brothers mend men I'd given up for dead. The Light doesn't need my belief, recruit, but it has my respect." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "A paladin, good. The Light needs more who'll carry it to the front instead of keeping it lit at home, and Brother Sammuel will see you right." },
    },
    silver_hand = { { id = "tp_silver_hand", text = "The Silver Hand was blessed in this kingdom's own faith, and some of its first knights learned their prayers right here under the Archbishop. They're scattered since Lordaeron fell, and we're all still paying for that loss." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "The stone ring on Stone Cairn Lake honors the dead of the First War, and rogue mages squat on it now. Marshal Dughan wants it cleared, and when you're ready, recruit, so will I." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Defias we catch in this valley go to the Stockade, and the warden sends word back that the cells are full. That's a problem for the city; my problem is the next one." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire draws every recruit in the valley down to Goldshire the week it's there. I'll allow it, so long as they're back on watch at dawn." } },
    grievance = {
      { id = "gv_1", text = "I've a valley to hold and too few to hold it, recruit, and you've not helped. That's the long and short of it." },
      { id = "gv_val", when = { grudge = "values" }, text = "You don't follow orders, and in Northshire that gets people killed. I've written enough letters home to know it." },
      { id = "gv_wr", when = { grudge = { worst = "wronged" } }, text = "You spoke to me like I was one of your recruits. I'm the Marshal here, and I'll be spoken to like one." },
    },
    amends = {
      { id = "am_1", text = "Do the work on the board, come back alive, and don't argue with me about it. That's all I ask of anyone." },
      { id = "am_val", when = { grudge = "values" }, text = "Follow an order to the letter, once, without complaint. I'll notice." },
    },
    spite = {
      { id = "sp_1", text = "I think you're the sort of recruit who gets the others killed, and I'm glad to see you leave the valley." },
      { id = "sp_val", when = { grudge = { worst = "values" } }, text = "I think you'd sell out the abbey for a handful of silver, the same as the thieves in the vineyard." },
    },
  },
  blurts = {
    { id = "bl_1", text = "The Defias in the vineyards answer to a man called Garrick Padfoot, and he keeps to their shack by the vines. Cut him down and the rest will scatter." },
    { id = "bl_2", text = "The kobolds in Echo Ridge Mine are digging for something deeper than candles, and I don't know what. I've not the men to go and look." },
  },
}
