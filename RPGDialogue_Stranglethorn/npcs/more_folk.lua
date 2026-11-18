-- More of Grom'gol Base Camp: the herbalism trainer, the cloth and leather armourer, the food and drink seller, the pet
-- trainer and the hunter trainer (Angrun, Hragran, Nargatt, Zudd, Kragg). Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Angrun (herbalism trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "angrun", id = TODO_NPC("Angrun"), name = "Angrun", title = "Herbalism Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "gromgol" }, temper = { "calm", "dry" }, values = { "craft", "patient" },
  notices = { "craft" },
  impression = {
    first = "He respects the plants that kill as much as those that heal.",
    third = "{name} met Angrun, the herbalism trainer at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_default", text = "You want to learn herbs, or you want to know which ones not to eat? Both lessons are worth your time here." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and with all your fingers. Good, you listened." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "Your hands are green to the wrist. Good, that is how an herbalist's hands should look in Stranglethorn." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist. Then you will want the purple lotus from the ruins, and you will want to watch for trolls while you pick it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Angrun, and I teach herbalism to those who will kneel in the mud long enough to learn it. This jungle grows more herbs than all of Durotar, and half of them would gladly poison you." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are Alliance, in Grom'gol. Speak softly, and do not touch anything in my satchel, because some of it bites." },
      },
      again = {
        { id = "h_again", text = "What else? The leaves are drying, and I must turn them." },
        { id = "h_again2", text = "Ask, then. I have patience, if not much time." },
      },
      choices = {
        { text = "I want to train.", next = "BUSINESS", when = { profession = "Herbalism", faction = "Horde" } },
        { text = "What grows in this jungle worth picking?", next = "herbs" },
        { text = "Which herbs here would kill me?", next = "poison" },
        { text = "Odd work for an orc, picking leaves.", next = "odd" },
        { text = "Farewell.", next = "END" },
      },
    },
    herbs = {
      lines = { { id = "he_default", text = "Liferoot along the rivers, kingsblood and goldthorn in the hills, and purple lotus in the old troll ruins. The ruins grow the best herbs, because nobody has picked there for a thousand years, and the trolls are why." } },
      choices = {
        { text = "The trolls guard the ruins?", next = "trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls = {
      lines = { { id = "tr_default", text = "The Bloodscalp and the Skullsplitter, yes, and they do not care that you only want a flower. Pick fast, keep your back to a wall, and never pick in the same place twice in one day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    poison = {
      lines = { { id = "po_default", text = "Most of the bright ones, and some of the dull ones, and one small grey vine that looks like nothing at all. The trolls tip their spears with it, so if you are cut and your arm goes cold, come to me quickly." } },
      choices = {
        { text = "Do you have a cure?", next = "cure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cure = {
      lines = { { id = "cu_default", text = "Sometimes. Kin'weelay has better ones, though he will want a favour for them, and his favours take longer than the poison does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    odd = {
      big = true,
      lines = { { id = "od_default", text = "The others laugh, until they are bitten by something and come to me. A warrior who knows herbs fights again tomorrow, and one who does not is buried tonight." } },
      choices = {
        { text = "Then your work is as worthy as any warrior's.", next = "BACK", reply = "Say that loudly in the camp, will you? They might believe it from you.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Glory is won with steel, not leaves.", next = "BACK", reply = "And glory is buried with the fool who won it. Come and see me when you are bitten.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned herbs from shamans in Durotar, where nothing grows, and came here, where everything does." } },
    advice = { { id = "tp_ad", text = "If a plant is brighter than a jewel, do not lick your fingers after picking it." } },
    _none = { { id = "tp_none", text = "I do not know that. Ask me about leaves and roots." } },
  },
}

---------------------------------------------------------------------------
-- Hragran (cloth and leather armor)
---------------------------------------------------------------------------
P:NPC {
  key = "hragran", id = TODO_NPC("Hragran"), name = "Hragran", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "gromgol" }, temper = { "gruff", "blunt" }, values = { "practical", "craft" },
  notices = { "kit" },
  impression = {
    first = "He believes the jungle is trying to rot his whole stock.",
    third = "{name} met Hragran, who sells cloth and leather armour at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_default", text = "Cloth and leather, dry as I can keep it. Buy it before the jungle eats it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Did the jungle rot your last jerkin already? It does that." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour is falling off you in pieces. Either the trolls got you or the damp did, and in this place it is usually both." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hragran, armourer. I sell cloth and leather for those who would rather move quickly than clank, and I spend every day keeping the mould off it." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are Alliance. I do not sell to you, and the grunts at the gate let you in by mistake, so be brief." },
      },
      again = {
        { id = "h_again", text = "What else? I have mould to scrape." },
        { id = "h_again2", text = "Speak. My brushes can wait a moment." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "The jungle rots leather that badly?", next = "rot" },
        { text = "Why not sell mail and plate?", next = "plate" },
        { text = "Light armour is for cowards.", next = "coward" },
        { text = "Farewell.", next = "END" },
      },
    },
    rot = {
      lines = { { id = "ro_default", text = "Leave a good jerkin in a tent for a week here and it grows a green beard. I brush everything every morning and oil it every evening, and still I lose a pair of boots a month." } },
      choices = {
        { text = "What do you oil it with?", next = "oil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oil = {
      lines = { { id = "oi_default", text = "Crocolisk fat, mostly, which keeps out the damp and keeps away customers, too, for the first day. After that the smell fades, or you stop noticing it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    plate = {
      lines = { { id = "pl_default", text = "Because a warrior in plate in this heat cooks like a boar on a spit. The smiths in Orgrimmar sell the heavy stuff to those who insist, and I sell to those who have already tried it once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    coward = {
      big = true,
      lines = { { id = "co_default", text = "Say that to a hunter who has stalked a tiger for three days, or a shaman who has stood in a troll ambush. Leather keeps you alive by keeping you quick, and quick is not cowardly." } },
      choices = {
        { text = "You're right. Speed is its own kind of courage.", next = "BACK", reply = "Good. Buy the boots, then, and run toward the fight, not away.", fx = { align = { honor = 1 } } },
        { text = "A real warrior stands and takes the blow.", next = "BACK", reply = "Then stand, and take it, and cook in your plate. I will sell your friends leather afterwards.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sold armour in Orgrimmar until the Commander needed someone here. Now I sell armour and fight mould." } },
    advice = { { id = "tp_ad", text = "Oil your leather every evening in this jungle, or lose it." } },
    _none = { { id = "tp_none", text = "I do not know that. I know leather and how to keep it dry." } },
  },
}

---------------------------------------------------------------------------
-- Nargatt (food and drink)
---------------------------------------------------------------------------
P:NPC {
  key = "nargatt", id = TODO_NPC("Nargatt"), name = "Nargatt", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "gromgol" }, temper = { "jovial", "gruff" }, values = { "practical", "friendly" },
  notices = { "hunger", "drink" },
  impression = {
    first = "He claims every drop of his water is cleaner than the river's.",
    third = "{name} met Nargatt, who sells food and drink at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_default", text = "Food that keeps and water that won't make you sick. In this jungle, that is a rare thing, grunt." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Of course you are. The jungle makes everyone hungry." },
  },
  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half starved and half chewed. Eat something before the next troll mistakes you for a meal." },
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "You have been in Thulbek's grog already, I can smell it. Drink some water before you go back out, or the river will drink you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Nargatt, and I sell bread, dried meat and clean water, the things that keep a warrior on their feet between Mudduk's hot meals. Mudduk says his pot feeds the camp, but my bread is what you carry into the jungle." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance, here? You are brave or lost. I will not sell to you, but I will tell you the river water will make you sick." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I count the barrels." },
        { id = "h_again2", text = "Ask. Food is quick to sell, but talk is free." },
      },
      choices = {
        { text = "Show me your food.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why is your water better than the river?", next = "water" },
        { text = "You and Mudduk don't get along?", next = "mudduk" },
        { text = "Hunters should live off the jungle, not bought bread.", next = "live" },
        { text = "Farewell.", next = "END" },
      },
    },
    water = {
      lines = { { id = "wa_default", text = "Because I boil it, and the river does not. The river has crocolisks in it, and dead things upstream, and troll filth from the ruins, and a man who drinks it spends the next day in a ditch." } },
      choices = {
        { text = "Where does the clean water come from?", next = "source" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Rain, mostly, caught in barrels on the roofs. Stranglethorn gives plenty of that, sometimes all day long, and at least it falls clean." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mudduk = {
      lines = { { id = "mu_default", text = "We get along fine, as long as nobody asks whose food is better. His stew is good, I admit it, but you cannot carry a pot of stew into the jungle on your back." } },
      choices = {
        { text = "I'll tell him you admitted it.", next = "BACK", reply = "Do not. He will never let me forget it, and he will put more pepper in mine.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    live = {
      big = true,
      lines = { { id = "li_default", text = "Some do, and some come back thin and feverish from eating the wrong fruit. A warrior who carries bread wastes no time foraging, and spends it fighting instead." } },
      choices = {
        { text = "Be prepared. Carry what you need.", next = "BACK", reply = "Wise, and good for my business, which is wiser still. Take two loaves.", fx = { align = { order = 1 } } },
        { text = "The jungle provides for those strong enough to take it.", next = "BACK", reply = "It provides fevers, mostly. Come back when you have tasted the wrong berry.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fed grunts in Durotar, and now I feed them here. The bread is the same, but the rain is worse." } },
    advice = { { id = "tp_ad", text = "Never drink from the river, not even once, not even when you are dying of thirst." } },
    _none = { { id = "tp_none", text = "I do not know that. Ask me about bread, or water." } },
  },
}

---------------------------------------------------------------------------
-- Zudd (pet trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "zudd", id = TODO_NPC("Zudd"), name = "Zudd", title = "Pet Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "gromgol" }, temper = { "eager", "blunt" }, values = { "craft", "loyal" },
  notices = { "pet" },
  impression = {
    first = "He judges a hunter entirely by the state of their companion.",
    third = "{name} met Zudd, the pet trainer at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_default", text = "Bring me your beast, hunter. I will teach it things you never thought it could learn." },
    { id = "g_back", when = { metBefore = true }, text = "Back, and your companion looks stronger. Good, the lessons are holding." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} is watching the jungle, not me. Good instincts, and I can work with that." },
    { id = "n_cat", cat = "pet", when = { pet = { family = "Cat" } },
      text = "A great cat! The tigers here would teach yours a thing or two, if they didn't eat it first." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Zudd, and I train the beasts that fight beside our hunters, and a hunter is only as good as the animal at their side. Bring yours here, and I will make it better." },
        { id = "h_nothunter", when = { class = { "WARRIOR", "MAGE", "PRIEST", "ROGUE", "SHAMAN", "WARLOCK", "DRUID", "PALADIN" } },
          text = "You are no hunter, and you have no beast, so I have nothing to teach you. But you may talk, if you like animals." },
      },
      again = {
        { id = "h_again", text = "What else? A raptor in the pen is waiting for its lesson." },
        { id = "h_again2", text = "Speak; the beasts are patient, even if I am not." },
      },
      choices = {
        { text = "Teach my companion.", next = "BUSINESS", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What beasts in Stranglethorn are worth taming?", next = "beasts" },
        { text = "How do you teach a beast anything?", next = "teach" },
        { text = "A beast only obeys out of hunger.", next = "hunger" },
        { text = "Farewell.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "be_default", text = "The tigers and panthers, if you can find them before they find you, and the raptors in the north if you like a beast with a temper. The gorillas are strong, but they sulk, and a sulking ape is no use in a fight." } },
      choices = {
        { text = "What about the panthers?", next = "panther" },
        { text = "Something else.", next = "BACK" },
      },
    },
    panther = {
      lines = { { id = "pa_default", text = "Quiet and quick, and the black ones fight like shadows. The humans at Nesingwary's camp hunt them for sport, which is a waste of good animals, if you ask me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "te_default", text = "The same way you teach a grunt: show it, praise it, show it again. A beast learns faster than most grunts, and complains less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunger = {
      big = true,
      lines = { { id = "hu_default", text = "Hunger brings it to you, but it does not keep it. I have seen beasts stand over a fallen hunter for a day and a night, with meat in reach, and not eat." } },
      choices = {
        { text = "Then the bond is real. That's worth honouring.", next = "BACK", reply = "It is. Honour it, and your beast will honour you.", fx = { align = { light = 1 } } },
        { text = "Loyalty is useful. Feelings don't matter.", next = "BACK", reply = "Then you will never understand why your beast does what it does. A pity, but it will still fight for you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I trained wolves for the clans. Now I train whatever the hunters bring me." } },
    advice = { { id = "tp_ad", text = "Feed your beast before yourself, and praise it more than you scold it." } },
    _none = { { id = "tp_none", text = "I do not know that. Ask me about beasts." } },
  },
}

---------------------------------------------------------------------------
-- Kragg (hunter trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "kragg", id = TODO_NPC("Kragg"), name = "Kragg", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "gromgol" }, temper = { "steady", "proud" }, values = { "craft", "proud" },
  notices = { "class", "pet" },
  impression = {
    first = "He has no patience for humans who hunt for trophies.",
    third = "{name} met Kragg, the hunter trainer at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_default", text = "Hunter! Stranglethorn is the greatest hunting ground in the world, and the most likely to kill you. Ready to learn?" },
    { id = "g_back", when = { metBefore = true }, text = "You are still alive. Good, the jungle has not taught you its last lesson yet." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", race = "Troll" },
      text = "A Darkspear hunter. Your people hunted this jungle before mine ever crossed the sea; perhaps you will teach me something." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} moves well. Keep it close in the jungle, because the tigers like to pick off the one at the back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kragg, and I train the hunters of the Horde who come to Stranglethorn. Here you learn to track a tiger through the rain and to hear a troll before he hears you." },
        { id = "h_nothunter", when = { class = { "WARRIOR", "MAGE", "PRIEST", "ROGUE", "SHAMAN", "WARLOCK", "DRUID", "PALADIN" } },
          text = "You are no hunter, so I cannot train you. But sit, if you want to hear about the jungle; there is no harm in listening." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are Alliance, and you are in the wrong camp. Nesingwary's humans are to the north, if you want to hunt with them." },
      },
      again = {
        { id = "h_again", text = "What else? The jungle is waiting." },
        { id = "h_again2", text = "Speak, hunter. I have time until dusk." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why is Stranglethorn the greatest hunting ground?", next = "ground" },
        { text = "What do you make of Nesingwary's camp?", next = "nesingwary" },
        { text = "What's the hardest hunt here?", next = "hardest" },
        { text = "Farewell.", next = "END" },
      },
    },
    ground = {
      lines = { { id = "gr_default", text = "Because everything here hunts, and everything here is hunted. Tigers, raptors, crocolisks, trolls; the jungle makes a hunter sharper than any plain ever could." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nesingwary = {
      big = true,
      lines = { { id = "ne_default", text = "They hunt for trophies and for the pages of their books, and they kill far more than they eat. I hunt to eat and to defend the camp, and I take what I need, but they will strip the jungle bare for the sake of a stuffed head." } },
      choices = {
        { text = "Hunting for sport is a dishonour to the beast.", next = "BACK", reply = "Yes. The beast gives its life; it deserves better than to hang on a wall.", fx = { align = { honor = 1 } } },
        { text = "A kill is a kill. Why it's done hardly matters.", next = "BACK", reply = "It matters to the beast, and it matters to the jungle. Spend more time here, and you will see.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "ha_default", text = "The great tigers in the south, the ones the trolls say are spirits. I have seen one, once, and I did not draw my bow, because I knew it had already seen me." } },
      choices = {
        { text = "Were they spirits?", next = "spirit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit = {
      lines = { { id = "sp_default", text = "Ask Kin'weelay. He will tell you more than you want to know about spirits. I only know it walked away, and I was glad." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted in Durotar, where game is scarce, and came here, where it is plentiful and angry." } },
    advice = { { id = "tp_ad", text = "Hunt at dawn, when the tigers are tired and the trolls asleep." } },
    _none = { { id = "tp_none", text = "I do not know that. Ask me about tracking." } },
  },
}
