-- Missed Orgrimmar folk, part two: the Valley of Honor. The smiths of the Burning Anvil (Krathok Moltenfist,
-- Aturk the Anvil, Borgosh Corebender, Kelgruk Bloodaxe) and the valley's traders (Gorina, Koru, Kiro).
-- Voices: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Aturk the Anvil: grumpy armorsmith who misses the old wars.
P:NPC {
  key = "aturk", id = TODO_NPC("Aturk the Anvil"), name = "Aturk the Anvil", gender = "male",
  bible = "bibles/missed_a.md", role = "armorsmith", tier = "quest",
  communities = { "orgrimmar" }, temper = { "grumpy", "blunt" }, values = { "tradition", "loyal" },
  notices = { "craft", "class" },
  impression = {
    first = "Aturk the Anvil hammers plate in the Valley of Honor and grumbles in time with the strokes. He thinks the old days of war were better than these, he thinks the Warchief's peace is a strange thing, and he obeys the Warchief all the same.",
    third = "{name} met Aturk the Anvil, a gruff armorsmith who misses the old wars and follows Thrall regardless.",
  },
  greetings = {
    { id = "g_default", text = "Hmph. Another one come to stand in my light. Say what you want, {class}, and do not expect me to stop hammering for it." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, are you? The plate is no closer to finished for your asking." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Old Ways") }, text = "The armorsmith returns. Your work was not shameful, and that is as much praise as you will get out of me today." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You have a smith's forearms, at least. In my day that meant you had made armor for a war, and not buckles for a market." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_active", when = { questActive = TODO_QUEST("The Old Ways") }, text = "Where is the armor I asked of you? An armorsmith of the old kind would have had it stacked at my feet by now, and he would not have stopped to chat." },
        { id = "h_default", text = "They call me Aturk the Anvil, because I have been struck more times than one and I have not cracked. I make armor the way it was made when the clans marched to war, which is to say properly." },
      },
      again = {
        { id = "h_again", text = "What now? Out with it." },
        { id = "h_again2", text = "Hmph. Ask, then, since you will ask anyway." },
      },
      choices = {
        { text = "I want to prove myself as an armorsmith.", next = "BUSINESS", when = { profession = "Blacksmithing" } },
        { text = "You miss the old days.", next = "old" },
        { text = "What makes armor proper?", next = "proper" },
        { text = "Who else works these forges?", next = "forges" },
        { text = "You'd make peace with no one, then?", next = "xstance" },
        { text = "What was the hardest armor you ever made?", next = "xhardest" },
        { text = "I wear plate as an orc should.", when = { race = "Orc", class = { "WARRIOR", "PALADIN" } }, next = "xorc" },
        { text = "I'll leave you to your grumbling.", next = "END" },
      },
    },
    old = {
      lines = { { id = "o_default", text = "I do, and I am not ashamed to say so. There was always a war then, and a smith knew what his work was for, because he saw it march out in the morning and come back dented at night." } },
      choices = {
        { text = "And the Warchief's peace between the clans?", next = "peace" },
        { text = "Those old days ended in the camps.", next = "camps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = { { id = "p_default", text = "I never thought to see Warsong and Frostwolf and Blackrock exiles share one city without a blade drawn, and I still do not understand it. But Thrall is Warchief and he broke our chains, so I hold my tongue and hammer what he asks." } },
      choices = {
        { text = "You don't hold it very well.", next = "tongue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tongue = {
      lines = { { id = "t_default", text = "Ha! No, I do not, and Krathok tells me so every day. An old orc is allowed to complain so long as he obeys, and I have never once failed to obey." } },
      choices = { { text = "Another matter.", next = "BACK", fx = { affinity = 1 } } },
    },
    camps = {
      lines = { { id = "c_default", text = "They did, and you need not remind me, because I sat in one with nothing to hammer for years. That is a thing the demon's blood did to us and not the war itself, though I grant you it is hard to pull the two apart.", fx = { learn = { "internment" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    proper = {
      lines = {
        { id = "pr_warrior", when = { class = "WARRIOR" }, text = "You wear it, warrior, so you know already. It is plate that turns the blow you did not see coming, and it is heavy, because anything light enough to be comfortable is light enough to be cut through." },
        { id = "pr_default", text = "It is thick where the blow lands and it bends before it breaks. The young smiths chase ornament and call it craft, but ornament never stopped a dwarf's hammer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forges = {
      lines = { { id = "f_default", text = "Krathok judges, Okothos teaches armor, and Borgosh and Kelgruk make weapons and think that makes them the important ones. A weapon wins a fight, I tell them, but armor is why you are alive to have the next one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xstance = {
      lines = {
        { id = "xstance_default", text = "With nobody who has not earned it. The Warchief talks with tauren and Forsaken and even humans at Theramore, and perhaps he is wise, but I remember who burned the clans' homes." },
      },
      choices = {
        { text = "The old hatreds kept us in chains. Let them go.", next = "BACK", reply = "Hmph. You sound like the Warchief, and I cannot argue with him either.", fx = { align = { light = 1 } } },
        { text = "Never forget who wronged us. Keep the hatred sharp.", next = "BACK", reply = "Now that is an orc talking. Keep it sharp, but keep it sheathed in this city.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhardest = {
      lines = {
        { id = "xhardest_default", text = "A breastplate for a Blackrock captain before the Dark Portal, so heavy two peons carried it. He died in it anyway, at Hillsbrad, because a knight found the one strap I had made too thin." },
      },
      choices = {
        { text = "You still blame yourself.", next = "xblame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xblame = {
      lines = {
        { id = "xblame_default", text = "I blame the strap, and I made the strap. That is why every strap I make now is too thick, and the young smiths laugh, and none of their customers have died of a strap yet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = {
        { id = "xorc_default", text = "Good. Then you know plate is not for hiding in. It is for walking forward while the enemy wastes his blows on you, and I will make it so for as long as these arms work." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have made armor for three wars and sat idle through one captivity. I know which I preferred." } },
    internment = { { id = "tp_int", text = "The humans penned us like cattle, and we let them, because the fire had gone out of us. I do not like to speak of it." } },
    second_war = { { id = "tp_x_second_war", text = "I armored the Horde for the Second War, and we lost it anyway. Armor holds the blow, not the war." } },
    blackrock = { { id = "tp_x_blackrock", text = "My old clan, before the camps. I do not speak well of what it became under that fool on the mountain." } },
    _none = { { id = "tp_none", text = "Hmph. I know armor and I know complaining, and that is neither." } },
  },
}

-- Kelgruk Bloodaxe: weapon crafter beside Borgosh.
P:NPC {
  key = "kelgruk", id = TODO_NPC("Kelgruk Bloodaxe"), name = "Kelgruk Bloodaxe", gender = "male",
  bible = "bibles/missed_a.md", role = "weapon crafter", tier = "service",
  communities = { "orgrimmar" }, temper = { "steady", "dry" }, values = { "craft", "practical" },
  notices = { "craft", "class" },
  impression = {
    first = "Kelgruk Bloodaxe turns out axe-heads in the Valley of Honor, one after another, each the same as the last. Borgosh dreams aloud at the next fire, and Kelgruk listens and keeps the grunts armed in the meantime.",
    third = "{name} met Kelgruk Bloodaxe, a weapon crafter at the forges of the Valley of Honor.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Throm-ka, friend. Tell me what you want made, and I'll give it my best steel." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Throm-ka, {class}. If you want a weapon made, speak up. I'll make it, but I won't enjoy it." },
    { id = "g_default", text = "Throm-ka, {class}. If you want a weapon made, speak up over the hammer." },
    { id = "g_back", when = { metBefore = true }, text = "You again. That makes forty axe-heads since you were last here, if you were wondering." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A fellow smith. Good, then I will not have to explain why I cannot stop in the middle of a heat." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "Kelgruk Bloodaxe. If you have chosen the weaponsmith's road, then I have a thing or two to show you once Borgosh has had his say, and I will take less time about it." },
        { id = "h_default", text = "I am Kelgruk Bloodaxe, and I make weapons, as my name ought to tell you. Somebody has to forge the hundred plain axes the Horde needs today, and I do not mind that it is me." },
      },
      again = {
        { id = "h_again", text = "Something more? I can talk through one more heat." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Show me what you can teach.", next = "BUSINESS", when = { profession = "Blacksmithing" } },
        { text = "A hundred plain axes sounds like dull work.", next = "plain" },
        { text = "What do you make of Borgosh's dream?", next = "borgosh" },
        { text = "How many axes do you make in a day?", next = "xcount" },
        { text = "Is a weaponsmith's work honourable?", next = "xhonor" },
        { text = "A shaman needs a weapon too. What would you give me?", when = { class = "SHAMAN" }, next = "xshaman" },
        { text = "Good forging, Kelgruk.", next = "END" },
      },
    },
    plain = {
      lines = { { id = "p_default", text = "It is honest work, and there is a difference. A grunt in the Barrens does not need a legend in his hand; he needs an axe that will not shed its head the third time it meets a quilboar's skull." } },
      choices = {
        { text = "Do you never want to make something grand?", next = "grand" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grand = {
      lines = {
        { id = "g_warrior", when = { class = "WARRIOR" }, text = "Now and then, for a warrior who has earned it, and I enjoy those days. But you of all people know that the weapon you trust is the one that has never surprised you." },
        { id = "grand_default", text = "Now and then I do, when a champion asks and brings the metal for it. Then I go back to the plain axes, and I find I have not missed anything." },
      },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    borgosh = {
      lines = { { id = "b_default", text = "I think he will do it, though not soon, and I would not say so where he can hear. An orc who wants to make one perfect thing is good to have at the next fire, because his failures are still better than most smiths' best." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcount = {
      lines = {
        { id = "xcount_default", text = "Twelve, on a good day, if the ore is clean and the bellows boy shows up. Each goes to a grunt somewhere on the walls, and I like to think a few of them are still in use." },
      },
      choices = {
        { text = "Where does the ore come from?", next = "xore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xore = {
      lines = {
        { id = "xore_default", text = "Gorina's miners bring it from the hills around Durotar and from the Barrens, and some comes from Ashenvale when the Warsong send it home. Good ore makes an honest axe, and bad ore makes a dead grunt." },
      },
      choices = {
        { text = "Then the miners deserve the same honour as the smiths.", next = "BACK", reply = "Say that to Borgosh, and watch him choke on his ale.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhonor = {
      lines = {
        { id = "xhonor_default", text = "Some say a smith who never swings his own axe has no honour in the fight. I say the smith fights every fight his axes go to. Which way do you see it?" },
      },
      choices = {
        { text = "Honour belongs to the one who swings the axe.", next = "BACK", reply = "Hmph. Then I will keep forging, and you can keep the honour.", fx = { align = { honor = 1 } } },
        { text = "Honour is in the work, whatever the work is.", next = "BACK", reply = "That is the truest thing anyone has said at this fire in a month.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "xshaman_default", text = "A mace or an axe with a good haft, light enough to swing while you call the storm. Koru sells maces nearby, and his are not bad, though do not tell him I said so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My kin have carried axes for as long as anyone remembers. I am the first who would sooner make them than swing them." } },
    advice = { { id = "tp_x_advice", text = "Check the haft before the edge. An edge can be sharpened, but a cracked haft breaks when you need it most." } },
    _none = { { id = "tp_none", text = "I could not tell you. Krathok has an opinion on most things and the rank to voice it, so ask him." } },
  },
}

-- Gorina: mining supplies in the Valley of Honor.
P:NPC {
  key = "gorina", id = TODO_NPC("Gorina"), name = "Gorina", title = "Mining Supplies", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk", "plain" }, values = { "practical", "thrifty" },
  notices = { "profession", "purse" },
  impression = {
    first = "Gorina sells picks and supplies to the miners of the Valley of Honor, and she tests the weight of each pick in her own hand before it goes on the rack. She has no patience for anyone who would haggle over a tool their life might hang on.",
    third = "{name} met Gorina, who sells mining supplies in the Valley of Honor.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "A pick for a friend? I've the best ones put aside. Take your pick, so to speak." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "If you want a pick, you've come to the right place. Pay first." },
    { id = "g_default", text = "If you want a pick, {class}, you have come to the right orc. If you want anything else, you have come to the wrong valley." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Either you found a good vein or you broke something." },
  },
  notice = {
    { id = "n_miner", cat = "profession", when = { profession = "Mining" },
      text = "There is rock dust in the seams of your gloves, miner. Makaru has trained you well enough to get dirty, at least." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Gorina, and I sell what a miner needs to bring ore out of the ground. Makaru teaches the digging next to me, and every forge in this valley eats what the two of us send out into the hills." },
      },
      again = {
        { id = "h_again", text = "Anything else? The picks will not sell themselves." },
        { id = "h_again2", text = "Ask, {class}." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What makes a good mining pick?", next = "pick" },
        { text = "Where does Orgrimmar's ore come from?", next = "ore" },
        { text = "Is mining honest work for an orc?", next = "xhonest" },
        { text = "You were a miner yourself?", next = "xpast" },
        { text = "I'm a miner. Any rich veins nearby?", when = { profession = "Mining" }, next = "xveins" },
        { text = "Good trading, Gorina.", next = "END" },
      },
    },
    pick = {
      lines = {
        { id = "p_miner", when = { profession = "Mining" }, text = "You know the answer already, miner, if your arms ache in the right places. The head must be heavy and the haft must have some give, because a stiff pick sends every blow back up into your shoulder." },
        { id = "p_default", text = "A good pick has a heavy head and a haft with some give in it, and a point you can dress again when it dulls. A cheap pick breaks at the bottom of a shaft, and that is a long way to climb for another." },
      },
      choices = {
        { text = "Has that happened to you?", next = "broke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    broke = {
      lines = { { id = "b_default", text = "Once, when I was young and thought a copper saved was a copper earned. I dug the rest of that vein with the broken head held in my fist, and I have not sold a bad pick since." } },
      choices = { { text = "A hard lesson. Something else.", next = "BACK" } },
    },
    ore = {
      lines = { { id = "o_default", text = "Copper comes from Durotar's own hills, and tin and iron from the Barrens and farther off. The smiths here would burn through a mountain in a season if the miners could carry it to them, so nobody with a pick goes hungry in this city." } },
      choices = {
        { text = "The forges never stop, do they?", next = "forges" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forges = {
      lines = { { id = "f_default", text = "Not day or night. You get used to the hammers, and then you go somewhere quiet and find you cannot sleep for the lack of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhonest = {
      lines = {
        { id = "xhonest_default", text = "The most honest there is, because the rock does not lie and does not care who your grandfather was. Some warriors look down on us, though, and they forget where their axes come from." },
      },
      choices = {
        { text = "Every orc serves the Horde with what they have.", next = "BACK", reply = "So the Warchief says, and I think he means it.", fx = { align = { order = 1 } } },
        { text = "Let them look down. You owe them nothing.", next = "BACK", reply = "Ha! I like you, {class}. I owe them a pick to the knee, maybe.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpast = {
      lines = {
        { id = "xpast_default", text = "For twenty years, in the camps first, digging for human masters, and then for the Horde. The second kind of digging is better, though my back cannot tell the difference." },
      },
      choices = {
        { text = "You dug in the camps?", next = "xcamps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcamps = {
      lines = {
        { id = "xcamps_default", text = "The humans set us to quarrying when they could not think what else to do with us. I swore I would never lift a pick again when Thrall freed us, and I lasted three weeks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xveins = {
      lines = {
        { id = "xveins_default", text = "Copper and tin in the hills around Razor Hill and in the Barrens, and Silverpine has more if you travel. Beware the kobolds in the mines, and beware the Venture Company's men more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I mined before I sold, and I sell because my back asked me to. That is the whole of it." } },
    internment = { { id = "tp_x_internment", text = "I dug rock for human guards in the camps. Now I sell picks to free orcs, and I think that is a better trade." } },
    venture_company = { { id = "tp_x_venture_company", text = "Goblin miners who take a mountain apart and leave the bones. Do not let them see you near a good vein." } },
    _none = { { id = "tp_none", text = "I sell picks, {class}. For anything else, ask someone whose trade it is." } },
  },
}

-- Koru: maces and staves in the Valley of Honor.
P:NPC {
  key = "koru", id = TODO_NPC("Koru"), name = "Koru", title = "Mace & Staves Vendor", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff", "fair" }, values = { "strength", "practical" },
  notices = { "class", "kit" },
  impression = {
    first = "Koru sells maces and staves in the Valley of Honor, and he sizes up each customer's arm before he reaches for the rack. He has a warrior's respect for a mace and a puzzled tolerance for the staves, which sell just as well.",
    third = "{name} met Koru, who sells maces and staves in the Valley of Honor.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, friend. Maces on the left, staves on the right, and the best of both for you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Maces left, staves right. Pick one, pay for it, and move along." },
    { id = "g_default", text = "Maces on the left and staves on the right, {class}. Pick one up before you ask the price, because the hand knows before the head does." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Has the last one broken, or have you grown into something heavier?" },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "You will want the staves, I expect. I do not pretend to understand what your kind do with them, but I know good wood." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman can use either side of my shop, and that makes you my favorite kind of customer." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Koru. I sell maces for those who break bones and staves for those who break other things, and I stand behind both." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Speak, or try the weight of something while you think." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why a mace over an axe?", next = "mace" },
        { text = "You don't sound sure about the staves.", next = "staves" },
        { text = "Who buys the most from you?", next = "xbuyers" },
        { text = "Do you fight yourself?", next = "xfight" },
        { text = "A paladin's mace is holy work.", when = { class = "PALADIN" }, next = "xpaladin" },
        { text = "I'm a druid. Staves suit me.", when = { class = "DRUID" }, next = "xdruid" },
        { text = "Strength to you, Koru.", next = "END" },
      },
    },
    mace = {
      lines = {
        { id = "m_warrior", when = { class = "WARRIOR" }, text = "You have fought armored foes, warrior, so you know an axe skips off good plate. A mace does not care about plate, because it breaks what is underneath and leaves the armor for whoever wants it." },
        { id = "m_default", text = "An axe needs an edge, and an edge needs care. A mace needs only an arm, and it works as well on the hundredth blow as on the first." },
      },
      choices = {
        { text = "The smiths here mostly make axes.", next = "smiths" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths = {
      lines = { { id = "s_default", text = "They do, because orcs love an axe as a wolf loves meat. Kelgruk laughs at my maces, and then he sends me every customer who has dulled three of his blades on a dwarf's breastplate." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    staves = {
      lines = {
        { id = "st_caster", when = { class = { "MAGE", "WARLOCK", "PRIEST", "DRUID" } }, text = "I am sure of the wood, which is seasoned and straight and will not split. What you put into it afterwards is your own affair, and I have learned not to ask." },
        { id = "st_default", text = "I am sure of the wood and less sure of the customers. The trolls buy them and the Forsaken buy them, and they nod at things in the grain that I cannot see." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbuyers = {
      lines = {
        { id = "xbuyers_default", text = "Shamans and trolls, mostly, and the Forsaken priests who come in quiet and pay exact coin. The orc grunts want axes, and I have stopped arguing with them about it." },
      },
      choices = {
        { text = "Should a warrior choose the weapon or the clan's custom?", next = "xcustom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcustom = {
      lines = {
        { id = "xcustom_default", text = "My father carried a mace when every orc around him carried an axe, and the clan mocked him for it. What do you say, {class}?" },
      },
      choices = {
        { text = "Custom keeps the clan strong. Follow it.", next = "BACK", reply = "Then you would have mocked him too, and he would have broken your shield.", fx = { align = { order = 1 } } },
        { text = "Choose what works. Custom is for the elders.", next = "BACK", reply = "Ha! My father would have liked you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfight = {
      lines = {
        { id = "xfight_default", text = "I fought at Hyjal, with a mace I made myself, and it broke three demon skulls before it broke too. I keep the head of it under the counter to remind me what good work feels like." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpaladin = {
      lines = {
        { id = "xpaladin_default", text = "I do not know about holy, but I know a mace in the hand of someone who believes in it hits harder than one in the hand of someone who does not. Pick a heavy one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Then take one of the long ashwood staves at the back. I am told the druids like wood that has not forgotten the tree, whatever that means, and those are the freshest I have." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a mace for the Horde before I sold them. My arm is slower now, but it still knows a good one." } },
    burning_legion = { { id = "tp_x_burning_legion", text = "I fought them once at Hyjal, and a mace was the right tool. Demons have thick skulls." } },
    _none = { { id = "tp_none", text = "If it cannot be swung or leaned on, I do not sell it and I do not know it." } },
  },
}

-- Kiro: war harness maker, Kiro's Harnesses, Valley of Honor.
P:NPC {
  key = "kiro", id = TODO_NPC("Kiro"), name = "Kiro", title = "War Harness Maker", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "proud", "exacting" }, values = { "craft", "tradition" },
  notices = { "class", "race" },
  impression = {
    first = "Kiro makes war harnesses in her shop in the Valley of Honor, and she pulls on every strap twice before she lets it leave. To her a harness is what an orc wears when armor would only slow the killing, and she makes them to be seen.",
    third = "{name} met Kiro, the war harness maker of the Valley of Honor.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Come in, friend. You've the shoulders for my finest work, and I'll fit it properly." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Come in, {class}, and stand where I can see you. Then don't move until I'm done." },
    { id = "g_default", text = "Come in, {class}, and stand where I can see the width of your shoulders. A harness is cut to the wearer or it is worthless." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Turn around and let me see how the straps are wearing on you." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc who has not forgotten what a chest is for. Good, because too many of our young hide behind plate like humans." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "I will need more leather for you than for any two orcs, tauren, and I do not mind the challenge at all." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kiro, and this is Kiro's Harnesses. I make the war harness as our people wore it on the march, leather and buckle and nothing between your enemy and your scars but your own skill." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask. My hands can stitch while I listen." },
      },
      choices = {
        { text = "Show me your harnesses.", next = "BUSINESS" },
        { text = "Why wear a harness and not armor?", next = "why" },
        { text = "The smiths outside must disagree with you.", next = "smiths" },
        { text = "How long does a harness take to make?", next = "xlong" },
        { text = "Do you make harnesses for wolves too?", next = "xwolves" },
        { text = "I'm a leatherworker. Any advice?", when = { profession = "Leatherworking" }, next = "xlw" },
        { text = "Farewell, Kiro.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_warrior", when = { class = "WARRIOR" }, text = "Because a warrior in a harness moves as fast as his rage, and you know what that is worth. It also tells the enemy you do not expect to be hit, and half of them believe it." },
        { id = "w_default", text = "A harness carries your weapons and leaves your arms free, and it lets the enemy see what is coming for him. Our grandfathers took whole kingdoms dressed in little more." },
      },
      choices = {
        { text = "And the ones who did get hit?", next = "hit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hit = {
      lines = { { id = "h_default2", text = "They have scars, and they come back to me for a harness that shows them off. I have never had one complain, though I admit the ones with complaints may not have come back." } },
      choices = { { text = "That's honest. Something else.", next = "BACK" } },
    },
    smiths = {
      lines = { { id = "s_default", text = "Aturk the Anvil tells me I dress warriors for their funerals, and I tell him he dresses them as kettles. We have said it so often that I think we would both miss it." } },
      choices = {
        { text = "Where does your leather come from?", next = "leather" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather = {
      lines = { { id = "l_default", text = "It is kodo hide from the Barrens, mostly, cured by the leatherworkers down in the Drag. It is thick and it takes a buckle well, and it does not stretch when it is soaked in sweat or in worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlong = {
      lines = {
        { id = "xlong_default", text = "Three days for a plain one and a week for a fine one, if I am not interrupted, and I am always interrupted. Every strap is cut, oiled, stitched and tested on my own back before it goes out." },
      },
      choices = {
        { text = "On your own back?", next = "xback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xback = {
      lines = {
        { id = "xback_default", text = "If it does not fit me, I do not sell it, and if it fits me, I stretch it for the buyer. The young ones call it vanity, but I have never sold a harness that came undone in a fight." },
      },
      choices = {
        { text = "That's pride well earned.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwolves = {
      lines = {
        { id = "xwolves_default", text = "Saddles, no, that is the wolf riders' work, but I make the war straps the riders hang their axes from. A wolf does not care what his rider wears, though some riders think he does." },
      },
      choices = {
        { text = "Should a warrior care how he looks in battle?", next = "xlook" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlook = {
      lines = {
        { id = "xlook_default", text = "My mother said the enemy should see your scars and fear them, so she wore nothing to hide them. My sister says a warrior who dresses for show dies for show. What do you think?" },
      },
      choices = {
        { text = "Let the enemy see. Fear wins half the fight.", next = "BACK", reply = "My mother would have liked you, {class}.", fx = { align = { light = -1 } } },
        { text = "Fight to protect, not to frighten.", next = "BACK", reply = "My sister would have liked you, then, though she is no fun at all.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlw = {
      lines = {
        { id = "xlw_default", text = "Oil the leather before you cut it, not after, and never trust a buckle from a goblin. The rest you learn by ruining hides, and I ruined many." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My mother made harnesses and so did hers. The pattern is older than this city and older than our time on this world." } },
    advice = { { id = "tp_x_advice", text = "Wear the harness for a day before you fight in it. Leather learns your shape if you give it time." } },
    _none = { { id = "tp_none", text = "That is nothing to do with leather or buckles, so I cannot help you." } },
  },
}
