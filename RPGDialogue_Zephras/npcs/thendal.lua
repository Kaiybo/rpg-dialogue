-- Thendal Village, Zephras Isle: the Skyborne starting village in Thendal Grove.
-- Rorian the Dayseeker, Aetheen of the Gales, and two Rangers of Thendal Grove.
-- Voice and sources: bibles/zephras.md (facts from warcraft.wiki.gg, Zephras Isle storyline).
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST


---------------------------------------------------------------------------
-- Rorian the Dayseeker: village leader at the greatfather tree. Gives the
-- coming-of-age relic, sends the young to their trainers, scolds Myriaal's game.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_rorian", id = TODO_NPC("Rorian the Dayseeker"), name = "Rorian the Dayseeker",
  bible = "bibles/zephras.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "steady", "proud" }, values = { "dutiful", "patient" },
  notices = { "kin", "stranger", "class" },

  impression = {
    first = "Rorian the Dayseeker leads Thendal Village from the foot of its great tree, and he treats every young Skyborne as a charge he'll have to answer for. He is solemn about the old gifts and very short with anyone who plays with them.",
    third = "{name} met Rorian the Dayseeker, the solemn leader of Thendal Village who hands the young their coming-of-age relics.",
  },

  greetings = {
    { id = "g_child", when = { race = "Skyborne" }, text = "Speak, child of Zephras, and tell me what you need. The grove is never quiet for long." },
    { id = "g_guest", when = { ["not"] = { race = "Skyborne" } }, text = "A guest in Thendal Grove. Gale's greetings to you, and mind the edges of the paths." },
    { id = "g_again", when = { metBefore = true }, text = "Back again. Good; I'd rather see you twice than hear of you once from a ranger." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I'm glad to see you rather than hear of you from a ranger, though you'll want to mind the paths, because some edges have crumbled since you left." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much stronger since I last saw you, and I'm glad of it, though I'll ask you to remember that strength is held in trust, the same as any relic." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "A ranger tells me you were caught in a lie in the grove, and I'll not pretend I didn't hear it, because the young watch what their guests do, so mind what you teach them." },
  },

  notice = {
    { id = "n_young", cat = "kin", when = { race = "Skyborne", maxLevel = 3 },
      text = "You've only just been given your relic, and already you're out among the vuldren. Carry it carefully, child; it has outlived better hurries than yours." },
    { id = "n_druidform", cat = "class", when = { form = { "cat", "bear", "travel" } },
      text = "Xyton's teaching shows on you, I see. Take your own shape when you speak to me, if you would; I like to see who I'm scolding." },
    { id = "n_stranger", cat = "stranger", when = { ["not"] = { race = "Skyborne" } },
      text = "You came up on the skycutter, I take it. We've had more strangers in a season than this grove saw in a thousand years." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Rorian, and Thendal Village is in my keeping, which mostly means the young are. Our people have come through a great deal of hardship, and I mean to see this generation come through it as well." },
        { id = "h_coming", tags = { "news" }, when = { questActive = TODO_QUEST("Coming of Age") },
          text = "So you've come for your relic. Stand straight, child; this happens only once in a life, and I'd like you to remember it kindly." },
        { id = "h_unrest", tags = { "news" }, when = { questDone = TODO_QUEST("Return to Rorian") },
          text = "You brought word of the Al'Aketh at the standing stones, and I've not slept well since. We knew they were moving, but stirring up the sprites in our own grove is a step further than I thought they'd dare." },
        { id = "h_fell", tags = { "news" }, when = { questRecent = { TODO_QUEST("Falling With Style"), days = 2 } },
          text = "You landed at my feet like a dropped sack of gustberries, and I know exactly who put you up to it. Myriaal will hear from me again, for all the good it does." },
        { id = "h_warrior", when = { race = "Skyborne", class = "WARRIOR" }, text = "Blademaster Ren asked after you. She's inside the watchtower, and she does not like to be kept waiting." },
        { id = "h_hunter", when = { race = "Skyborne", class = "HUNTER" }, text = "Tai'ree Farsight has been watching you with that look she gets, near the village center. I'd go to her before she comes to fetch you." },
        { id = "h_rogue", when = { race = "Skyborne", class = "ROGUE" }, text = "Akeri Duskblade wants a word with you in the watchtower. He's a shady fellow, but I suspect you'll understand each other." },
        { id = "h_mage", when = { race = "Skyborne", class = "MAGE" }, text = "Dorii Brightwhisper of the High Order has had her eye on you, child. She keeps to the ground floor of the great tree, among her books." },
        { id = "h_shaman", when = { race = "Skyborne", class = "SHAMAN" }, text = "Windshaper Boro is waiting near the village center. He'll tell you the spirits have gone quiet, and then he'll ask you to listen anyway." },
        { id = "h_druid", when = { race = "Skyborne", class = "DRUID" }, text = "Xyton Silverwind is on the ground floor of the great tree, and there are few enough druids among us that he'll be glad of you." },
        { id = "h_apriest", when = { class = "PRIEST", ["not"] = { race = "Skyborne" } }, text = "A priest. Forgive me if I'm slow to warm to the robe; the only priests this isle has known are the Al'Aketh's, and they've made the word an ugly one." },
        { id = "h_pala", when = { class = "PALADIN" }, text = "You wear your faith like armor, guest. We've nothing like you on Zephras, and I'll admit I'm curious what holds it up." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "There's a smell of the Nether about you, guest. Our ancestors fled a prince who meddled with such things, and the grove remembers it even if you don't." },
        { id = "h_oshaman", when = { class = "SHAMAN", ["not"] = { race = "Skyborne" } }, text = "A shaman from below the clouds! Boro will want to talk your ears off, because the spirits stopped speaking to us years ago and you may still hear them." },
        { id = "h_rangerorigin", when = { origin = "skyborne_thendal_ranger" }, text = "You walked the paths round this village longer than most of the rangers, child, and you brought back more lost young than any of them. The forests below will be bigger than ours, I'm told, but a path is a path, and you never once lost yours." },
      },
      again = {
        { id = "h_again", text = "What else, child? The day doesn't wait, and nor do the vuldren." },
        { id = "h_again2", text = "Go on, ask it. I'd rather answer a question now than a ranger's report later." },
      },
      choices = {
        { text = "Tell me about the relic you give the young.", next = "relic" },
        { text = "The beasts of the grove seem very restless.", next = "vuldren" },
        { text = "What do you know of the Al'Aketh?", next = "cult" },
        { text = "Myriaal says jumping off the watchtower is good practice.", next = "gifts" },
        { text = "Who should I train with?", next = "trainers", when = { race = "Skyborne" } },
        { text = "What is this village, and who are your people?", next = "village", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Something about my craft troubles you, I can tell.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why do the Al'Aketh make you wary of priests?", next = "xpriest", when = { class = "PRIEST", ["not"] = { race = "Skyborne" } } },
        { text = "The Light holds me up. Shall I tell you of it?", next = "xpala", when = { class = "PALADIN" } },
        { text = "Winds be with you, Rorian.", next = "END" },
      },
    },
    relic = {
      lines = {
        { id = "re_default", text = "Every young shen'dorei who comes of age is given a relic that others carried before them. When our time comes, our ashes go to the winds and the relic goes on to the next of us, so nobody owns one; we only hold it for a while." },
      },
      choices = {
        { text = "Who carried mine before me?", next = "relic_who" },
        { text = "What happens if a relic is lost?", next = "relic_lost" },
        { text = "Something else, Rorian.", next = "BACK" },
      },
    },
    relic_who = {
      lines = {
        { id = "rw_default", text = "That's not mine to tell, child, and I'll not pretend to remember every name. What I'll say is that whoever it was came of age much as you did, frightened and eager at once, and the winds of home went with them as they go with you." },
      },
      choices = {
        { text = "Then I'll carry it well.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "It's only a trinket to me.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    relic_lost = {
      lines = {
        { id = "rl_default", text = "They come back, mostly, because we go and fetch them. When one of us falls, the relic is recovered and returned to the High Elder's keeping, and then it's given to another child, so a lost one is a hole in the line that somebody has to mend." },
      },
      choices = {
        { text = "Even from those who fell far from home?", next = "relic_far" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relic_far = {
      big = true,
      lines = {
        { id = "rf_default", text = "Especially from them. There are relics lying in the ruins of Ban'aethal right now, I'd wager, and in places the Al'Aketh hold, and every one of them is a story that stopped in the middle." },
      },
      choices = {
        { text = "Then I'll bring back any I find, whatever the danger.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The dead don't need them. The living should keep what they find.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vuldren = {
      lines = {
        { id = "v_default", text = "The vuldren are gentle creatures by nature, but they've bred past what the grove can bear, and some have to be culled. Worse, the beasts of Zephras can feel it when the magic on the wind falls out of balance, and lately it's been very far out of balance." },
      },
      choices = {
        { text = "Why is the magic out of balance?", next = "vuldren_why" },
        { text = "Culling them seems cruel.", next = "vuldren_cull" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vuldren_why = {
      lines = {
        { id = "vw_default", text = "Because the wind spirits who lived beside us are gone, and the pylons they left us are failing a little more each year. My apprentice Yala Windwatcher has been out at the standing stones, and she says the lesser sprites there are agitated, which they never used to be." },
      },
      choices = {
        { text = "Agitated by what?", next = "sprites" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sprites = {
      lines = {
        { id = "sp_default", text = "The little sprites aren't thinking beings the way the true spirits were, child; they answer whatever moves near them, fear or anger or calm. If someone stands among the stones nursing hatred, the winds there learn to hate as well, and I've a fair notion who's been standing there." },
      },
      choices = {
        { text = "You mean the Al'Aketh.", next = "cult", fx = { learn = { "al_aketh" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vuldren_cull = {
      big = true,
      lines = {
        { id = "vc_default", text = "It is unpleasant, and I won't tell you otherwise. But a guiding hand now spares the whole grove later, and that's a lesson every one of you must learn before you go beyond Thendal." },
      },
      choices = {
        { text = "Balance matters more than any one beast. I understand.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The grove should find its own balance without us.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = {
        { id = "c_default", text = "Zealots in grey robes with their heads shaved, who pray to Al'Akir and call him the Windlord. We'd watched them from afar for a long while and thought watching was enough, until they came into our own grove to set the winds against us." },
        { id = "c_after", when = { questDone = TODO_QUEST("Return to Rorian") },
          text = "You saw them yourself at the standing stones, so I needn't describe them. We'd been content to watch them from a distance, and they took our patience for weakness." },
      },
      choices = {
        { text = "Why didn't you act sooner?", next = "cult_wait" },
        { text = "A cult like that must have a leader.", next = "cult_lead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_wait = {
      big = true,
      lines = {
        { id = "cw_default", text = "Because they are shen'dorei, child, the same as you and I, and many of them only joined because they were frightened. It's a hard thing to draw a blade on your own cousins, and I'd hoped the fear would pass before the blades were needed." },
      },
      choices = {
        { text = "They're still our people. Turn them back where you can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose the grey robes. Cut them down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_lead = {
      lines = {
        { id = "cl_default", text = "A woman named Lorthuna, who calls herself High Priestess and keeps her seat at the Shrine of Akir. Her thugs have been working the road south of the grove, so if you go that way, go with your eyes open." },
      },
      choices = {
        { text = "I'll watch the road.", next = "BACK", fx = { learn = { "al_aketh" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "al_aketh" } } },
      },
    },
    gifts = {
      big = true,
      lines = {
        { id = "gf_default", text = "Does she, now? How many times must I tell that girl not to coax the young into wasting our gifts for a laugh! Walk on air when you need to, child, because if you spend it carelessly it won't be there when the ground really does give way." },
      },
      choices = {
        { text = "Our gifts are sacred. I'll use mine with care.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A gift that's never enjoyed is wasted.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "When would the ground give way?", next = "ground" },
      },
    },
    ground = {
      lines = {
        { id = "gr_default", text = "More often than it used to, I'm sorry to say. Whole stretches of the isle have broken away into the sky in the last few years, and the folk who lived on them had only what they could carry and whatever gift the winds had left them." },
      },
      choices = {
        { text = "Then I'll save my gift for that day.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers = {
      lines = {
        { id = "t_default", text = "That depends on what you are. Ren teaches the blade in the watchtower and Akeri teaches the quieter arts there too, Tai'ree has the hunters, Dorii the High Order's magic, Boro the Windshapers' rites and Xyton the druid's path." },
      },
      choices = {
        { text = "Two orders teaching in one village?", next = "orders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders = {
      lines = {
        { id = "o_default", text = "Here in the grove, yes, and peaceably, because I insist on it. Beyond Thendal the High Order and the Windshapers have very little patience for each other, and you'll find that out soon enough, so learn your trade here while it's still quiet." },
      },
      choices = {
        { text = "I'll try to keep the peace out there.", next = "BACK", fx = { affinity = 1, learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    village = {
      lines = {
        { id = "vi_default", text = "Thendal Village, guest, where young shen'dorei come of age and learn their first trades. Our people left Kalimdor ten thousand years ago and have lived on these isles in Skywall ever since, and you are among the first outsiders to set foot here." },
        { id = "vi_nelf", when = { race = "NightElf" },
          text = "Thendal Village, cousin, for that's what you are, more or less. Our ancestors left Eldre'Thalas in Kalimdor ten thousand years ago, and I'm told you'll understand most of what we say if you listen past the accent." },
      },
      choices = {
        { text = "Why did your ancestors leave Kalimdor?", next = "village_why" },
        { text = "Your people can't have seen outsiders in a long while.", next = "village_out" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_why = {
      lines = {
        { id = "vw2_default", text = "A prince of Eldre'Thalas named Tortheldrin wanted to draw power from a demon world, and the people who rose against him lost, and fled. The High Elder tells it better than I do, and you'll find her in Valanaar to the south." },
      },
      choices = {
        { text = "I'll ask her.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_out = {
      big = true,
      lines = {
        { id = "vo_default", text = "Strange, to put it plainly. The children stare at you because they've never seen a face that wasn't ours. Some of the elders think we've opened a door we can't close, and some think we should have opened it centuries ago." },
        { id = "vo_tauren", when = { race = "Tauren" },
          text = "Strange, and you are stranger than most, if you'll forgive me; the children think you're a kind of very polite ursera. Your people have taken in our Windshapers, though, and that earns you a welcome here whatever the elders grumble." },
      },
      choices = {
        { text = "Doors are meant to be opened. You'll be stronger for it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Be careful who you let through it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xl_default", text = "Prince Tortheldrin wished to drink from a demon world, and our ancestors died in the streets of Eldre'Thalas to stop him. I won't turn you out of the grove for your craft, guest, but I'd thank you not to practise it near the children." },
      },
      choices = {
        { text = "That's fair. I'll keep my craft out of sight.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your ancestors feared what they didn't understand.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xp_default", text = "Because the Al'Aketh are the only priesthood we've ever had, and they preach that the Windlord will save us if we kneel. Our people put their trust in the spirits and in each other, and anyone who asks us to kneel has a hard road here." },
      },
      choices = {
        { text = "Then I'll ask no one to kneel. Faith should be free.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A true faith would steady your people. You need one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      big = true,
      lines = { { id = "xpa_default", text = "Tell me in one breath, then, because the vuldren won't cull themselves. I've never met a faith that asked so little of the winds, and I'm not sure if that makes it stronger than ours or simply louder." },
      },
      choices = {
        { text = "The Light asks only that we protect the weak.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light is strength. It asks me to crush my enemies.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the grove, the young and the trouble at its edges. Ask about any of those, child." } },
    background = { { id = "tp_bg", text = "I keep Thendal Village, I give the young their relics, and I scold anyone who jumps off my watchtower.", next = "relic" } },
    advice = { { id = "tp_ad", text = "Use your gifts when you need them and not before, and never stand alone at the standing stones." } },
    al_aketh = { { id = "tp_aketh", text = "Grey robes, shaved heads and a High Priestess at the Shrine of Akir. We watched them too long.", next = "cult" } },
    two_orders = { { id = "tp_orders", text = "In my grove they share a roof. Outside it, they'd rather share nothing at all." } },
    windstones = { { id = "tp_stones", text = "Dalia the Collector has the young gathering them all over the grove, because the isle's magic is fading and every stone counts." } },
    highborne = { { id = "tp_highborne", text = "Our ancestors were Highborne, child of Zephras, and they wielded gifts so great they broke the world with them. That is why I scold you when you play with yours." } },
    the_elements = { { id = "tp_the_elements", text = "The wind spirits gave us these islands and the gifts we carry, and they asked only that we honor them. They have gone quiet now, and I still honor them, because a debt doesn't vanish when the lender leaves the room." } },
    elune = { { id = "tp_elune", text = "The moon is lovely, and our cousins on the ground pray to it, but here we answered to the winds first. I won't stop anyone from praying, so long as they don't stop listening." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "The Highborne served a queen who thought herself greater than the sky, and the sky remembered. Don't ever let me hear you speak her name with admiration." } },
    _none = { { id = "tp_none", text = "That's beyond the grove, child, and I keep to the grove. Ask in Valanaar." } },
  },
}

---------------------------------------------------------------------------
-- Aetheen of the Gales: Elder of Zephras Isle, on the Council of Elders.
-- Reads the winds in Thendal Grove and tests the young; sends them to Shen'dar.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_aetheen", id = TODO_NPC("Aetheen of the Gales"), name = "Aetheen of the Gales", title = "Elder of Zephras Isle",
  bible = "bibles/zephras.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "steady", "sharp" }, values = { "wise", "dutiful" },
  notices = { "kin", "stranger", "race", "origin" },

  impression = {
    first = "Aetheen of the Gales sits on the Council of Elders and came to Thendal Grove to read the winds and weigh the young. She watches before she speaks, and when she speaks it sounds like a test.",
    third = "{name} met Aetheen of the Gales, an elder of the Council who reads the winds and tests the young of Zephras Isle.",
  },

  greetings = {
    { id = "g_winds", text = "The winds told me you'd come back. They're not always right, but they were today." },
    { id = "g_guest", when = { ["not"] = { race = "Skyborne" } }, text = "Gale's greetings, traveller. You've come a long way up to stand in our wind." },
    { id = "g_away", when = { away = 14 }, text = "The winds told me you'd been gone {away}, and they were right for once, so I'm curious to see what the time away has made of you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown stronger since I last weighed you, and I see it plainly, though strength is the easy part of any test, so show me what you do with it." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone round in the grove, which tells me more about you than your blade does, and the Council could use a voice like that, though I'd never say so in session." },
  },

  notice = {
    { id = "n_young", cat = "kin", when = { race = "Skyborne", maxLevel = 4 },
      text = "You may not know me, but I've been watching you since your relic was put in your hands. Everything you've done in this grove has been a trial of sorts, and you've not failed one yet." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei! Our ancestors were your ancestors' neighbors in Eldre'Thalas before the rebellion, and I never thought I'd see one of you stand in Thendal Grove." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "One of the Kirin Tor's people? They opened the way for us, so the Council owes your kind a debt, whether or not you had a hand in it." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You've been dead, I think, and come back. We scatter our dead to the winds so they can't return, and I confess I'm not sure what we'd do with you." },
    { id = "n_blade", cat = "origin", when = { origin = "skyborne_empyrean_recruit" },
      text = "You hold that blade the way Valennia Stormfist's Empyrean Blades were taught to, with the guard high and the weight on the back foot. There's no Shal'nan left to guard, but the habit suits you, and I'd keep it." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc of the Horde. Ayessa's Windshapers went to your people's allies, so I expect I'll see more of you, and I'd like to start with good manners on both sides." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aetheen, and I sit on the Council of Elders of Zephras Isle. I've come to Thendal Grove to read the flow of the winds and to judge the young shen'dorei as they come of age, so tell me, are you ready to serve the isle?" },
        { id = "h_matriarch", tags = { "news" }, when = { questActive = TODO_QUEST("Foul Matriarch") },
          text = "The ursera matriarch is still in the caves to the south, and the rangers call her Urs'anah. It's a test of resolve, I'll grant you, and a dangerous one, but the trials beyond the grove are worse." },
        { id = "h_matriarch_done", tags = { "news" }, when = { questDone = TODO_QUEST("Foul Matriarch") },
          text = "You've felled beasts and turned back cultists, and you put down the ursera matriarch besides. Your path must take you beyond Thendal soon, and I'll admit I'm glad of it." },
        { id = "h_guest", when = { ["not"] = { race = "Skyborne" } },
          text = "I am Aetheen of the Gales, of the Council of Elders. We've had mainlanders in Valanaar for a little while now, but you're the first to come all the way to Thendal Grove to look at me." },
        { id = "h_druid", when = { class = "DRUID", ["not"] = { race = "Skyborne" } },
          text = "A druid from the mainland, and of the Cenarion Circle, I'd guess. Our own are few and keep their own counsel, so you may find them friendlier to the beasts than to you." },
        { id = "h_hunter", when = { class = "HUNTER", ["not"] = { race = "Skyborne" } },
          text = "A hunter, with a beast at your heel. The Rangers of Thendal Grove will want to see how your mainland animal takes to our wind, and so, frankly, do I." },
        { id = "h_peace", when = { origin = "skyborne_peacekeeper" },
          text = "A Peacekeeper, come to the grove to be weighed like a child at the coming of age. You kept the peace on this isle when there was precious little of it, and I wonder whether you know yet whose peace you mean to keep below the clouds." },
      },
      again = {
        { id = "h_again", text = "Ask what you need to; the winds won't change while we talk." },
        { id = "h_again2", text = "What else? I'm listening, and so is the grove." },
      },
      choices = {
        { text = "What does the Council of Elders do?", next = "council" },
        { text = "The winds must tell you a great deal.", next = "winds" },
        { text = "Why test the young at all?", next = "trial" },
        { text = "Where should I go after Thendal?", next = "shendar", when = { race = "Skyborne" } },
        { text = "How do your people see us outsiders?", next = "outsiders", when = { ["not"] = { race = "Skyborne" } } },
        { text = "We kaldorei remember Eldre'Thalas too.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Why would the dead trouble you?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "I don't know whose peace I'm keeping anymore, Elder.", next = "xpeace", when = { origin = "skyborne_peacekeeper" } },
        { text = "Winds be with you, Elder.", next = "END" },
      },
    },
    council = {
      lines = {
        { id = "co_default", text = "We govern Zephras, as the elders have since the Shal'nan set down his rule and gave it to a council of the provinces. The people choose who sits on it now, and High Elder Talaanis Shadowsong speaks for all of us in Valanaar." },
      },
      choices = {
        { text = "Why did the Shal'nan give up his rule?", next = "shalnan" },
        { text = "The High Elder seems a careful sort.", next = "talaanis" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shalnan = {
      lines = {
        { id = "sh_default", text = "He announced it when the ground was broken for the Shrine of the Four Winds, after more than a century of ruling nearly alone. He said our people could govern ourselves, and he hoped we'd never live under a tyrant again, which is a fine thing to hope and a hard thing to keep." },
      },
      choices = {
        { text = "And where is he now?", next = "shalnan_gone" },
        { text = "Something else.", next = "BACK", fx = { learn = { "shal_nan" } } },
      },
    },
    shalnan_gone = {
      big = true,
      lines = {
        { id = "sg_default", text = "Nobody knows, and I've no patience for anyone who claims otherwise. He spent his last years among us tending our bond with the wind spirits, and now he is gone and so are they, and the Council must manage without either." },
      },
      choices = {
        { text = "A council of many is safer than one ruler.", next = "BACK", fx = { affinity = 1, align = { order = 1 }, learn = { "shal_nan" } } },
        { text = "In a crisis, one strong leader would serve better.", next = "BACK", fx = { align = { order = -1 }, learn = { "shal_nan" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "shal_nan" } } },
      },
    },
    talaanis = {
      lines = {
        { id = "ta_default", text = "Careful, patient and honest to a fault, which is why the Council keeps choosing her. She'd tell you herself that she never wanted the seat, and she'd be telling the truth." },
      },
      choices = {
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    winds = {
      lines = {
        { id = "w_default", text = "Less than they used to, and nothing kind. The sentient spirits who lived with us are gone, and what's left on the wind in this grove is restless and easily stirred." },
      },
      choices = {
        { text = "Can you tell where the spirits went?", next = "winds_where" },
        { text = "Stirred by whom?", next = "winds_cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winds_where = {
      lines = {
        { id = "ww_default", text = "No, and neither can anyone else, though the Windshapers try harder than most. I read the wind's flow, child, not its heart, and its heart is the part that's missing." },
      },
      choices = {
        { text = "Then we keep listening.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    winds_cult = {
      lines = {
        { id = "wc_default", text = "The Al'Aketh, who worship the one they call the ruler of Skywall, Al'Akir. They're brutal and single-minded, and their ambitions grow deadlier every day they go unchecked." },
      },
      choices = {
        { text = "Where are they strongest?", next = "shendar", fx = { learn = { "al_aketh" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "al_aketh" } } },
      },
    },
    trial = {
      big = true,
      lines = {
        { id = "tr_default", text = "Because Zephras needs spirited young people if it's to survive what's coming, and spirit alone gets people killed. Better I learn what you're made of in the grove, with rangers close by, than the cult learns it on the road." },
      },
      choices = {
        { text = "Test me, then. I'll not shy from it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'll prove myself my own way, not by your tests.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What sort of test do you have in mind?", next = "matriarch" },
      },
    },
    matriarch = {
      lines = {
        { id = "ma_default", text = "The ursera den to the south has grown bold, and the rangers had to kill a young one that went after a boy near the elder tree. Thin them, and find the matriarch the rangers call Urs'anah, and put her down." },
      },
      choices = {
        { text = "I'll go.", next = "BACK" },
        { text = "Something must have turned the ursera against us.", next = "matriarch_why" },
      },
    },
    matriarch_why = {
      lines = {
        { id = "mw_default", text = "Hunger and desperation, mostly, and the wind's magic going sour, which the beasts feel before we do. Our creatures are losing themselves without the spirits, and it grieves me to send you to kill them for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shendar = {
      lines = {
        { id = "sd_default", text = "South, to Shen'dar Village, where the cult presses hardest. Present yourself to Constable Aonda and tell her I sent you; she's a fine woman who has served the isle faithfully, and she'll need every hand she can get." },
      },
      choices = {
        { text = "What's Shen'dar like?", next = "shendar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shendar2 = {
      lines = {
        { id = "sd2_default", text = "Busier than Thendal, with an inn and trainers and an elder of the Windshapers and an elder of the High Order living a little too close together. The highlands above it hold the Windshapers' standing stones, and the High Order's apprentices can't seem to leave them alone." },
      },
      choices = {
        { text = "I'll mind my step there.", next = "BACK", fx = { learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    outsiders = {
      big = true,
      lines = {
        { id = "ou_default", text = "Warily, and with a great deal of curiosity. We hid from the world for ten thousand years, and some on the Council think we were right to, and the rest of us think hiding is what nearly killed us." },
        { id = "ou_tauren", when = { race = "Tauren" },
          text = "Warily, though less so with your people. The Windshapers went down to Mulgore and were taken in at Skywatcher Plateau, north of your Thunder Bluff, and the Council hasn't forgotten it." },
        { id = "ou_dwarf", when = { race = { "Dwarf", "Gnome" } },
          text = "Warily, and with some puzzlement, because none of us had ever seen your kind before the skycutters came. The children have been arguing about whether you're very short elves." },
      },
      choices = {
        { text = "You were right to come out of hiding.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some of you should have stayed hidden.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xn_default", text = "Then you'll know of Prince Tortheldrin, and perhaps you'll know that the people who rose against him fled west from Eldre'narr and were never heard of again. Well, here we are, and I hope you'll carry word of us to your people kindly." },
      },
      choices = {
        { text = "I'll tell them their cousins lived.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      big = true,
      lines = {
        { id = "xf_default", text = "Because our dead go to the winds, and their relics pass to the young, and that's how we know a life has ended well. You carry your ending around with you, and I don't know whether to pity that or envy it." },
      },
      choices = {
        { text = "Neither. I get up each morning and keep walking.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Pity it. Your way is kinder.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpeace = {
      big = true,
      lines = {
        { id = "xp_default", text = "Good, because a Peacekeeper who's certain is a dangerous thing. Up here you kept the Council's peace against bandits and cultists, and some of those bandits were refugees from Shen'dramar with nowhere else to go, so tell me honestly, did the law always feel like justice to you?" },
      },
      choices = {
        { text = "The law held the isle together. That was justice enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 }, trait = { stern = 1 } } },
        { text = "No. Some I arrested deserved bread, not chains.", next = "BACK", fx = { affinity = 2, align = { order = -1 }, trait = { kind = 1 } } },
        { text = "What would you have me keep below the clouds?", next = "xpeace_below" },
      },
    },
    xpeace_below = {
      lines = {
        { id = "xpb_default", text = "The peace of whoever is weakest in the room, I think, since that's the only kind worth the trouble. The mainlanders have kings and warchiefs enough to keep their own, and you'll do more good standing between a farmer and a bandit than between two orders shouting at each other." },
      },
      choices = {
        { text = "Then I'll stand with the weakest.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The weak can hire swords like anyone else. Mine aren't free.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Council hears a great deal, and I hear what the Council does. Ask." } },
    background = { { id = "tp_bg", text = "I sit on the Council of Elders, and I read the winds, which is a colder job than it sounds, up on that ridge.", next = "council" } },
    advice = { { id = "tp_ad", text = "Go to Shen'dar with your eyes open, and trust Aonda before you trust anyone in robes." } },
    shal_nan = { { id = "tp_shal", text = "He gave up his rule when the Shrine of the Four Winds was begun. Then he gave up us, or we lost him.", next = "shalnan" } },
    al_aketh = { { id = "tp_aketh", text = "Zealots of a Windlord our spirits wouldn't even name. Brutal, and growing bolder." } },
    two_orders = { { id = "tp_orders", text = "Two halves of one people, and both certain the other half is the trouble." } },
    highborne = { { id = "tp_highborne", text = "The High Order says we are Highborne and should reclaim it, and the Windshapers say we are Highborne and should repent of it. Tell me which you think, and I'll learn more about you than you mean me to." } },
    the_elements = { { id = "tp_the_elements", text = "The winds speak in patterns, and I read them as others read a page. Lately the page is half blank, and that is a message of its own." } },
    elune = { { id = "tp_elune", text = "A few of our young have taken to praying to the moon, as our cousins do. I watch to see whether the moon answers, and so far she's been quiet, like everything else." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "Our oldest stories speak of a queen who wanted the sky as her crown. Ask yourself whether you would have followed her, and answer honestly." } },
    _none = { { id = "tp_none", text = "The winds don't carry that to me, and I don't guess for the Council." } },
  },
}

---------------------------------------------------------------------------
-- Myriaal Mistwake: Ranger of Thendal Grove, bored atop the watchtower;
-- coaxes the young into the Falling With Style game.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_myriaal", id = TODO_NPC("Myriaal Mistwake"), name = "Myriaal Mistwake", title = "Rangers of Thendal Grove",
  bible = "bibles/zephras.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "cheerful" }, values = { "friendly", "brave" },
  notices = { "kin", "stranger", "race" },

  impression = {
    first = "Myriaal Mistwake is a ranger who guards Thendal Grove from the top of its watchtower and fills the slow hours with mischief. She'd like everyone to stop taking themselves so seriously, starting with Halaan.",
    third = "{name} met Myriaal Mistwake, a mischievous ranger of Thendal Grove who dares the young to leap from the watchtower.",
  },

  greetings = {
    { id = "g_hi", text = "Well hello there! You look like someone who needs a bit of fun." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Either you liked the game or you've come to complain, and I'm happy either way." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Oh, you're tiny! You'd float for ages off this tower, I bet, if only you could walk on air. Can you? No? What a waste of a perfectly good size." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Look at those tusks! I've never seen anything like you, and I mean that as the nicest thing I've said all week." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, up a watchtower in Skywall! I've heard your people don't care for heights, so I'm very impressed, or you're very lost." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Myriaal Mistwake, Rangers of Thendal Grove, at your service and terribly bored. I can only tease Halaan so much before even that loses its charm, so you've arrived at exactly the right moment." },
        { id = "h_game", tags = { "news" }, when = { questActive = TODO_QUEST("Falling With Style") },
          text = "Go on, step up to the ledge! Walk on the air and see how far you float, and if you land right in front of Rorian, you get the most points of all." },
        { id = "h_gamedone", tags = { "news" }, when = { questDone = TODO_QUEST("Falling With Style") },
          text = "I heard Rorian squawk from all the way up here! That was the best thing that's happened in this grove since the cirrusflies got into his robes." },
        { id = "h_ranger", when = { origin = "skyborne_thendal_ranger" },
          text = "Look who's back from the rangers' paths! You were always the one who actually listened to Halaan, and I've forgiven you for it." },
      },
      again = {
        { id = "h_again", text = "What else? I've got all day, sadly." },
        { id = "h_again2", text = "Ask away. Halaan certainly won't talk to me." },
      },
      choices = {
        { text = "What's this game of yours?", next = "game" },
        { text = "Why tease Halaan?", next = "halaan" },
        { text = "What do the rangers do up here?", next = "rangers" },
        { text = "I can't walk on air. Can I still play?", next = "xnoair", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Take care, Myriaal.", next = "END" },
      },
    },
    game = {
      lines = {
        { id = "ga_default", text = "It's very simple: you step off the ledge, then walk on the air to slow your fall and see how far forward you can float. The rules are whatever I say they are, and the best score is landing on Rorian's toes." },
      },
      choices = {
        { text = "Rorian will be angry about this.", next = "game_rorian" },
        { text = "Is it dangerous?", next = "game_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    game_rorian = {
      lines = {
        { id = "gr_default", text = "Furious, every time, and that's half the fun. He'll tell you our gifts are sacred and not for amusement, and then he'll say something about youths, and then he'll quietly admit a little practice is acceptable." },
      },
      choices = {
        { text = "He might have a point, you know.", next = "game_point" },
        { text = "Something else.", next = "BACK" },
      },
    },
    game_point = {
      big = true,
      lines = {
        { id = "gp_default", text = "Oh, a small one. He says if you spend the gift carelessly it won't be there when you need it. But I think a gift you never laugh with is a gift you've already lost, and that's my sermon for the day." },
      },
      choices = {
        { text = "You're right. Laughing keeps us alive up here.", next = "BACK", fx = { affinity = 2, align = { order = -1 }, trait = { witty = 1 } } },
        { text = "He's right. Our gifts aren't toys.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    game_safe = {
      lines = {
        { id = "gs_default", text = "Not from this height, no, unless you forget to use the gift at all, and then it's only embarrassing. The tower's high enough to be fun and low enough to be forgiven." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    halaan = {
      lines = {
        { id = "ha_default", text = "Because he's a stuffy old wretch who stares at the anchor pylon all day as if it's going to say something. Somebody has to keep him from turning into a statue, and the job didn't pay, so I volunteered." },
      },
      choices = {
        { text = "What's he looking at?", next = "halaan_pylon" },
        { text = "You sound fond of him.", next = "halaan_fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    halaan_pylon = {
      lines = {
        { id = "hp_default", text = "The great pylon out past the grove. The wind spirits left them to hold the island together, and Halaan says their magic's gone unsteady, though it looks the same to me as it always has." },
      },
      choices = {
        { text = "Ask him to show me, maybe.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    halaan_fond = {
      lines = {
        { id = "hf_default", text = "Don't you dare tell him. If he finds out, he'll start being nice to me, and then what would I have to do all day?" },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm telling him immediately.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    rangers = {
      lines = {
        { id = "ra_default", text = "Keep the grove safe, mostly from things that used to be harmless. The cirrusflies swarm, the ursera come too close, and lately there are grey robes in the ruins south of here, which is not the kind of company I wanted." },
      },
      choices = {
        { text = "Why have harmless things turned dangerous?", next = "rangers_why" },
        { text = "Grey robes?", next = "rangers_cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rangers_why = {
      lines = {
        { id = "rw_default", text = "The winds have gone wrong since the spirits left, and the beasts feel it before we do. It's not their fault, really, but a hungry ursera doesn't care whose fault it is." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rangers_cult = {
      big = true,
      lines = {
        { id = "rc_default", text = "Al'Aketh, with their shaved heads and their Windlord. A brute called Malduko Cloudcrush leads the ones by the temple ruins, and Hanaa's posted on the road south to warn travellers. I'd go down there myself if I weren't stuck on this tower." },
      },
      choices = {
        { text = "I'll go down there and clear them out myself.", next = "BACK", fx = { affinity = 1, align = { honor = 1 }, learn = { "al_aketh" } } },
        { text = "Better to ambush them on the road at night.", next = "BACK", fx = { align = { honor = -1 }, learn = { "al_aketh" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "al_aketh" } } },
      },
    },
    xnoair = {
      lines = {
        { id = "xa_default", text = "You can jump, can't you? You just won't float, and you'll land with a thump instead of a flourish. Actually, that sounds funnier, and I'm sure Rorian would be just as cross." },
      },
      choices = {
        { text = "I'll take the stairs, thank you.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Fine, I'll do it. For the points.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the grove, the gossip, and exactly where Rorian stands every afternoon." } },
    advice = { { id = "tp_ad", text = "Take your fun where you can get it, because the island certainly won't hand you any." } },
    al_aketh = { { id = "tp_aketh", text = "Shaved heads and long faces. They'd be terrible at my game." } },
    highborne = { { id = "tp_highborne", text = "Our ancestors were Highborne, and from what I hear they wore enormous hats and never once laughed. I'm doing my part to correct the family record." } },
    the_elements = { { id = "tp_the_elements", text = "The sprites used to play with us up here, little gusts that tugged your hair and stole your hat. Now they just sulk, and I miss them, and don't tell Halaan I said so." } },
    elune = { { id = "tp_elune", text = "Halaan says I should take up prayer to keep me out of trouble. I told him I'd pray to whatever spirit gets me off this tower first." } },
    _none = { { id = "tp_none", text = "No idea, but if you find out, come and tell me, because I'm bored." } },
  },
}

---------------------------------------------------------------------------
-- Halaan Hawk-Eye: Ranger of Thendal Grove who watches the anchor pylon and
-- lends his far sight. Calm, contented, a little stiff.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_halaan", id = TODO_NPC("Halaan Hawk-Eye"), name = "Halaan Hawk-Eye", title = "Rangers of Thendal Grove",
  bible = "bibles/zephras.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "steady" }, values = { "patient", "wise" },
  notices = { "class", "race", "pet" },

  impression = {
    first = "Halaan Hawk-Eye keeps his eyes on the great anchor pylon beyond Thendal Grove, as if watching it might hold it up. He speaks slowly, believes in being grateful for small gifts, and pretends Myriaal doesn't bother him.",
    third = "{name} met Halaan Hawk-Eye, a ranger of Thendal Grove who watches over the anchor pylon with his far-seeing gift.",
  },

  greetings = {
    { id = "g_watch", text = "Greetings. Forgive me if I keep my eyes on the pylon while we talk." },
    { id = "g_again", when = { metBefore = true }, text = "You again. The pylon hasn't moved, I'm pleased to say." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the pylon hasn't moved in all that time, I'm pleased to say, so forgive me if I keep watching it while we talk." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I'm told you said something that lifted someone's spirits in the grove, and I'm grateful for small gifts like that, even when they're given to somebody else." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, with eyes trained like mine. You'll understand, then, that watching is work, whatever Myriaal says about it." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion keeps glancing at the edge of the isle. Animals sense the wind's trouble before we do, so I'd trust {pet}'s nose more than mine." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. I've read nothing about your people that I trust, so I'll judge you as I find you, which is the only honest way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Halaan, of the Rangers of Thendal Grove. I come here most days to look upon the anchor pylon out yonder, for the wind spirits left them to bind and sustain our island, and someone ought to keep an eye on them." },
        { id = "h_anchors", tags = { "news" }, when = { questDone = TODO_QUEST("The Anchors of Zephras") },
          text = "Thank you for looking with me, the other day. Few people take the time, and the pylon deserves to be seen by someone other than an old ranger." },
        { id = "h_ranger", when = { origin = "skyborne_thendal_ranger" },
          text = "Ah, one of ours. You walked the grove's paths well enough, though I notice you also listened to Myriaal, which I'll try not to hold against you." },
      },
      again = {
        { id = "h_again", text = "Something more? I have time; the pylon isn't going anywhere, I hope." },
      },
      choices = {
        { text = "Something seems wrong with the pylons.", next = "pylon" },
        { text = "Tell me about your gift.", next = "gift" },
        { text = "Myriaal calls you a stuffy old wretch.", next = "myriaal" },
        { text = "Do your eyes reach as far as mine, ranger?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "The forests below are bigger than ours, Halaan, and quieter.", next = "xranger", when = { origin = "skyborne_thendal_ranger" } },
        { text = "Farewell, Halaan.", next = "END" },
      },
    },
    pylon = {
      lines = {
        { id = "py_default", text = "Their magic has grown unsteady of late, flickering where it should be constant. The strange thing is that I see no distress in them at all, and their splendor hasn't changed, so whatever's wrong is wrong where my eyes can't follow." },
      },
      choices = {
        { text = "What happens if they fail?", next = "pylon_fail" },
        { text = "Someone could be harming them on purpose.", next = "pylon_harm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pylon_fail = {
      lines = {
        { id = "pf_default", text = "Then the island comes apart, as other places already have. Ban'aethal began falling into the sky, and its people fled in the night with whatever they could carry, and I'd rather not watch Thendal go the same way." },
      },
      choices = {
        { text = "Can nothing be done?", next = "pylon_hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pylon_hope = {
      big = true,
      lines = {
        { id = "ph_default", text = "The Windshapers would call the spirits home, and the High Order would mend the pylons with their own magic, and each thinks the other is a fool. I only watch, and I'm grateful every morning the pylon is still standing." },
      },
      choices = {
        { text = "The spirits made the pylons. Only they can mend them.", next = "BACK", fx = { affinity = 1, align = { order = -1 }, learn = { "two_orders" } } },
        { text = "We shouldn't depend on spirits. Our own magic must hold it.", next = "BACK", fx = { align = { order = 1 }, learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    pylon_harm = {
      lines = {
        { id = "pa_default", text = "I've heard talk that the Al'Aketh have been seen near the pylons around the isle, though I can't say what they'd want with them. If it's true, it's madness, since the pylons hold up the cultists' homes as well as ours." },
      },
      choices = {
        { text = "I'll keep an eye out.", next = "BACK", fx = { learn = { "al_aketh" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "al_aketh" } } },
      },
    },
    gift = {
      lines = {
        { id = "gi_default", text = "My gift is simple, and rather mundane: I see far. I can't peer between worlds as those with skysight can, and I can't draw on the ley lines beneath Zephras, but a gift it remains, and I'm grateful to have it." },
      },
      choices = {
        { text = "Could you lend it to me?", next = "gift_lend" },
        { text = "I'd wish for more, in your place.", next = "gift_wish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gift_lend = {
      lines = {
        { id = "gl_default", text = "For a moment, if you like, and you'll see the pylon as I see it, close enough to touch. Just ask, and I'll share it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gift_wish = {
      big = true,
      lines = {
        { id = "gw_default", text = "I used to, when I was young and restless. I've come to think that being thankful for what you have is the root of contentment, and that pining for what you might have, or what you've lost, leads only to despair." },
      },
      choices = {
        { text = "That's wisdom. Gratitude keeps a people steady.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, trait = { patient = 1 } } },
        { text = "Without yearning, nobody would ever bring the spirits home.", next = "BACK", fx = { align = { order = -1 }, trait = { ambitious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    myriaal = {
      lines = {
        { id = "my_default", text = "Does she? I suppose I've been called worse by better rangers. She thinks watching is the same as doing nothing, and one day, I hope, she'll understand that it isn't." },
        { id = "my_fell", when = { questDone = TODO_QUEST("Falling With Style") },
          text = "And I suppose she sent you leaping off the tower, as she sends every youngster who stands still long enough. She thinks watching is the same as doing nothing, and one day, I hope, she'll understand that it isn't." },
      },
      choices = {
        { text = "She seems fond of you, really.", next = "myriaal_fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    myriaal_fond = {
      lines = {
        { id = "mf_default", text = "Hmph. Well, she's a fine shot and a loyal ranger, and I'd trust her at my back on any path in the grove. Please don't repeat that within her hearing; I'd never know peace again." },
      },
      choices = {
        { text = "I won't say a word.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xh_default", text = "Perhaps, but your eyes were made by training and mine by a gift, and I'd wager yours are the more honest of the two. Tell me, is the sky below the clouds as wide as it is up here?" },
        { id = "xh_sky", when = { race = "Skyborne" },
          text = "Perhaps, for Tai'ree trained you well. Tell me, when you go down to the mainland, will you miss watching the pylons, or will you be glad to be rid of them?" },
      },
      choices = {
        { text = "Wider. You'd like it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Smaller, somehow. Full of walls.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xranger = {
      lines = {
        { id = "xr_default", text = "Quieter, you said, and I believe it, because a forest that size has room to swallow a sound before it reaches you. Out here the wind always carried a warning, so you'll have to learn to listen to the ground instead, and to the birds, which is slower but no less honest." },
      },
      choices = {
        { text = "Then I'll learn the ground, as you taught me the wind.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
        { text = "Did you ever want to see the forests below?", next = "xranger_see" },
      },
    },
    xranger_see = {
      lines = {
        { id = "xrs_default", text = "Every day of my youth, and none since, or so I tell myself when the skycutter leaves without me. Walk them well for both of us, and if you find a tree taller than the greatfather, don't tell Rorian; he'd never forgive it." },
      },
      choices = {
        { text = "I'll keep that secret, Halaan.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the pylon, the grove, and how to keep still, which is rarer than you'd think." } },
    advice = { { id = "tp_ad", text = "Be grateful for what you have. I spent years wishing for the mainland, and all it gave me was a crick in my neck from staring at clouds." } },
    windstones = { { id = "tp_stones", text = "They hold the winds' strength, and they grow more precious as the pylons weaken." } },
    the_elements = { { id = "tp_the_elements", text = "The pylon still stands because the winds once willed it, and I watch it so I'll know if they ever stop willing. Be grateful for what holds, I tell the young, and do not ask too much of it." } },
    highborne = { { id = "tp_highborne", text = "The Highborne were our ancestors, and they took everything they wanted. I'd rather be grateful for less, and I'd rather Myriaal were grateful for anything at all." } },
    elune = { { id = "tp_elune", text = "The moon rises over the pylon each night, and I find it steadying. Whether it is a goddess or only a moon, I am grateful for the light." } },
    _none = { { id = "tp_none", text = "That's beyond what I can see from here, and I can see a long way." } },
  },
}
