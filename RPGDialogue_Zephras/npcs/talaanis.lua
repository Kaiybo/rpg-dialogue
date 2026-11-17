-- High Elder Talaanis Shadowsong, Zephras Isle. Voice: bibles/talaanis.md
-- Facts from the Skyborne lore brief (build prompt §10) and, since 1.7.0, warcraft.wiki.gg
-- (sources in bibles/zephras.md). Where they are silent, she is silent too.
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "talaanis", id = TODO_NPC("Talaanis Shadowsong"), name = "Talaanis Shadowsong", title = "High Elder",
  bible = "bibles/talaanis.md", role = "noble", tier = "major",
  communities = { "zephras_isle" }, temper = { "steady" }, values = { "honest", "lawful" },
  notices = { "kin", "stranger" },

  impression = {
    first = "High Elder Talaanis Shadowsong holds the office by the Council's choice and much against her own. She answers questions plainly and admits what nobody knows, which I found more reassuring than any promise.",
    third = "{name} met Talaanis Shadowsong, High Elder of Zephras Isle, chosen by the Council of Elders and much against her own wishes.",
  },

  greetings = {
    { id = "g_winds", text = "Winds be with you." },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "A guest, and we have few. Winds be with you all the same." },
    { id = "g_back", when = { metBefore = true, race = "Skyborne" }, text = "Back again, child? The Council can spare me a moment, barely." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Council has argued about a great deal in that time, though I'll spare you most of it. Winds be with you, and welcome back to Valanaar." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been away {away}, and I had begun to wonder whether the winds had carried you off for good. I'm glad they didn't, and I'll say so plainly." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown a great deal since we last spoke, and I'd be lying if I said the Council hadn't noticed. They'll want to put you to use, so choose carefully what you agree to." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear you left someone on the isle in a fury, and Zephras is small enough that I hear these things by supper. I won't judge it unheard, but I'd like it mended." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The isle has been speaking well of you, and I've heard your name from more than one elder this week, which doesn't happen often, so take it as the compliment it is." },
  },

  notice = {
    { id = "n_warrior", cat = "kin", when = { race = "Skyborne", class = "WARRIOR" },
      text = "A blade. Good; the Peacekeepers will be glad of you, though they'll ask you to keep it sheathed around the other order's people, and you'd do well to listen." },
    { id = "n_rogue", cat = "kin", when = { race = "Skyborne", class = "ROGUE" },
      text = "You came in without the guards noticing, which tells me two things about you, child, and I approve of only one of them." },
    { id = "n_druid", cat = "kin", when = { race = "Skyborne", class = "DRUID" },
      text = "A druid, and there are so few of you. Your faith leans to the elements before Elune; don't let anyone on the mainland tell you that's backwards." },
    { id = "n_shaman", cat = "kin", when = { race = "Skyborne", class = "SHAMAN" },
      text = "A Windshaper! You've passed your trials, then, and good; the elements will need more friends than ever, now our patrons are gone." },
    { id = "n_mage", cat = "kin", when = { race = "Skyborne", class = "MAGE" },
      text = "The High Order's newest, I see. Your ancestors were magisters, so remember it, and remember what Prince Tortheldrin did with power like theirs." },
    { id = "n_stranger", cat = "stranger", when = { ["not"] = { race = "Skyborne" } },
      text = "You're the first of your people I've spoken with. I find I have more questions than manners. Forgive me." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It troubles me as any power taken from the Nether troubles me, because that is what drove us into hiding ten thousand years ago. I won't judge you by your craft alone, since I've known honest people with stranger habits, but you'll find that many on this isle have longer memories than I do." } },
      choices = {
        { text = "I understand. I'll keep my craft to myself while I'm here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old fears shouldn't bind your people forever, Elder.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I gave Ayessa Dawnsinger my blessing, and I meant it, though I'll admit it pains me to watch our people split between two banners. The two orders quarrel enough on this isle without the Horde and the Alliance quarrelling over them as well, and I'd ask you to remember that when you meet the High Order's people." } },
      choices = {
        { text = "I'll treat the High Order's people with respect, Elder.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Alliance chose its side. The Horde owes them nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "To the winds, mostly, out of long habit, though the patrons who sheltered us are gone and nobody knows where. The only priests this isle ever knew were Lorthuna's Al'Aketh, so you'll find people wary of the robe, but some of the young have begun asking about Elune, and I won't tell them what to find." } },
      choices = {
        { text = "Let them find their own faith. That's as it should be.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A people needs a shared faith. Guide them, Elder.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "None that I know of, and I'd rather tell you that plainly than invent something to please you. Our ancestors owed everything to the wind spirits, and since they vanished, most of us are still working out what we believe, so a guest so certain of their faith is something of a curiosity here." } },
      choices = {
        { text = "Faith takes time. I hope your people find their own.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to trust your own strength than any power above.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_ta = {
      lines = {
        { id = "wta_default", text = "Everywhere, and that's the trouble. The Peacekeepers are stretched between the Al'Aketh and the two orders, and a blade that keeps its temper is worth more to me just now than one that only keeps its edge." },
        { id = "wta_blade", when = { origin = "skyborne_empyrean_recruit" },
          text = "A recruit of the Empyrean Blades. They guarded the Shal'nan once, and they've guarded nobody so important since; don't let them tell you that makes the work smaller." },
      },
      choices = {
        { text = "I'll keep the orders apart, then. Both of them.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "I'll pick a side. Standing between gets you cut.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Tell me about the Peacekeepers.", next = "peacekeepers" },
      },
    },
    hunter_ta = {
      lines = {
        { id = "hta_default", text = "The Rangers of Thendal Grove; then you know the island better than half the Council. The mainland will be strange to you, and none of us yet knows how strange, but keep your eyes as sharp as Thendal taught them and you'll manage." },
      },
      choices = {
        { text = "I'll miss the island's winds.", next = "BACK", fx = { affinity = 1 } },
        { text = "A strange land is a hunter's best teacher.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    rogue_ta = {
      big = true,
      lines = {
        { id = "rta_default", text = "There's always a place for quiet, child; the Council simply prefers not to say so out loud. Lorthuna's Al'Aketh were broken once, not ended, and somebody among us had better learn where the rest of them went." },
      },
      choices = {
        { text = "I'll watch the Al'Aketh. Nothing more.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1, learn = { "al_aketh" } } },
        { text = "If I find them, they won't be a problem.", next = "BACK", fx = { align = { honor = -1 }, learn = { "al_aketh" } } },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, on Zephras Isle. I'll speak with you, guest, but you should know that our ancestors left Eldre'Thalas rather than kneel to a prince who drank from the Nether." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest of the Horde, on Zephras Isle. The Windshapers have gone to your people at Camp Gev'rek, guest, so I suppose we're allies of a sort, and you're welcome here." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Alliance, on Zephras Isle. Our druids put the elements before Elune, guest, so you'll find few here who pray as you do, but you'll find nobody who'll mock you for it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, on Zephras Isle. We've no paladins of our own, guest, and I don't claim to understand your Light, but you're welcome here so long as you keep the peace." },
        { id = "h_nightclaw", when = { origin = "skyborne_nightclaw" },
          text = "You came down out of Shadowgale Forest, I'm told, and the Nightclaw don't send their own to the Council's door lightly. Whatever they've taught you, child, keep their secrets; they've kept ours long enough." },
        { id = "h_windshaper", when = { origin = "skyborne_windshaper" },
          text = "Ayessa tells me you came through the elemental trials and drank the sapta without flinching, which is more than she did at your age. Honor the winds below the clouds if you must, child, but honor the living first, because they can still hear you." },
        { id = "h_highorder", when = { origin = "skyborne_high_order" },
          text = "Your family kept the magisters' books through every drift of the isles, so I know your name, child, whether or not you know I do. Find what's missing from them, by all means, but bring the gaps home before you fill them with something worse." },
        { id = "h_default", text = "Talaanis Shadowsong, High Elder, by the Council's choice and much against my own. Ask what you need to." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Kaldorei, in Valanaar. Our ancestors fled your cousins' city ten thousand years ago, and here you stand speaking our tongue as if no time had passed at all; forgive me if I stare." },
        { id = "h_kirin", when = { race = { "Human", "Gnome" } },
          text = "One of the Alliance, come up on the High Order's skycutter from Dalaran. The Kirin Tor answered us when we had nobody else, guest, so you'll find Valanaar glad of you." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf of the Alliance, come up from Dalaran. I'm told your people live inside mountains, so I imagine our sky seems very large to you, and very thin underfoot." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "One of the tauren who took in our Windshapers at Skywatcher Plateau. The Council owes your people thanks, guest, and I'm glad to give it in person." },
        { id = "h_hordeout", when = { race = { "Orc", "Troll" } },
          text = "One of the Horde, come up from Mulgore on the Windshapers' skycutter. Ayessa tells me your people keep their word, guest, and I'd like to find out for myself." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "One of the Horde's dead who walk, come up from Mulgore. We scatter our own to the wind, guest, so you'll forgive the children for hiding, but you're welcome in Valanaar while you keep the peace." },
        { id = "h_alliance", when = { race = "Skyborne", faction = "Alliance" },
          text = "The High Order has gone to the Kirin Tor. Elaadrin Evengale leads them from the Sky Enclave in Dalaran. Go with my blessing, and with your temper in hand." },
        { id = "h_horde", when = { race = "Skyborne", faction = "Horde" },
          text = "Ayessa Dawnsinger has taken the Windshapers to the Horde, to Camp Gev'rek in Mulgore. Go with my blessing, but don't go looking for the High Order's people, not yet." },
        { id = "h_young", when = { race = "Skyborne", maxLevel = 5 },
          text = "You'll have been given your heirloom not long ago. Someone carried it before you, and someone will after. Remember that when you're tempted to be reckless with it." },
        { id = "h_died", when = { race = "Skyborne", deaths = { min = 3 } },
          text = "You've fallen more than once already. We scatter our dead to the wind, child. Don't make me stand on a cliff for you." },
      },
      again = {
        { id = "h_again", text = "Go on. The Council can wait a little longer; it usually does." },
        { id = "h_again2", text = "What else? Ask it now, while I've the patience for it." },
      },
      choices = {
        { text = "Why are our people going down to Azeroth?", next = "skywall", when = { race = "Skyborne" } },
        { text = "Who are the Skyborne?", next = "who", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Why do the two orders quarrel?", next = "orders" },
        { text = "What became of the Shal'nan?", next = "shalnan" },
        { text = "How does the Council of Elders work?", next = "council" },
        { text = "What became of Lorthuna?", next = "lorthuna" },
        { text = "Where are all these refugees from?", next = "refugees" },
        { text = "What happens to the relics of the fallen?", next = "relics", when = { race = "Skyborne" } },
        { text = "What do your people make of us mainlanders?", next = "outsiders", when = { ["not"] = { race = "Skyborne" } } },
        { text = "I'm one of the few druids among us.", next = "druid", when = { race = "Skyborne", class = "DRUID" } },
        { text = "The High Order sent me to the Kirin Tor's mages.", next = "mage", when = { race = "Skyborne", class = "MAGE" } },
        { text = "I've passed the Windshaper trials.", next = "shaman", when = { race = "Skyborne", class = "SHAMAN" } },
        { text = "I trained with the Peacekeepers. Where am I needed?", next = "warrior_ta", when = { race = "Skyborne", class = "WARRIOR" } },
        { text = "I ranged with the hunters of Thendal Grove.", next = "hunter_ta", when = { race = "Skyborne", class = "HUNTER" } },
        { text = "I work quietly, Elder. Is there a place for that?", next = "rogue_ta", when = { race = "Skyborne", class = "ROGUE" } },
        { text = "Do the Skyborne have any faith in the Light, Elder?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Who do the Skyborne pray to, Elder?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do you make of the Windshapers joining the Horde, Elder?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does my craft trouble you, Elder?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Winds be with you, Elder.", next = "END" },
      },
    },
    skywall = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "Our patrons vanished, the pylons began to fail and the islands drifted apart. Then the Al'Aketh brought down the wards that hid us, Lorthuna lit a beacon, and Rohash of the Windlord's Conclave came and promised to tell Al'Akir exactly where we are." },
      },
      choices = {
        { text = "And so we left.", next = "windlord" },
        { text = "Will Al'Akir come for us?", next = "windlord" },
        { text = "Tell me about the patrons.", next = "patrons" },
      },
    },
    windlord = {
      lines = {
        { id = "w_default", key = true,
          text = "I told the Council the Windlord might take years to act, decades even, but I did not say never. Everyone heard the first part." },
      },
      choices = {
        { text = "Then we have time.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Then we should be ready.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Who stood with us against the Al'Aketh?", next = "allies" },
      },
    },
    patrons = {
      lines = {
        { id = "p_default", text = "The wind spirits sheltered our ancestors and lifted this isle into Skywall, and we owed them everything. They rarely spoke of Al'Akir, and they turned every question about him aside, and then one day they were simply gone." },
      },
      choices = {
        { text = "Gone where?", next = "patrons2" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    patrons2 = {
      lines = {
        { id = "p2_default", text = "Nobody knows, child, and you'll hear a good many people claim otherwise. When someone tells you they know where the patrons went, ask them how, and watch their face." },
      },
      choices = {
        { text = "I'll be careful what I believe.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    allies = {
      lines = {
        { id = "al_default", text = "The High Order, the Windshapers and the Peacekeepers broke the cult together at the Shrine of Akir, and then Ansirem Runeweaver of the Kirin Tor and Muln Earthfury of the Earthen Ring came through to stand against Rohash's elementals. Muln talked him into withdrawing, and we owe them both a debt we haven't finished paying." },
      },
      choices = {
        { text = "Debts can hold people together.", next = "BACK", fx = { affinity = 1, learn = { "al_aketh" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "al_aketh" } } },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "Shen'dorei, the hidden people. Our ancestors left Eldre'Thalas ten thousand years ago rather than kneel to a prince who drank from the Nether, and we hid, and now we've stopped hiding." },
      },
      choices = {
        { text = "Welcome back to Azeroth.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Why stop now?", next = "skywall" },
        { text = "Where did you hide?", next = "hid" },
      },
    },
    hid = {
      lines = {
        { id = "hi_default", text = "The rebels sailed west from Eldre'narr on the Feralas coast, and the wind spirits sheltered them and lifted this isle into Skywall, the Plane of Air. Millennia there made us slimmer and more like the high elves, so I'm told, and some of our newborns now come blue-skinned, Sky-Touched." },
      },
      choices = {
        { text = "That's quite a story.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders = {
      big = true,
      lines = {
        { id = "o_default", text = "The High Order wants back what the magisters knew, and the Windshapers feel they owe the spirits everything, and both are right. There have been deaths over sacred places, and both remember them." },
      },
      choices = {
        { text = "Someone has to make peace.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Then let them settle it.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Who leads each order?", next = "leaders" },
        { text = "What frightens you, Elder?", tag = "Persuade", next = "orders_fear",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Skyborne" }, { trait = "kind" } } } },
          fail = { next = "orders_council", fx = { affinity = -1 } } },
      },
    },
    leaders = {
      lines = {
        { id = "le_default", text = "Elaadrin Evengale, Supreme Magister, has taken the High Order to the Kirin Tor and the Sky Enclave in Dalaran, and Ayessa Dawnsinger, Grand Skyseer, has taken the Windshapers to the Earthen Ring at Camp Gev'rek in Mulgore. Both still swear the truce at the Shrine of Akir was only for the moment, and I've told them both I'd like them alive in ten years." },
      },
      choices = {
        { text = "That seems a modest hope.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 }, learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    shalnan = {
      lines = {
        { id = "sh_default", text = "The Shal'nan led the rebellion against Tortheldrin and brought our ancestors to Skywall, and he gave up his rule to a council of elders when the Shrine of the Four Winds was begun. He went on tending our bond with the spirits for a very long time, and now he's gone as they are, and not even Valennia Stormfist, who captained his Empyrean Blades for nearly nine centuries, can say why." },
      },
      choices = {
        { text = "I hope they're found.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "shal_nan" } } },
      },
    },
    council = {
      lines = {
        { id = "c_default", text = "We elect it, and have since the Shal'nan handed his rule to the elders of the provinces, and the Council chose me to speak for it, which I did not ask for. Most of the work is listening to people who are frightened, and telling them the truth without making it worse." },
      },
      choices = {
        { text = "That sounds exhausting.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Who keeps order on the isle?", next = "peacekeepers" },
      },
    },
    peacekeepers = {
      lines = {
        { id = "pk_default", text = "The Peacekeepers, our militia, and their best, the Empyrean Blades, who once guarded the Shal'nan. Lately they spend more of their time keeping the two orders apart than keeping anyone out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "d_default", text = "So few that I know most of you by name. Your faith leans to the elements before Elune, and you have kin in the Cenarion Circle now, so go and learn from them, but don't let them talk you out of the wind." },
      },
      choices = {
        { text = "I won't, Elder.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = {
        { id = "m_default", text = "Good; learn everything they'll teach you, and remember what Prince Tortheldrin did with power like that. He drew it from the Twisting Nether, child, and our people are what came of refusing him." },
      },
      choices = {
        { text = "I'll remember where we came from.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Power is power, and I'll take whatever the magisters can teach.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      lines = {
        { id = "sm_default", text = "Then you've drunk the sapta and faced the elements, and they let you go, which is more than they promise. Skysight is weakening in our people, so if yours is strong, guard it and use it well." },
      },
      choices = {
        { text = "I'll guard it.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Skysight should be shared freely, not guarded.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_fear = {
      lines = {
        { id = "of_default", text = "Not the Windlord, though I'd never say so to the Council. He may take years to act, or decades, but the orders have already shed blood over sacred places, and the next death between them could come any morning." },
      },
      choices = {
        { text = "Then I'll help keep them talking.", next = "BACK", fx = { affinity = 2, learn = { "two_orders" } } },
        { text = "That's a heavy thing to carry alone.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lorthuna = {
      big = true,
      lines = {
        { id = "lo_default", key = true, text = "I set young people to watch her, and a broken recall crystal told us at last what she meant to do: bring down the wards that hid Zephras and let the Windlord in. When Rohash came to her beacon she begged to be brought before Al'Akir, and he struck her aside into the open sky, and nobody has seen her since." },
      },
      choices = {
        { text = "Do you think she's dead?", next = "lorthuna2" },
        { text = "She earned that fall.", next = "BACK", fx = { align = { light = -1 }, learn = { "al_aketh" } } },
        { text = "Even she deserved better than that.", next = "BACK", fx = { affinity = 1, align = { light = 1 }, learn = { "al_aketh" } } },
      },
    },
    lorthuna2 = {
      lines = {
        { id = "lo2_default", text = "I don't know, child, and I'd ask you not to guess aloud near Ayessa Dawnsinger. Lorthuna is her sister, and whatever the Grand Skyseer says about the cult, she has not said one word to me about that." },
      },
      choices = {
        { text = "I'll hold my tongue.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 }, learn = { "al_aketh" } } },
        { text = "Something else, Elder.", next = "BACK", fx = { learn = { "al_aketh" } } },
      },
    },
    refugees = {
      lines = {
        { id = "rf_default", text = "From everywhere that has fallen: Ban'aethal on this isle, and Shen'dramar out in the sky, whose last few got away on the last skycutters to leave it. Valanaar takes in all it can, and it's never enough, so some have turned to banditry and some to the Al'Aketh simply to eat." },
      },
      choices = {
        { text = "What becomes of the ones who turn bandit?", next = "refugees2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refugees2 = {
      big = true,
      lines = {
        { id = "rf2_default", text = "The Peacekeepers hold one now who killed one of their own for windstones, a man whose whole family died after they fled Shen'dramar. The law says he hangs, and the law isn't wrong, and I still haven't signed it." },
      },
      choices = {
        { text = "Spare him. Grief made him what he is.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sign it. Mercy for him is cruelty to the Peacekeepers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    relics = {
      lines = {
        { id = "rl_default", text = "They come back to me, child. When one of us dies, the relic is recovered and kept in a common collection in my care, and in time it goes to another youngster coming of age, so your own passed through my hands before it reached yours." },
      },
      choices = {
        { text = "And if a relic can't be recovered?", next = "relics2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relics2 = {
      lines = {
        { id = "rl2_default", text = "Then someone goes and gets it, if it can be done at all; the Nightclaw druids brought back even the fallen cultists' relics after the Al'Aketh attacked them. Too many are lying in Ban'aethal still, and I'd be grateful to anyone who brought one home." },
      },
      choices = {
        { text = "I'll bring back any I find.", next = "BACK", fx = { affinity = 2, standing = { zephras_isle = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    outsiders = {
      big = true,
      lines = {
        { id = "ou_default", text = "Half of Valanaar wants to touch your armor to see whether it's real, and the other half wants you gone before the Windlord notices you as well. I'm in neither half, guest; I'm only glad we're not alone anymore." },
        { id = "ou_nelf", when = { race = "NightElf" },
          text = "You most of all, kaldorei, confuse them. You speak our tongue and wear our ancestors' faces, and half of Valanaar wants to embrace you while the other half remembers that Eldre'Thalas once sent ships after us." },
      },
      choices = {
        { text = "Your people were right to open their doors.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Be careful. Not every mainlander means you well.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_council = {
      lines = {
        { id = "oc_default", text = "What the High Elder fears is the Council's business, child, and the Council is a patient listener. Ask me something I can answer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Council brings me every worry on this isle, so I know a little about a great many things. Ask me about any of these, and I'll tell you only what's true." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've been honest with me, so I'll be as honest as I'm able, which is honest about what nobody knows. Here is what I can speak to." },
    },
    background = { { id = "tp_bg", text = "I'm High Elder because the Council chose me, and I stayed High Elder because nobody else would take it.", next = "council" } },
    advice = { { id = "tp_ad", text = "Never believe anyone who says they know what Al'Akir will do. I don't, and I've thought about it more than anyone." } },
    al_aketh = { { id = "tp_aketh", text = "Grey robes, shaved heads, and worship for a Windlord our own patrons would hardly speak of. We broke them once at the Shrine of Akir, and once may not be enough.", next = "lorthuna" } },
    two_orders = { { id = "tp_orders", text = "Two roads out of the same house. I'd like them both to come home for dinner, someday." } },
    shal_nan = { { id = "tp_shalnan", text = "Gone with the spirits, and if you hear anything, anything at all, you bring it to me first." } },
    windstones = { { id = "tp_windstones", text = "They light our lamps and fill our purses. When they fail, I suspect we'll learn which mattered more." } },
    highborne = { { id = "tp_highborne", text = "We are the sons and daughters of the Highborne, child, whether we like the inheritance or not. The High Order wants the power back and the Windshapers want the debt paid, and I want them both to remember what the Highborne's pride cost." } },
    dire_maul = { { id = "tp_dire_maul", text = "The city our ancestors fled is called Eldre'Thalas, and I'm told the outsiders now call it Dire Maul and that ogres walk its halls. I can't decide whether that is a tragedy or a kind of justice." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "Azshara is a name our oldest books speak with reverence and our wisest elders speak with a shudder. I'd rather we learned from the shudder." } },
    the_elements = { { id = "tp_the_elements", text = "The winds were our neighbors and our guardians for longer than anyone can count, and then they went quiet. I don't know why, and I'll trust nobody who claims to." } },
    elune = { { id = "tp_elune", text = "Our cousins on the ground pray to Elune, and a few of our people have begun to as well. We were a people of the winds before we were anything else, and I won't scold anyone for looking for another light." } },
    dalaran = { { id = "tp_dalaran", text = "The Kirin Tor sent Ansirem Runeweaver to us when we needed help most, and the High Order owes Dalaran a debt for it. I hope they know what they are taking on in our young mages." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "Archmage Ansirem stood beside us against Lorthuna's elementals and asked very little in return, which in my experience means he'll ask later. I'd pay it gladly." } },
    earth_mother = { { id = "tp_earth_mother", text = "Muln Earthfury of the tauren came with the Earthen Ring and stood with us when the elementals turned. His people speak of an Earth Mother, and the Windshapers are learning to listen to her voice beside the wind's." } },
    cairne = { { id = "tp_cairne", text = "The tauren chieftain, Cairne, has opened his lands in Mulgore to the Windshapers, and I don't know how to thank a man I've never met. I'm told he'd say there's nothing to thank him for, which makes me like him already." } },
    _none = { { id = "tp_none", text = "The Council has many questions and fewer answers, and that's one of the many." } },
  },
}
