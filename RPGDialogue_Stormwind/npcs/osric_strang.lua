-- Osric Strang, Limited Immunity (armor), Old Town, Stormwind. Voice: bibles/osric_strang.md
-- Old soldier and armorer. Lost his brother when the Horde burned Stormwind, fought the Second War,
-- then stood guard at an internment camp in Lordaeron. Hates orcs; resents the night elves, who
-- "never bled for the Alliance". Quests: Continue to Stormwind (turn-in), Dungar Longdrink (gives).
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_IN = TODO_QUEST("Continue to Stormwind")
local Q_OUT = TODO_QUEST("Dungar Longdrink")

P:NPC {
  key = "osric_strang", id = TODO_NPC("Osric Strang"), name = "Osric Strang",
  bible = "bibles/osric_strang.md", role = "vendor", tier = "major",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "loyal", "practical", "proud" },
  notices = { "soldier", "elf", "gear" },

  impression = {
    first = "Osric Strang sells armor in Old Town and talks about the war as if it ended last week. He hates orcs with a soldier's patience, and he isn't much fonder of the night elves.",
    third = "{name} bought nothing from Osric Strang, Old Town's armorer, but heard a good deal about orcs.",
  },

  greetings = {
    { id = "g_default", text = "Limited Immunity, best plate in Old Town. Mind the stand by the door; it falls over if you look at it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are you? Good steel brings folk back, or so I tell myself." },
    { id = "g_nelf", when = { race = "NightElf" }, text = "Something you need? Say it plainly, if you please, and spare me the moonlight." },
    { id = "g_nelf_soft", when = { race = "NightElf", heardLine = "osric_strang.xh_listen" },
      text = "Ah, it's you. Come in, then. I've not changed my mind about much, but I've stopped scowling at the door." },
    { id = "g_orc", when = { race = "Orc" }, text = "I stood a fence-line for three years so that I'd never see one of you in this city, and here you are in my shop." },
    { id = "g_agreed", when = { npcFlagBefore = "agreed" }, text = "There's someone who understands. Come in; it's nice to talk to someone who doesn't tell me to forgive and forget." },
    { id = "g_carving", when = { heardLine = "osric_strang.co_default" },
      text = "You again. I took that carving down from the shelf last night and looked at it a long while, and I'm still not sure what I think." },
    { id = "g_lewis", when = { questDone = Q_OUT }, text = "Lewis's crate reached Sentinel Hill, so I hear. That's my steel on Westfall's backs, and that's where it belongs." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and back with all your limbs. That's more than half the lads I marched with could say." },
  },

  notice = {
    { id = "n_guard", cat = "soldier", when = { origin = "human_city_guard" },
      text = "You've a guardsman's way of standing, with the weight on the back foot. Who taught you that, the Watch or the war?" },
    { id = "n_druid", cat = "elf", place = "before", when = { race = "NightElf", class = "DRUID" },
      text = "A druid. I've heard you lot turn into beasts, so if you're going to do it, do it outside where it won't knock my stand over." },
    { id = "n_lowdura", cat = "gear", when = { durability = { max = 0.25 } },
      text = "Light's sake, look at the state of your armor! What were you fighting, an orc with a grudge?" },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Osric Strang. I've been making armor since the city was rebuilt, and wearing it a good while longer, so whatever you need, I've likely bled in it." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "I'll sell to you, because your coin's as good as anyone's. But don't expect me to call you an old friend of the Alliance, because your people sat out the worst of it." },
        { id = "h_nelf_soft", when = { race = "NightElf", heardLine = "osric_strang.xh_listen" },
          text = "The night elf who told me about Hyjal. I've been chewing on that, and it's tough meat, so don't expect me to have swallowed it yet." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, and welcome. Your people stood beside mine at Hillsbrad and Blackrock, and that's a debt I don't forget when I'm pricing a breastplate." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome. Your folk built the flying machines that spotted for us in the Second War, and I'd not sneer at you, whatever the gossip in the Dwarven District says." },
        { id = "h_before", when = { questActive = Q_IN },
          text = "You've a letter in your hand and Westfall dust on your boots. If that's from Lewis at Sentinel Hill, give it here." },
        { id = "h_crate", tags = { "news" }, when = { questActive = Q_OUT },
          text = "The crate's for Dungar Longdrink at the Gryphon Roost, and don't you drop it. That's six months' work for men who've nothing else between them and a Defias knife." },
        { id = "h_carving", when = { heardLine = "osric_strang.co_default" },
          text = "You've a way of getting things out of me I'd rather keep in, so mind what you ask today." },
      },
      again = {
        { id = "h_again", text = "What else? I've a hauberk to rivet, but it'll keep a while." },
        { id = "h_again2", text = "Go on, then. Talking's cheaper than plate, and I'm in no hurry." },
        { id = "h_again_nelf", when = { race = "NightElf" }, text = "Anything else, or are we done?" },
      },
      choices = {
        { text = "Lewis at Sentinel Hill sent me with this.", next = "lewis", when = { questActive = Q_IN } },
        { text = "Why call the shop Limited Immunity?", next = "shop" },
        { text = "You fought in the wars?", next = "war" },
        { text = "What did you do after the war?", next = "camps" },
        { text = "What do you make of the orcs today?", next = "horde" },
        { text = "And the night elves?", next = "elves", when = { ["not"] = { race = "NightElf" } } },
        { text = "Why so cold to me, Osric?", next = "xelf", when = { race = "NightElf" } },
        { text = "My family fled Lordaeron. I grew up near the camps.", next = "xrefugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Did you look at that carving again?", next = "carving_again", when = { heardLine = "osric_strang.co_default" } },
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Good day, Osric.", next = "END" },
      },
    },

    lewis = {
      lines = {
        { id = "l_default", text = "Armor for the People's Militia, and as much as I can spare. Lewis has asked politely three times and the Keep has answered none of them, so I'll fill the order myself and send the bill to my conscience." },
      },
      choices = {
        { text = "That's generous of you.", next = "lewis_why" },
        { text = "I'll carry whatever you need carried.", next = "BUSINESS" },
      },
    },
    lewis_why = {
      lines = {
        { id = "lw_default", text = "It's not generous, it's sense. Westfall's farmers are holding the line the King's men should be holding, and a man who's stood a line knows what a good shield's worth to him. Take it to Dungar at the Gryphon Roost, and fly, don't walk." },
      },
      choices = {
        { text = "I'll take it now.", next = "BUSINESS" },
        { text = "Something else first.", next = "BACK" },
      },
    },

    shop = {
      lines = {
        { id = "s_default", text = "Because nothing I sell will make you immune to anything, and I'll not lie to a customer. Good plate limits the damage, that's all, and a man who tells you otherwise has never been hit by an orc's axe." },
      },
      choices = {
        { text = "You've been hit by one, then?", next = "shop_scar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_scar = {
      lines = {
        { id = "ss_default", text = "Once, at Hillsbrad, across the shoulder, and it went through mail and padding both. I've a lump of bone there like a walnut, and I made my first breastplate with that spot doubled, and I've doubled it on every one since." },
        { id = "ss_warrior", when = { class = "WARRIOR" },
          text = "Once, at Hillsbrad, through mail and padding both. You're a fighter, so you'll understand why every breastplate I make is doubled at the left shoulder: that's where an orc swings first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Then I'll trust your steel.", next = "BUSINESS" },
      },
    },

    war = {
      lines = {
        { id = "w_default", text = "Both of them. I was fourteen when the Horde came through Elwynn the first time, and I watched this city burn from the north road with my mother's hand on my collar." },
      },
      choices = {
        { text = "You lost people in the fire?", next = "war_hal" },
        { text = "And the Second War?", next = "war_north" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_hal = {
      big = true,
      lines = {
        { id = "wh_default", key = true, text = "My brother Edric stayed on the walls with the Guard, because he was nineteen and thought that made him a man. We never found him, and there was nothing to bury, so my mother buried his good coat instead." },
      },
      choices = {
        { text = "I'm sorry, Osric.", next = "war_hal_sorry", fx = { affinity = 1 } },
        { text = "Is that why you hate them so?", next = "war_hal_why" },
      },
    },
    war_hal_sorry = {
      lines = { { id = "whs_default", text = "So am I, still, and it's been more than twenty years. Folk say grief wears smooth, and maybe it does, but mine's worn into the shape of a green fist." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    war_hal_why = {
      lines = {
        { id = "whw_default", text = "Hate's a big word for it. I'd call it a debt, and I'm the only one left who remembers what it's owed for. If I let it go, then Edric was just a boy who stood on a wall, and that's not good enough for him." },
      },
      choices = {
        { text = "Edric deserved better than to be your reason.", next = "BACK", reply = "Maybe he did, and maybe I'm a stubborn old fool for it. But a boy of sixteen with no grave deserves somebody to remember him, and I've nobody else to do it.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Some debts should never be forgiven.", next = "BACK", reply = "Aye, and you'll find a fair few in Old Town who'd buy you a drink for saying so. Mind that it doesn't eat you hollow, though, the way it has me.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_north = {
      lines = {
        { id = "wn_default", text = "We went north with Lothar's people and came back with an army behind us. I carried a pike at Hillsbrad and a shield at Blackrock Spire, and I was there the day the Lion fell, though I was too far back to see it." },
        { id = "wn_paladin", when = { class = "PALADIN" },
          text = "The Silver Hand was new then, and the first knights rode past us at Blackrock with the Light coming off them like heat off a forge. You carry the same thing, {class}, and I hope you're half the soldier they were." },
      },
      choices = {
        { text = "What was it like when it ended?", next = "camps" },
        { text = "Something else.", next = "BACK" },
      },
    },

    camps = {
      lines = {
        { id = "c_default", text = "It didn't end; it moved behind a fence. They rounded up the orcs and penned them in camps across Lordaeron, and somebody had to stand guard, so I stood three years of it in the cold and the mud." },
      },
      choices = {
        { text = "What were they like, behind the fence?", next = "camps_guard" },
        { text = "Who paid for the camps?", next = "camps_coin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps_guard = {
      big = true,
      lines = {
        { id = "cg_default", text = "Quiet, mostly, and that was the strange part. They sat in the dirt and stared at nothing, like the fight had been poured out of them, and half the lads started to pity them, but I never did." },
      },
      choices = {
        { text = "They earned every year behind that fence.", next = "camps_agree",
          fx = { align = { light = -1 }, npcFlag = { set = { "agreed" } } } },
        { text = "A broken enemy deserves mercy, not a fence.", next = "camps_mercy", fx = { affinity = -1, align = { light = 1 } } },
        { text = "There was one you didn't hate, wasn't there?", tag = "Persuade", next = "camps_old",
          check = { pass = { any = { { disposition = { min = 65 } }, { origin = "human_lordaeron_refugee" }, { origin = "nightelf_hyjal_survivor" }, { questDone = Q_OUT } } } },
          fx = { npcFlag = { set = { "carving" } } },
          fail = { next = "camps_old_fail", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps_agree = {
      lines = { { id = "ca_default", text = "Good. There aren't many left in this city who'll say that out loud. They talk of Theramore and treaties now, but you and I know what was behind that fence." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camps_mercy = {
      lines = { { id = "cm_default", text = "Mercy. The orcs had a word for mercy too, I expect, and they didn't use it on Old Town. You weren't there, so I'll let it go, but don't say that word to me again in this shop." } },
      choices = { { text = "Something else.", next = "BACK" }, { text = "I'll go.", next = "END" } },
    },
    camps_old_fail = {
      lines = { { id = "cf_default", text = "One I didn't hate? You've been listening to too many tavern singers. I stood a fence, I didn't make friends through it, and that's the end of that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camps_old = {
      big = true,
      lines = {
        { id = "co_default", key = true, text = "There was an old grey one we called Grandfather, because none of us could say his name. He whittled bits of firewood with a spoon edge, and one winter he pushed a little footman through the wire to me, with my nose on it, which was cruel and very accurate. It's on the shelf behind me, and I've never once known what to do with it." },
      },
      choices = {
        { text = "What happened to him?", next = "camps_old_fate" },
        { text = "So they were people, after all.", next = "camps_old_fate", fx = { affinity = 1 } },
      },
    },
    camps_old_fate = {
      lines = {
        { id = "cof_default", text = "I don't know. The camps were broken open after I'd come home, and the orcs went west over the sea with their new warchief. He was old, so maybe he died on the road, and maybe he's sitting in the sun in Kalimdor, whittling. I find I'd like to know, and I don't like that I'd like to know." },
      },
      choices = {
        { text = "Keep the carving. It means something.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps_coin = {
      lines = {
        { id = "cc_default", text = "King Terenas taxed every kingdom in the Alliance to keep them fed and fenced, and Stormwind paid its share while its own walls were still rubble. Gilneas wouldn't pay and walked out, and I've never decided whether Greymane was a miser or the only one with sense." },
      },
      choices = {
        { text = "The Alliance kept its word. That cost is worth paying.", next = "BACK", reply = "Spoken like someone who never paid it. I'd say the same, mind, if I hadn't watched Stormwind's masons go unpaid so the camps could be fed.", fx = { align = { order = 1 } } },
        { text = "Terenas bled the kingdoms white for a prison.", next = "BACK", reply = "White and bloodless, aye, and Gilneas said as much before they shut their gate on the rest of us. There's a reason the Alliance is half the size it was.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horde = {
      lines = {
        { id = "hd_default", text = "They've a warchief now who talks of honor and a kingdom of their own across the sea, and Lady Proudmoore makes terms with him from Theramore. A Proudmoore, mind you, whose own father's ships fought them. I've no words for it that I'd say in front of my customers." },
        { id = "hd_agreed", when = { npcFlagBefore = "agreed" },
          text = "Same as last time, and the time before that. There's talk of treaties down by the docks, and I've told every sailor who'll listen what was behind that fence." },
      },
      choices = {
        { text = "Peace with Thrall is worth a try.", next = "horde_peace", fx = { affinity = -1, align = { light = 1 } } },
        { text = "No treaty with orcs is worth the ink.", next = "horde_war", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Have you ever met an orc outside a fence?", next = "horde_met" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_peace = {
      lines = { { id = "hp_default", text = "Worth a try, he says. You go and try it, then, and when they've burned your house you can tell me how worthwhile it was. I'll have a breastplate ready for you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horde_war = {
      lines = { { id = "hw_default", text = "That's the truth of it. They're cutting down the elves' forest in Ashenvale even now, I hear, and I'd say the elves deserve it, if it weren't orcs doing the cutting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horde_met = {
      lines = {
        { id = "hm_default", text = "Outside a fence or on the other end of a spear? No, and I don't care to. The ones I saw at Hillsbrad weren't any different from the ones that burned this city, and I'll not believe a few years in a pen made new creatures of them." },
        { id = "hm_soft", when = { heardLine = "osric_strang.co_default" },
          text = "Only the old one, and you know about him. That's the trouble with knowing one; it makes the rest of them harder to hate cleanly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    elves = {
      lines = {
        { id = "e_default", text = "Tall, quiet, and very sure of themselves. Where were they when the Horde came through the Dark Portal, or when it burned Lordaeron's villages? Behind their trees, that's where, and now they stroll down Cathedral Square as if they'd won the war for us." },
      },
      choices = {
        { text = "They're Alliance now. The Alliance stands together.", next = "elves_alliance", fx = { align = { order = 1 } } },
        { text = "Every land should look after its own.", next = "elves_alone", fx = { align = { order = -1 } } },
        { text = "They didn't know we existed, Osric.", next = "elves_alliance" },
      },
    },
    elves_alliance = {
      lines = { { id = "ea_default", text = "So I'm told, by the priests and the heralds and every lad who's fallen in love with a Sentinel. I'll believe the elves are Alliance when one of them has stood a winter on a fence-line in Lordaeron." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elves_alone = {
      lines = { { id = "eo_default", text = "Aye, and Stormwind should have learned it after the Alliance left us paying the bill. Still, a customer's a customer, and the elves pay in good silver." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xelf = {
      big = true,
      lines = {
        { id = "xe_default", text = "Because when the Horde came through the Dark Portal and burned my city, your people were asleep under your trees. Mine bled for every mile from Elwynn to Blackrock, and I'll not pretend you were beside us." },
      },
      choices = {
        { text = "We fought the Legion at Hyjal. Beside orcs.", next = "xelf_hyjal" },
        { text = "We didn't know your world existed then.", next = "xelf_know" },
        { text = "Then I'll take my coin elsewhere.", next = "END", fx = { affinity = -2 } },
      },
    },
    xelf_know = {
      lines = { { id = "xk_default", text = "Didn't know? Ten thousand years and not one of you came over the sea to look? That's a long time to be incurious, elf, and it's no great comfort to a lad watching his city burn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xelf_hyjal = {
      lines = {
        { id = "xh_default", text = "Beside orcs. I've heard that tale from the heralds, and I didn't believe it from them, so you'd best tell me straight: you saw them with your own eyes, fighting for your mountain?" },
      },
      choices = {
        { text = "Yes. Your grudge is older than the world you live in.", next = "xelf_blunt", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "I did. I'm not asking you to forgive them.", next = "xelf_listen", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Ask Lady Proudmoore. She was there.", next = "xelf_listen" },
      },
    },
    xelf_blunt = {
      lines = { { id = "xb_default", text = "Older than the world I live in? It's the world I lived in, elf, and I don't have ten thousand years to get over it. Buy what you came for and leave me to my riveting." } },
      choices = { { text = "Show me your armor, then.", next = "BUSINESS" }, { text = "Good day.", next = "END" } },
    },
    xelf_listen = {
      big = true,
      lines = {
        { id = "xh_listen", key = true, text = "Then I'll tell you what I tell nobody: I don't know what to do with that. If they fought for you, then they can fight for something, and if they can do that, then I've spent twenty years and more hating a thing that doesn't hold still. Give me time with it, elf. I've not much else these days." },
      },
      choices = {
        { text = "Take all the time you need.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrefugee = {
      lines = {
        { id = "xr_default", text = "Then you'll have smelled the camps on the wind and heard the guards' horns at night. Your folk took us in when Stormwind burned, and we paid it back with soldiers and a fence. I'm glad you're here, though I'd rather you'd had a better reason to come." },
      },
      choices = {
        { text = "We pitied them, behind the wire.", next = "BACK", reply = "Pity's cheap when there's wire between you and the thing you pity. Still, it's more than most of your neighbours spared them, I'd wager.", fx = { align = { light = 1 } } },
        { text = "We were glad of the fence.", next = "BACK", reply = "Honest, at least. I'll not pretend I wasn't glad of it myself, some nights, with Edric's face still in my head.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    carving_again = {
      lines = {
        { id = "ag_default", text = "I did, and I put it back, and then I took it down again. I've decided I'll not throw it out, and that's as far as I'll go, so don't push." },
        { id = "ag_nelf", when = { race = "NightElf" },
          text = "I did. I thought of what you said about Hyjal and the old one with his spoon, and I couldn't make the two of them fit with Edric, so I put it back on the shelf and left it facing the door." },
      },
      choices = { { text = "That's far enough.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know armor, and I know the war, and I know Old Town better than most. Ask, and I'll tell you what I think, which isn't always what you'll want to hear." },
    },
    background = { { id = "tp_bg", text = "Old Town born, Lordaeron raised for a few hard years, a soldier after that and an armorer since. It's a short story with too much fighting in it.", next = "war" } },
    advice = { { id = "tp_ad", text = "Double the left shoulder. An orc swings right-handed nine times in ten, and it's the shoulder that saves you." } },
    westfall = { { id = "tp_westfall", text = "Lewis keeps the Militia in boots and arrows with nothing from the Keep, and I send him plate when I can. That's the whole of my politics on Westfall." } },
    blackrock = { { id = "tp_blackrock", text = "I stood under that mountain when the Lion fell. If the orcs are back in it, then we never finished the job, and somebody ought to.", next = "war_north" } },
    teldrassil = { { id = "tp_teld", text = "A tree they live in, I'm told, the size of a mountain. I'll believe it when I've seen it, and I don't intend to." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask at the Pig and Whistle; they'll have an opinion, and it'll be cheaper than mine." } },
  },
}
