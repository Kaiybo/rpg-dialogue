-- High Elder Talaanis Shadowsong, Zephras Isle. Voice: bibles/talaanis.md
-- Everything here comes from the Skyborne lore brief (build prompt §10). Where it is silent,
-- she is silent too.
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
        { id = "h_nightclaw", when = { origin = "skyborne_nightclaw" },
          text = "You came down out of Shadowgale Forest, I'm told, and the Nightclaw don't send their own to the Council's door lightly. Whatever they've taught you, child, keep their secrets; they've kept ours long enough." },
        { id = "h_default", text = "Talaanis Shadowsong, High Elder, by the Council's choice and much against my own. Ask what you need to." },
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
        { text = "Why did we leave Skywall?", next = "skywall", when = { race = "Skyborne" } },
        { text = "Who are the Skyborne?", next = "who", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Why do the two orders quarrel?", next = "orders" },
        { text = "What became of the Shal'nan?", next = "shalnan" },
        { text = "How does the Council of Elders work?", next = "council" },
        { text = "I'm one of the few druids among us.", next = "druid", when = { race = "Skyborne", class = "DRUID" } },
        { text = "The High Order sent me to the Kirin Tor's mages.", next = "mage", when = { race = "Skyborne", class = "MAGE" } },
        { text = "I've passed the Windshaper trials.", next = "shaman", when = { race = "Skyborne", class = "SHAMAN" } },
        { text = "I trained with the Peacekeepers. Where am I needed?", next = "warrior_ta", when = { race = "Skyborne", class = "WARRIOR" } },
        { text = "I ranged with the hunters of Thendal Grove.", next = "hunter_ta", when = { race = "Skyborne", class = "HUNTER" } },
        { text = "I work quietly, Elder. Is there a place for that?", next = "rogue_ta", when = { race = "Skyborne", class = "ROGUE" } },
        { text = "Winds be with you, Elder.", next = "END" },
      },
    },
    skywall = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "Our patrons vanished, the pylons failed and the islands drifted. Then the Al'Aketh lit a beacon for the Windlord's faithful, and Rohash threatened to tell him where we were." },
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
        { id = "al_default", text = "Ansirem Runeweaver of the Kirin Tor, and Muln Earthfury of the Earthen Ring, helped us break Lorthuna's forces when it mattered. Remember their names, child, for we owe them both, and we haven't finished paying." },
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
        { text = "What do you truly fear, Elder?", tag = "Persuade", next = "orders_fear",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Skyborne" }, { trait = "kind" } } } },
          fail = { next = "orders_council", fx = { affinity = -1 } } },
      },
    },
    leaders = {
      lines = {
        { id = "le_default", text = "Elaadrin Evengale leads the High Order from the Sky Enclave in Dalaran, under the Kirin Tor, and Ayessa Dawnsinger leads the Windshapers from Camp Gev'rek in Mulgore. I've told them both the same thing, which is that I'd like them both alive in ten years." },
      },
      choices = {
        { text = "That seems a modest hope.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 }, learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    shalnan = {
      lines = {
        { id = "sh_default", text = "The Shal'nan was our first leader, until the seat was given up and the Shal'nan vanished along with the spirits. Where they went, nobody knows, which is why we have a Council." },
      },
      choices = {
        { text = "I hope they're found.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "shal_nan" } } },
      },
    },
    council = {
      lines = {
        { id = "c_default", text = "We elect it, and have since the Shal'nan gave up the seat, and the Council chose me to speak for it, which I did not ask for. Most of the work is listening to people who are frightened, and telling them the truth without making it worse." },
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
    al_aketh = { { id = "tp_aketh", text = "Grey robes, shaved heads, and worship for a Windlord our own patrons would hardly speak of. Ansirem Runeweaver and Muln Earthfury helped us break them once. Once may not be enough." } },
    two_orders = { { id = "tp_orders", text = "Two roads out of the same house. I'd like them both to come home for dinner, someday." } },
    shal_nan = { { id = "tp_shalnan", text = "Gone with the spirits, and if you hear anything, anything at all, you bring it to me first." } },
    windstones = { { id = "tp_windstones", text = "They light our lamps and fill our purses. When they fail, I suspect we'll learn which mattered more." } },
    _none = { { id = "tp_none", text = "The Council has many questions and fewer answers, and that's one of the many." } },
  },
}
