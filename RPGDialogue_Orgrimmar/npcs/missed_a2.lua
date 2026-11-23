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
  },
  topics = {
    background = { { id = "tp_bg", text = "I have made armor for three wars and sat idle through one captivity. I know which I preferred." } },
    internment = { { id = "tp_int", text = "The humans penned us like cattle, and we let them, because the fire had gone out of us. I do not like to speak of it." } },
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
        { id = "g_default", text = "Now and then I do, when a champion asks and brings the metal for it. Then I go back to the plain axes, and I find I have not missed anything." },
      },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    borgosh = {
      lines = { { id = "b_default", text = "I think he will do it, though not soon, and I would not say so where he can hear. An orc who wants to make one perfect thing is good to have at the next fire, because his failures are still better than most smiths' best." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My kin have carried axes for as long as anyone remembers. I am the first who would sooner make them than swing them." } },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I mined before I sold, and I sell because my back asked me to. That is the whole of it." } },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a mace for the Horde before I sold them. My arm is slower now, but it still knows a good one." } },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "My mother made harnesses and so did hers. The pattern is older than this city and older than our time on this world." } },
    _none = { { id = "tp_none", text = "That is nothing to do with leather or buckles, so I cannot help you." } },
  },
}
