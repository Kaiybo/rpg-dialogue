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
    first = "Angrun teaches herbalism at Grom'gol and seems the only orc in camp who would rather crouch over a leaf than swing an axe. He knows which jungle plants heal and which kill, and he treats both with the same respect.",
    third = "{name} met Angrun, the herbalism trainer at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_x1", when = { timeOfDay = "night" }, text = "The night-blooming herbs are open now, and so are the eyes of everything that hunts. Pick near the walls until morning." },
    { id = "g_default", text = "You want to learn herbs, or you want to know which ones not to eat? Both lessons are worth your time here." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and with all your fingers. Good, you listened." },
  },
  notice = {
    { id = "n_x1", cat = "craft", when = { class = "SHAMAN" },
      text = "A shaman. Then the plants speak to you before I can, and I will only tell you their names." },
    { id = "n_x2", cat = "craft", when = { race = "Tauren" },
      text = "Your people have picked herbs since before mine had axes. I would hear what the plains taught you, if you have time." },
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
        { id = "h_x_again1", text = "What else? The kingsblood will wait a little." },
        { id = "h_again", text = "What else? The leaves are drying, and I must turn them." },
        { id = "h_again2", text = "Ask, then. I have patience, if not much time." },
      },
      choices = {
        { text = "I want to train.", next = "BUSINESS", when = { profession = "Herbalism", faction = "Horde" } },
        { text = "What grows in this jungle worth picking?", next = "herbs" },
        { text = "Which herbs here would kill me?", next = "poison" },
        { text = "Odd work for an orc, picking leaves.", next = "odd" },
        { text = "Who taught an orc herbalism?", next = "taught" },
        { text = "The camp must depend on your herbs.", next = "depend" },
        { text = "Where should a skilled herbalist look here?", next = "skilled", when = { profession = "Herbalism" } },
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
    taught = {
      lines = {
        { id = "taught_1", text = "A troll, at Sen'jin, when the Horde first came to Durotar. She said an orc who could only kill was half a hunter, and she made me crawl through thornbush for a season to prove I wanted the other half." },
      },
      choices = {
        { text = "And did you?", next = "wanted" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wanted = {
      lines = {
        { id = "wanted_1", text = "I did. In the camps we were given nothing to tend and nothing to learn, and a people who tend nothing forget what they are. I would rather kneel over a root than sit in that again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    depend = {
      lines = {
        { id = "depend_1", text = "More than the grunts admit. Far Seer Mok'thardin takes my liferoot for the wounded, and Kin'weelay takes my worst weeds for his own purposes, and Mudduk takes whatever is left for the pot." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    skilled = {
      lines = {
        { id = "skilled_1", text = "Go south, to the ruins of Jubuwal and Balal, where purple lotus grows in the broken stone. Further south there is Khadgar's whisker on the high ground, and it is worth the climb if the Skullsplitter are looking the other way." },
        { id = "skilled_2", when = { race = "Troll" }, text = "South, in the ruins your cousins hold, where the purple lotus grows. You will know better than I how to walk among Gurubashi stones without being seen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "The trolls of the north ruins have been cutting a red flower I do not know. I do not like herbs I cannot name." } },
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
    first = "Hragran sells cloth and leather armour at Grom'gol and spends most of his day fighting mould. He believes the jungle is trying to rot his whole stock, and he may well be right.",
    third = "{name} met Hragran, who sells cloth and leather armour at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_x1", when = { timeOfDay = "night" }, text = "Come under the awning, out of the wet. Night rain is the worst here, because nothing dries until noon." },
    { id = "g_default", text = "Cloth and leather, dry as I can keep it. Buy it before the jungle eats it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Did the jungle rot your last jerkin already? It does that." },
  },
  notice = {
    { id = "n_x1", cat = "kit", when = { class = { "ROGUE", "DRUID", "HUNTER", "SHAMAN" } },
      text = "You already wear what I sell. Good. Then you know why it must be oiled, and I do not have to argue." },
    { id = "n_x2", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Cloth, in this jungle. It will be green by the week's end unless you hang it in smoke every night, so listen when I tell you how." },
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
        { id = "h_x_again1", text = "What else? I have a rack to turn before the damp sets in." },
        { id = "h_again", text = "What else? I have mould to scrape." },
        { id = "h_again2", text = "Speak. My brushes can wait a moment." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "The jungle rots leather that badly?", next = "rot" },
        { text = "Why not sell mail and plate?", next = "plate" },
        { text = "Light armour is for cowards.", next = "coward" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "You fight mould the way grunts fight trolls.", next = "fight" },
        { text = "How would you cure a hide in this damp?", next = "cure", when = { profession = { "Leatherworking", "Tailoring" } } },
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
    hides = {
      lines = {
        { id = "hides_1", text = "From the hunters of this camp, and from the raptors and tigers that were foolish enough to meet them. Brawn cures the best of it and teaches others to, and I sell what he approves, which is not everything." },
      },
      choices = {
        { text = "Brawn is hard to please?", next = "brawn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brawn = {
      lines = {
        { id = "brawn_1", text = "Brawn has thrown a finished jerkin into the sea because one seam wandered. He was right to do it, and I have not let a wandering seam onto my rack since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = {
        { id = "fight_1", text = "Hah! Yes, and trolls at least rest. The mould works day and night, and it cannot be frightened, and no one has ever sung a lok'vadnod for a merchant who beat it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cure = {
      lines = {
        { id = "cure_1", text = "Smoke first, for two days, over wet wood so that it smoulders. Then crocolisk fat, worked in by hand until your fingers ache, and never a drop of river water after." },
        { id = "cure_2", when = { profession = "Tailoring" }, text = "Cloth is harder than hide. Smoke it lightly, keep it in a waxed sack, and dry it by the fire each night, or the jungle will weave its own pattern into it in green." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "The goblins of Booty Bay sell a powder that is meant to keep cloth dry. I bought some, and the mould ate the powder." } },
    gromgol = { { id = "tp_x_gromgol", text = "A wooden wall, a tower, and the sea at our backs. It is not Orgrimmar, but it is ours, and it has not fallen." } },
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
    first = "Nargatt sells provisions at Grom'gol and keeps up a friendly feud with the camp cook over who really feeds the place. He sells water by the barrel and claims every drop is cleaner than the river's.",
    third = "{name} met Nargatt, who sells food and drink at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_x1", when = { timeOfDay = "night" }, text = "You travel at night? Then take water and bread now. Nothing I sell is worse than being lost and hungry in the dark." },
    { id = "g_default", text = "Food that keeps and water that won't make you sick. In this jungle, that is a rare thing, grunt." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Of course you are. The jungle makes everyone hungry." },
  },
  notice = {
    { id = "n_x1", cat = "hunger", when = { class = "HUNTER" },
      text = "Feed your beast before you feed yourself. I sell dried meat for exactly that, and it keeps better than fresh in this heat." },
    { id = "n_x2", cat = "drink", when = { race = "Troll" },
      text = "A Darkspear. Your people drink things I would not sell, and thrive on them. I will stay with boiled water." },
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
        { id = "h_x_again1", text = "What else? The bread will not stay fresh while we talk." },
        { id = "h_again", text = "What else? Talk while I count the barrels." },
        { id = "h_again2", text = "Ask. Food is quick to sell, but talk is free." },
      },
      choices = {
        { text = "Show me your food.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why is your water better than the river?", next = "water" },
        { text = "You and Mudduk don't get along?", next = "mudduk" },
        { text = "Hunters should live off the jungle, not bought bread.", next = "live" },
        { text = "How do you keep bread in this heat?", next = "bread" },
        { text = "You feed a whole camp from one stall.", next = "camp" },
        { text = "What would you carry for a week's march?", next = "march", when = { profession = "Cooking" } },
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
    bread = {
      lines = {
        { id = "bread_1", text = "I bake it hard, twice, the way it was done on the march from the camps. It will break a tooth if you bite it dry, but soak it in water and it is food again, and no mould will touch it." },
      },
      choices = {
        { text = "You baked on the march from the camps?", next = "camps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps = {
      lines = {
        { id = "camps_1", text = "I carried flour for Thrall's army when we left Lordaeron, and I learned then that warriors remember who fed them. The humans gave us scraps in the camps, and I swore no orc would beg bread from me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "camp_1", text = "The grunts on the wall, the hunters, the peons, and whoever steps off the zeppelin with an empty belly. Uthok sells them rope and flint, and I sell them the strength to use it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    march = {
      lines = {
        { id = "march_1", text = "Twice-baked bread, dried raptor meat, and salt, and two skins of water for every one you think you need. Leave the fruit on the trees, because half of it here is medicine and the other half is poison." },
        { id = "march_2", when = { race = "Tauren" }, text = "Twice-baked bread and salt, and more water than you believe. I have no grain cakes such as your people make, though I have asked every tauren who passes to teach me, and you are welcome to be the one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "The zeppelin goblins say a shipment of grain went missing at Booty Bay. With goblins, missing means sold twice." } },
    gromgol = { { id = "tp_x_gromgol", text = "Small, wet and stubborn. I have fed armies in worse places." } },
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
    first = "Zudd trains hunters' beasts at Grom'gol and judges a hunter entirely by the state of their companion. He talks to animals as though they were promising young grunts.",
    third = "{name} met Zudd, the pet trainer at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_x1", when = { class = "HUNTER", race = "Troll" }, text = "A Darkspear and a beast together. Your people do this well. Come, let me see how it stands." },
    { id = "g_default", text = "Bring me your beast, hunter. I will teach it things you never thought it could learn." },
    { id = "g_back", when = { metBefore = true }, text = "Back, and your companion looks stronger. Good, the lessons are holding." },
  },
  notice = {
    { id = "n_x1", cat = "pet", when = { pet = { family = "Raptor" } },
      text = "A raptor. Good. They are proud, like orcs. Do not shame it before others, and it will die for you." },
    { id = "n_x2", cat = "pet", when = { pet = { family = "Gorilla" } },
      text = "A gorilla, here, at my post. It is strong, and it knows it. You must be stronger in will, or it will lead and you will follow." },
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
        { id = "h_x_again1", text = "What else? Your beast grows restless." },
        { id = "h_again", text = "What else? A raptor in the pen is waiting for its lesson." },
        { id = "h_again2", text = "Speak; the beasts are patient, even if I am not." },
      },
      choices = {
        { text = "Teach my companion.", next = "BUSINESS", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What beasts in Stranglethorn are worth taming?", next = "beasts" },
        { text = "How do you teach a beast anything?", next = "teach" },
        { text = "A beast only obeys out of hunger.", next = "hunger" },
        { text = "You trained wolves for the clans.", next = "wolves" },
        { text = "Which beast is hardest to teach?", next = "hardest" },
        { text = "My companion won't hold when I call it back.", next = "hold", when = { class = "HUNTER" } },
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
    wolves = {
      lines = {
        { id = "wolves_1", text = "For the Frostwolves' cousins, in the old days, before the camps. A wolf and its rider ate together and slept together, and when one fell the other was never the same. That is what I try to teach here, with tigers." },
      },
      choices = {
        { text = "What became of your wolves?", next = "became" },
        { text = "Something else.", next = "BACK" },
      },
    },
    became = {
      lines = {
        { id = "became_1", text = "The humans killed them when they took us, because a wolf will not be a prisoner. I did not train another beast until Thrall freed us, and the first one I touched after that, I wept, and I am not ashamed of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = {
        { id = "hardest_1", text = "The crocolisk. It is old and cold, and it does not care whether you are pleased. You teach it one thing in a season, and then it does that one thing until the world ends." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = {
        { id = "hold_1", text = "Then it does not yet believe you will come for it if it waits. Call it back when there is no danger, a hundred times, and reward it each time, and on the day there is danger it will remember the hundred." },
        { id = "hold_2", when = { pet = { family = "Cat" } }, text = "A cat chases what runs; it is in the blood. Call {pet} back a hundred times when nothing is at stake, and feed it from your hand each time, and it will learn that you are better prey than what flees." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "Kragg has seen a white tiger in the south. I would give a year of my life to see it stand beside a hunter of the Horde." } },
    gromgol = { { id = "tp_x_gromgol", text = "The jungle sends us its beasts every night. Some we fight, and some we keep." } },
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
    first = "Kragg trains hunters at Grom'gol and calls Stranglethorn the finest hunting ground in the world, if you survive it. He has no patience for the humans at Nesingwary's camp, who hunt for trophies.",
    third = "{name} met Kragg, the hunter trainer at Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_x1", when = { class = "HUNTER", race = "Orc" }, text = "Lok'tar, hunter. You carry yourself as the wolf-riders did. Let us see if the jungle agrees." },
    { id = "g_default", text = "Hunter! Stranglethorn is the greatest hunting ground in the world, and the most likely to kill you. Ready to learn?" },
    { id = "g_back", when = { metBefore = true }, text = "You are still alive. Good, the jungle has not taught you its last lesson yet." },
  },
  notice = {
    { id = "n_x1", cat = "class", when = { class = "HUNTER", race = "Tauren" },
      text = "A hunter of the plains. You will find the trees crowd you at first, as they did me. Give it a moon, and you will hear through them." },
    { id = "n_x2", cat = "pet", when = { pet = { family = "Raptor" } },
      text = "A raptor at your side. They are clever, and they remember an insult, so do not strike {pet} in anger." },
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
        { id = "h_x_again1", text = "What else, hunter? The light is going." },
        { id = "h_again", text = "What else? The jungle is waiting." },
        { id = "h_again2", text = "Speak, hunter. I have time until dusk." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why is Stranglethorn the greatest hunting ground?", next = "ground" },
        { text = "What do you make of Nesingwary's camp?", next = "nesingwary" },
        { text = "What's the hardest hunt here?", next = "hardest" },
        { text = "How do you hear a troll before he hears you?", next = "hear" },
        { text = "You hunt to defend the camp as well.", next = "defend" },
        { text = "What should I tame while I'm here?", next = "tame", when = { class = "HUNTER" } },
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
    hear = {
      lines = {
        { id = "hear_1", text = "You stop listening for the troll, because he makes no sound. You listen for the birds that go quiet around him, and for the space in the noise that moves through the trees toward you." },
      },
      choices = {
        { text = "Who taught you that?", next = "who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "who_1", text = "A Bloodscalp, without meaning to. He stalked me for half a day along the river, and I only knew because the frogs stopped. I have his tusks, and I have listened to frogs ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    defend = {
      lines = {
        { id = "defend_1", text = "Every dawn I walk the treeline with two of Commander Aggro'gosh's grunts. Tigers come for the camp's scraps and trolls come for the camp, and it is better to meet both a hundred paces out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tame = {
      lines = {
        { id = "tame_1", text = "A Stranglethorn tigress, if you are patient, or one of the lashtail raptors, if you are not. Zudd will teach what you tame to fight properly, and I will teach you not to get in its way." },
        { id = "tame_2", when = { class = "HUNTER", minLevel = 40 }, text = "For one as seasoned as you, there is a great cat the trolls call Bangalash, white as bone, on the high ground to the south. I do not say tame it; I say you are the first I have told where it walks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_x_rumors", text = "The dwarf Nesingwary has put a price on the great beasts by name. I would like to reach them first, and leave them alive." } },
    gromgol = { { id = "tp_x_gromgol", text = "The Warchief wanted eyes on this coast, and we are the eyes. I hunt so the eyes may eat." } },
    background = { { id = "tp_bg", text = "I hunted in Durotar, where game is scarce, and came here, where it is plentiful and angry." } },
    advice = { { id = "tp_ad", text = "Hunt at dawn, when the tigers are tired and the trolls asleep." } },
    _none = { { id = "tp_none", text = "I do not know that. Ask me about tracking." } },
  },
}

-- Krakk: sells mail and plate at Grom'gol Base Camp.
P:NPC {
  key = "krakk", id = TODO_NPC("Krakk"), name = "Krakk", title = "Superior Armorer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "gromgol" }, temper = { "gruff", "proud" }, values = { "strength", "honor" },
  notices = { "kit", "class" },
  impression = {
    first = "Krakk sells heavy armour at Grom'gol and will not hear that the jungle is too hot for it. He taps every breastplate with a hammer before it leaves his stall and listens to the ring.",
    third = "{name} met Krakk, the superior armorer of Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_default", text = "Stand still, {class}. Let me see what you wear, and whether it will turn a troll's axe or only slow it." },
    { id = "g_2", when = { metBefore = true }, text = "You return, and you are still in one piece. Then the armour did its work, or you ran well." },
    { id = "g_3", when = { faction = "Alliance" }, text = "I do not sell to the Alliance. Look if you must, and then walk back to wherever your kind is tolerated." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour is finished. Another blow and you will be wearing it in pieces, so buy something whole before you leave these walls." },
    { id = "n_2", cat = "class", when = { class = { "WARRIOR", "SHAMAN" } },
      text = "Good. One who stands in the front and wears iron to do it. Too many in this camp think speed will save them." },
    { id = "n_3", cat = "class", when = { race = "Tauren" },
      text = "Your people are hard to fit, and worth the trouble. I have a hauberk let out at the shoulders that no orc could fill." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Krakk, and I sell mail and plate to those with the strength to carry it. Hragran will tell you that iron cooks a warrior in this heat, and he tells you that because he sells leather." },
        { id = "hello_2", when = { class = { "MAGE", "PRIEST", "WARLOCK", "ROGUE", "DRUID" } }, text = "I am Krakk, and I sell mail and plate. You could not lift most of what hangs here, and I do not say it to shame you; every clan needs those who strike from behind the shield wall." },
      },
      again = {
        { id = "hello_again1", text = "What else? I have rust to scour." },
        { id = "hello_again2", text = "Speak. I can listen and work." },
        { id = "hello_again3", text = "Ask, then." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "Where is your armour forged?", next = "forged" },
        { text = "Doesn't the heat make plate a burden?", next = "heat" },
        { text = "Armour is for those who fear wounds.", next = "fear" },
        { text = "How do you keep iron from rusting here?", next = "rust", when = { profession = "Blacksmithing" } },
        { text = "What would you put on a warrior bound for the troll ruins?", next = "ruins", when = { class = "WARRIOR" } },
        { text = "Who in this camp wears your work?", next = "wears" },
        { text = "Farewell.", next = "END" },
      },
    },
    forged = {
      lines = {
        { id = "forged_1", text = "In Orgrimmar, in the Valley of Honor, by smiths who learned on the anvils of the old clans. It comes south by zeppelin, and I pay the goblin for every pound, and I check every rivet when it lands." },
      },
      choices = {
        { text = "And Vharr, at the forge here?", next = "vharr" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vharr = {
      lines = {
        { id = "vharr_1", text = "Vharr makes blades, and good ones. I have told him that a blade without a breastplate behind it is half a warrior, and he has told me the same thing the other way round, and we drink together regardless." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    heat = {
      lines = {
        { id = "heat_1", text = "It is a burden. So is an axe, and so is honour. The trolls here throw spears from the trees before you ever see them, and a warrior who sweats in mail lives to complain about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      big = true,
      lines = {
        { id = "fear_1", text = "I have heard that said, mostly by the young. I wore no armour once, when the demon blood told us we could not be hurt, and I buried better warriors than myself because of it." },
      },
      choices = {
        { text = "There's wisdom in that. Strength should be protected.", next = "BACK", reply = "Yes. A warrior who lives fights a hundred battles for the Horde, not one.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A true warrior trusts his fury, not his breastplate.", next = "BACK", reply = "That is the blood-haze speaking. I have heard it before, and from the dead.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rust = {
      lines = {
        { id = "rust_1", text = "Oil at dawn and at dusk, and sand between. I hang nothing against the wall, where the damp gathers, and I keep a brazier under the racks through the rains, which Hragran says is cheating." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = {
        { id = "ruins_1", text = "Mail on the body, plate on the shoulders and the head, and nothing that rattles. The Bloodscalp aim for the throat and the Skullsplitter for the skull, as you would guess, so spend your coin from the neck up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wears = {
      lines = {
        { id = "wears_1", text = "Commander Aggro'gosh, whose pauldrons I refitted twice after he broke them on trolls, and every grunt on the wall. The Far Seer wears mail I sold him and says the spirits do not mind the weight." },
        { id = "wears_2", when = { class = "SHAMAN" }, text = "The Commander, the grunts, and Far Seer Mok'thardin, who wears my mail under his furs. Ask him whether the elements object to iron; he told me they object more to a dead shaman." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kurzen = { { id = "tp_y_kurzen", text = "The human deserters in the hills wear good Stormwind steel. When the grunts bring some back, I reforge it into something with honour." } },
    background = { { id = "tp_background", text = "I was a grunt before I was a merchant. A spear through the knee ended one trade and began the other." } },
    gromgol = { { id = "tp_gromgol", text = "A wall of logs and a hundred warriors. I have armoured most of them, and I know which ones listened." } },
    rumors = { { id = "tp_rumors", text = "The zeppelin brought word that the humans are strengthening their camp to the north. Let them. Better armour will be needed, and I sell it." } },
    advice = { { id = "tp_advice", text = "Buy the helm first. A warrior can fight with a wounded arm, but not with a split head." } },
    _none = { { id = "tp_none", text = "I do not know this. I know iron." } },
  },
}

-- Brawn: teaches leatherworking at Grom'gol Base Camp and has not forgiven the humans for the internment camps.
P:NPC {
  key = "brawn", id = TODO_NPC("Brawn"), name = "Brawn", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "gromgol" }, temper = { "bitter", "exacting" }, values = { "vengeance", "craft" },
  notices = { "craft", "race" },
  impression = {
    first = "Brawn teaches leatherworking at Grom'gol and holds every seam to a standard few can meet. He speaks of the humans' camps as if he left them yesterday, and of the day the Horde will take the rest of this coast.",
    third = "{name} met Brawn, the leatherworking trainer of Grom'gol Base Camp.",
  },
  greetings = {
    { id = "g_default", text = "You come to learn, or to waste hide? Show me your hands, and I will know which." },
    { id = "g_2", when = { metBefore = true }, text = "You are back. Let me see your stitching before you say anything." },
    { id = "g_3", when = { faction = "Alliance" }, text = "Human lands end at our wall. I teach nothing to your side, and you would be wise to leave before I remember more." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Leatherworking" },
      text = "You have the calluses of the trade. Good. Then we can skip the part where I tell you which end of the awl is sharp." },
    { id = "n_2", cat = "craft", when = { profession = "Skinning" },
      text = "A skinner. Cut cleaner than the last one who came through here, and I will have work for every hide you bring." },
    { id = "n_3", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. You were human once, and the humans cast you out. Then you understand something about them that I did not need to be taught twice." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am Brawn, and I teach the working of leather. We have only a small foothold on this coast, but a warrior fights in what I teach others to make, and one day that will carry us further than this wall." },
        { id = "hello_2", when = { profession = "Leatherworking" }, text = "I am Brawn. You know the trade already, so I will not flatter you; whatever you were taught elsewhere, the jungle will show you what was left out." },
      },
      again = {
        { id = "hello_again1", text = "What else? The hides are drying." },
        { id = "hello_again2", text = "Speak. My hands are busy, but my ears are not." },
        { id = "hello_again3", text = "Ask." },
      },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "What hides are worth working here?", next = "hides" },
        { text = "Hragran says you threw a jerkin into the sea.", next = "jerkin" },
        { text = "The camps are behind you. Let the hatred go.", next = "camps" },
        { text = "What should I make from tiger and raptor?", next = "make", when = { profession = "Leatherworking" } },
        { text = "Were you in the camps, Brawn?", next = "orc", when = { race = "Orc" } },
        { text = "Do the trolls of the camp work leather your way?", next = "trolls" },
        { text = "Farewell.", next = "END" },
      },
    },
    hides = {
      lines = {
        { id = "hides_1", text = "Raptor for scale and toughness, tiger and panther for work that must be quiet, and crocolisk when you want something no blade will open. The gorillas have a thick hide too, though it is poor work for the trouble." },
      },
      choices = {
        { text = "Who brings them in?", next = "brings" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brings = {
      lines = {
        { id = "brings_1", text = "Kragg and the hunters he trains, and the grunts, who ruin half of what they kill by using an axe where a knife was wanted. I have told the Commander that a warrior who spoils a hide should wear it as it is." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    jerkin = {
      lines = {
        { id = "jerkin_1", text = "I did. The seam ran off true by the width of a thorn. A thorn's width is where the rain enters, and where the spear point catches, and I will not put my mark on a thing that fails an orc in battle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    camps = {
      big = true,
      lines = {
        { id = "camps_1", text = "Behind me? I wore their chains for years, and I watched strong orcs sit in the mud and forget their own names. The humans called that mercy. I do not let go of what was done; I work, and I wait." },
      },
      choices = {
        { text = "Remember it, but don't let it rule you. Thrall asks better.", next = "BACK", reply = "The Warchief does ask it. For him, I try. Do not ask me to succeed.", fx = { align = { light = 1 } } },
        { text = "You're right to hate them. They'd do it again.", next = "BACK", reply = "They would. So we will be strong enough that they cannot.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    make = {
      lines = {
        { id = "make_1", text = "From raptor, bracers and a belt, which take the hard wear. From tiger, a hood and leggings for a scout. Leave crocolisk until your hands are stronger, because it will break three needles before it takes one stitch." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = {
        { id = "orc_1", text = "In Durnholde's shadow, like many. I was young, and I made shoes for the guards out of scraps, because it was the only work that kept my hands from shaking. That is where I learned the awl, and I have never thanked them for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls = {
      lines = {
        { id = "trolls_1", text = "The Darkspear have their own way, with bone needles and gut thread, and it is lighter than mine and nearly as strong. I have learned two stitches from them, and they have learned to stop putting feathers on everything." },
        { id = "trolls_2", when = { race = "Troll" }, text = "Your people sew with bone and gut, and it holds, I grant it. Show me the knot your mothers use at the shoulder, and I will show you how an orc double-seams a belt." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kurzen = { { id = "tp_y_kurzen", text = "Humans who turned on their own king. I would respect that, if they had done it for any reason but greed." } },
    background = { { id = "tp_background", text = "A leatherworker of the Horde. I learned the trade in chains and perfected it free, and that is all I will say." } },
    gromgol = { { id = "tp_gromgol", text = "A foothold. The humans have a kingdom to the north, and we have a wall of logs, and I know which of us is hungrier." } },
    rumors = { { id = "tp_rumors", text = "The human rebels to the north fight their own kin as well as us. A people who chain others will chain each other in the end." } },
    advice = { { id = "tp_advice", text = "Wax your thread, double your seams, and never work a hide the same day it was taken." } },
    _none = { { id = "tp_none", text = "I do not know, and I do not care to guess. Ask me about leather." } },
  },
}

-- Jaxin Chong: teaches alchemy at Boucher's Cauldron on the top level of Booty Bay; buys his herbs from Glyx Brewright.
P:NPC {
  key = "jaxin_chong", id = TODO_NPC("Jaxin Chong"), name = "Jaxin Chong", title = "Alchemy Trainer", gender = "male",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "booty_bay" }, temper = { "harried", "sharp" }, values = { "profit", "craft" },
  notices = { "craft", "purse" },
  impression = {
    first = "Jaxin Chong teaches alchemy at Boucher's Cauldron in Booty Bay and complains about the price of herbs in the same breath as he quotes his own fees. Something on his bench is always about to boil over.",
    third = "{name} met Jaxin Chong, the alchemy trainer of Booty Bay.",
  },
  greetings = {
    { id = "g_default", text = "Don't touch that, or that either! Sorry, pal, it's a reflex. Jaxin Chong, alchemy, lessons by the hour and breakages by the item." },
    { id = "g_2", when = { metBefore = true }, text = "You again! Good, good, you've still got both eyebrows, so something I said stuck." },
    { id = "g_3", when = { profession = "Alchemy" }, text = "A practitioner, finally! Come round this side of the bench, friend, and mind the green one, it's in a mood." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Herbalism" },
      text = "You pick your own herbs? Pal, do you know what Glyx charges me for a pouch of crumpled kingsblood? Sit down, let's talk about cutting out a middleman." },
    { id = "n_2", cat = "craft", when = { profession = "Alchemy" },
      text = "You've got the stained fingers, so I'll skip the safety lecture, which is a shame, because it's my best material." },
    { id = "n_3", cat = "purse", when = { money = { min = 500000 } },
      text = "Now that's a customer who can afford the advanced course. I say that with respect, friend, and with a price list." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Jaxin Chong, alchemy trainer, Boucher's Cauldron, top level, mind the stairs. I teach the mixing, the measuring and the not dying, and I charge for all three because all three cost me something to learn." },
        { id = "hello_2", when = { faction = "Horde" }, text = "Jaxin Chong, alchemy trainer. Horde coin, Alliance coin, it all dissolves the same in aqua regia, pal, so step up and let's see what you already know." },
      },
      again = {
        { id = "hello_again1", text = "What else, pal? Talk fast, the flask's nearly at temperature." },
        { id = "hello_again2", text = "Go on, go on, I can stir and listen." },
        { id = "hello_again3", text = "Yeah? Ask, but stand back a step." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What's this understanding with Glyx Brewright?", next = "glyx" },
        { text = "Is alchemy really that dangerous?", next = "danger" },
        { text = "You overcharge for knowledge anyone could find.", next = "charge" },
        { text = "What sells best off your bench?", next = "sells", when = { profession = "Alchemy" } },
        { text = "I could supply you herbs directly.", next = "supply", when = { profession = "Herbalism" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    glyx = {
      lines = {
        { id = "glyx_1", text = "He keeps me supplied and I keep him rich, that's the whole understanding. He's got the only herb stall on the boardwalk, so he names a price and I pay it, and then I go home and scream into a pillow like a professional." },
      },
      choices = {
        { text = "Why not buy elsewhere?", next = "elsewhere" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elsewhere = {
      lines = {
        { id = "elsewhere_1", text = "From who, pal? The jungle's full of herbs and it's also full of trolls, tigers and Venture Company thugs, and Glyx has people who go out there so I don't have to. I'm paying for the herbs and for the funerals, when you think about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "danger_1", text = "Friend, I've had three benches, and I didn't sell the first two. You measure wrong by a pinch and the best case is a bad smell, and the worst case is the Baron sends me a bill for somebody's roof." },
      },
      choices = {
        { text = "Has that happened?", next = "roof" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roof = {
      lines = {
        { id = "roof_1", text = "Once, pal, one time! It was a small roof, it was mostly thatch, and I maintain the fire was already going when my flask landed on it. I paid, though. In Booty Bay you pay the Baron or you swim." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    charge = {
      big = true,
      lines = {
        { id = "charge_1", text = "Sure, anyone could find it, the way I found it, which is by blowing up two benches and losing the feeling in this thumb. What I sell is the part where you skip that, pal, and I think it's cheap at the price." },
      },
      choices = {
        { text = "Fair. Hard-won knowledge is worth paying for.", next = "BACK", reply = "See, that's a student who's gonna keep all ten fingers.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Knowledge should be shared freely, not sold.", next = "BACK", reply = "And rent should be free and herbs should fall from the sky, friend. Meantime, I've got a price list.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "sells_1", text = "Healing draughts to the sailors, swiftness potions to folks leaving town in a hurry, and anything that cures a hangover, which in this port outsells the other two together. I teach all three, and I'd learn the third one first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = {
        { id = "supply_1", text = "Now you're talking my language! I can't put it in writing, on account of Glyx reads, but you bring me kingsblood and liferoot at a fair rate and I'll remember your face very fondly. Quietly, pal, quietly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    venture_company = { { id = "tp_y_venture_company", text = "They strip the jungle for whatever sells and leave the herbs trampled. Bad neighbours, pal, and worse for my supply costs." } },
    bloodsail = { { id = "tp_y_bloodsail", text = "Pirates buy swiftness potions by the case, friend, and I've never once asked which direction they're plannin' to run." } },
    background = { { id = "tp_background", text = "Steamwheedle trained, self-employed, fully insured since the roof thing. I've been on this boardwalk nine years and I've only been asked to move twice." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel keeps the port open and takes its cut, and in return nobody shoots anybody on the boardwalk. For a goblin town, that's practically a monastery." } },
    rumors = { { id = "tp_rumors", text = "Somebody's been buying up every vial in town, crates of 'em, for delivery up the coast to Duskwood. I didn't ask, pal, and neither should you." } },
    advice = { { id = "tp_advice", text = "Label everything, and never taste to check. That's two rules, and I learned each one separately." } },
    _none = { { id = "tp_none", text = "Not my field, friend. If it doesn't bubble, I can't help ya." } },
  },
}

-- McGavan: a smith of the Mithril Order in Booty Bay, who judges armorsmiths and sends the worthy to Galvan the Ancient.
P:NPC {
  key = "mcgavan", id = TODO_NPC("McGavan"), name = "McGavan", title = "The Mithril Order", gender = "male",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "stern", "measured" }, values = { "craft", "honor" },
  notices = { "craft", "race" },
  impression = {
    first = "McGavan stands for the Mithril Order in Booty Bay and looks at a smith's hands before hearing a word. Those he approves of go into the jungle to find Galvan the Ancient; the rest are told to come back with more callus.",
    third = "{name} met McGavan of the Mithril Order in Booty Bay.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you've come about the Order, show me your hands; if you haven't, the taverns are that way." },
    { id = "g_2", when = { metBefore = true }, text = "You're back. Has the hammer arm improved, or only the stories?" },
    { id = "g_3", when = { questActive = TODO_QUEST("The Mithril Order") }, text = "You have my word for Galvan. Go north, past the arena and the lake, and look for forge smoke south of the troll city's gates." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith, and one who works at it, by those forearms. The Order may have use for you, depending on what you've made and how honestly you'll speak of its faults." },
    { id = "n_2", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf at a goblin port. Galvan will be glad of it; he says the Order's best have always come down from Khaz Modan with an anvil on their backs." },
    { id = "n_3", cat = "craft", when = { profession = "Mining" },
      text = "You dig your own ore. That's the half of smithing most forget, and the first thing Galvan asks about." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "I am McGavan, of the Mithril Order. We are armorsmiths, a small company and a strict one, and my part is to stand in this port and decide who is worth sending on to our master in the jungle." },
        { id = "hello_2", when = { questDone = TODO_QUEST("The Mithril Order") }, text = "McGavan, of the Mithril Order, and you've been to Galvan and back. He sent word of you by a trader, and it was three sentences long, which from him is a speech." },
        { id = "hello_3", when = { profession = "Blacksmithing" }, text = "I am McGavan, of the Mithril Order, and you are a smith, so we may talk plainly. The Order takes armorsmiths of proven skill and makes them better, and it takes no one who thinks they've nothing left to learn." },
      },
      again = {
        { id = "hello_again1", text = "Is there something more?" },
        { id = "hello_again2", text = "Go on. I've time, between ships." },
        { id = "hello_again3", text = "Ask. Briefly, if it isn't about steel." },
      },
      choices = {
        { text = "What is the Mithril Order?", next = "order" },
        { text = "Who is Galvan the Ancient?", next = "galvan" },
        { text = "Any smith can make armour. Why an Order?", next = "why" },
        { text = "I work a forge. Would the Order have me?", next = "have", when = { profession = "Blacksmithing" } },
        { text = "I've met Galvan. He's as loud as you said.", next = "met", when = { questDone = TODO_QUEST("The Mithril Order") } },
        { text = "Why wait for smiths in Booty Bay?", next = "port" },
        { text = "Good day, McGavan.", next = "END" },
      },
    },
    order = {
      lines = {
        { id = "order_1", text = "A brotherhood of armorsmiths who hold that mithril is the noblest metal a hammer can meet, and that it deserves better than most smiths give it. We keep the old methods, and we pass them to those who earn them, and to nobody for coin." },
      },
      choices = {
        { text = "How does a smith earn them?", next = "earn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earn = {
      lines = {
        { id = "earn_1", text = "By work, and by honesty about it. A master of the trade who has chosen armour over blades comes to me, and if I judge the choice was made for love of the craft, I send {g:him|her} on. The rest is between the smith and Galvan." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    galvan = {
      lines = {
        { id = "galvan_1", text = "Our master, and the finest armorsmith I've known. He spent a decade in the Alterac peaks learning what truesilver will and won't do, and he has a camp now in the north of this jungle, near the old troll city, because he says the quiet suits the work." },
        { id = "galvan_2", when = { race = "Dwarf" }, text = "Our master, and a kinsman of yours, though he's been south so long he's half jungle. A decade in the Alterac peaks over truesilver, and a forge now near the old troll city; he'll call you cousin and then find fault with your tongs." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "why_1", text = "Any smith can make a thing shaped like armour. The Order exists because there's a difference between that and a breastplate someone will stake a life on, and because that difference dies with a master unless he's made to hand it down." },
      },
      choices = {
        { text = "A craft kept to a high standard is worth guarding.", next = "BACK", reply = "It is. I'm glad to hear it said by someone outside the Order.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Closed brotherhoods hoard what everyone should be free to learn.", next = "BACK", reply = "We turn away the unready, not the unknown. But I've heard the charge before.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    have = {
      lines = {
        { id = "have_1", text = "That's Galvan's judgement in the end, but I'll tell you how I make mine. Bring me to believe you'd sooner scrap a flawed piece than sell it, and that you mine or know your ore, and you'll have my word to carry north." },
        { id = "have_2", when = { questActive = TODO_QUEST("The Mithril Order") }, text = "You've my word already, and it's in your pack. Don't stand here polishing your case; the man you need to convince is at a forge in the jungle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    met = {
      lines = {
        { id = "met_1", text = "I said he was a great smith. I may have left the volume for you to discover. Did he tell you truesilver was a liar? He tells everyone, and he's not wrong, and he's never forgiven it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    port = {
      lines = {
        { id = "port_1", text = "Because every smith on two continents passes through this port sooner or later, for ore or for passage. The trainers in the great cities know to send their best to me, and the Baron doesn't care who stands on his boardwalk so long as they pay for their supper." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "A smith of Stormwind, once, and of the Order since Galvan threw my first breastplate in a river. He was right to." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The goblins keep the peace here for their own profit, and that suits the Order. We take smiths from either side of the war." } },
    rumors = { { id = "tp_rumors", text = "There's a smith in Gadgetzan named Lighthammer that Galvan calls his finest pupil. I'd not say it in front of the others he's taught." } },
    advice = { { id = "tp_advice", text = "Scrap the flawed piece. If you can't bring yourself to, you're a merchant and not a smith." } },
    _none = { { id = "tp_none", text = "I couldn't say. My knowledge begins at the anvil and ends at the quench." } },
  },
}

-- Riggle Bassbait: runs the Stranglethorn Fishing Extravaganza from a dock in Booty Bay each Sunday, with his assistant Jang and the Fishbot 5000.
P:NPC {
  key = "riggle_bassbait", id = TODO_NPC("Riggle Bassbait"), name = "Riggle Bassbait", title = "Fishmaster", gender = "male",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "loud", "showman" }, values = { "profit", "sport" },
  notices = { "craft", "purse" },
  impression = {
    first = "Riggle Bassbait runs the Stranglethorn Fishing Extravaganza from a Booty Bay dock and announces everything as if a crowd were listening. On Sundays one is; the rest of the week he practises on whoever walks past.",
    third = "{name} met Riggle Bassbait, the fishmaster who runs Booty Bay's fishing tournament.",
  },
  greetings = {
    { id = "g_default", text = "Step right up, step right up! Riggle Bassbait, Fishmaster, home of the Stranglethorn Fishing Extravaganza, every Sunday, rain or pirates!" },
    { id = "g_2", when = { metBefore = true }, text = "Back again, champ! You've got the look of somebody who's been practisin' their cast." },
    { id = "g_3", when = { questDone = TODO_QUEST("Master Angler") }, text = "Ladies and gentlemen, a Master Angler walks among us! Sorry, pal, force of habit. Good to see ya." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Fishing" },
      text = "Now that's an angler's squint if I ever saw one! Pal, you and I need to talk about Sunday, and what you're doin' with it." },
    { id = "n_2", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! You know what a Speckled Tastyfish does in a hot pan, friend? Neither do I, I sell 'em too fast, but Jang swears by it." },
    { id = "n_3", cat = "purse", when = { money = { max = 1000 } },
      text = "Light purse, huh? Pal, the tournament's free to enter and the prizes ain't, which is the best arithmetic you'll hear in this port." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Riggle Bassbait, Fishmaster to Baron Revilgaz's own Booty Bay! Every Sunday afternoon the call goes up along the whole coast, and the first angler to slap forty Speckled Tastyfish on this dock is the Master Angler, with a prize to prove it." },
        { id = "hello_2", when = { profession = "Fishing" }, text = "Riggle Bassbait, Fishmaster, and you fish, so listen close. Sunday afternoon, forty Speckled Tastyfish, first one back to this dock wins, and there's rare fish out there worth a prize of their own if your line finds 'em." },
      },
      again = {
        { id = "hello_again1", text = "What else, champ? I've got a crowd to imagine." },
        { id = "hello_again2", text = "Go on, go on, the fish aren't goin' anywhere till Sunday." },
        { id = "hello_again3", text = "Ask away, pal!" },
      },
      choices = {
        { text = "How does the tournament work?", next = "works" },
        { text = "Who are Jang and the Fishbot?", next = "crew" },
        { text = "It's a great deal of fuss over fish.", next = "fuss" },
        { text = "Where do the Tastyfish school?", next = "school", when = { profession = "Fishing" } },
        { text = "I won your tournament. What now?", next = "won", when = { questDone = TODO_QUEST("Master Angler") } },
        { text = "Why does the Baron pay for a fishing contest?", next = "baron" },
        { text = "I'll see you Sunday, maybe.", next = "END" },
      },
    },
    works = {
      lines = {
        { id = "works_1", text = "Simple, pal, which is why it's beautiful. The shout goes up, the schools of Tastyfish show along the coast, and everybody with a pole goes mad for two hours. First to bring me forty wins, and everybody else sells their catch to Jang and tells me they nearly had it." },
      },
      choices = {
        { text = "And the rare fish?", next = "rare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rare = {
      lines = {
        { id = "rare_1", text = "There's a few oddities swimmin' with the schools, a rockfish, a swordfish, a big ugly bass, and the Fishbot 5000 pays out for the largest of each. So even if you're slow, friend, you might be lucky, and I'm told lucky spends the same." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crew = {
      lines = {
        { id = "crew_1", text = "Jang's my apprentice, buys up the spare Tastyfish and keeps the tally, and never smiles, which is good for business since nobody argues with him. The Fishbot 5000 weighs the rare ones, on account of a machine can't be bribed, or anyway nobody's found where to put the coin." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fuss = {
      big = true,
      lines = {
        { id = "fuss_1", text = "Fuss? Pal, for two hours every Sunday, orcs and humans stand on the same beach and the only thing they fight over is a fishing hole. The Baron's bruisers get an afternoon off. You show me anything else on this coast that does that." },
      },
      choices = {
        { text = "A contest that keeps the peace is worth the noise.", next = "BACK", reply = "That's goin' on the poster, champ, word for word.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "It's a goblin scheme to sell fish and drinks.", next = "BACK", reply = "It's that too, friend! I never said it wasn't. A thing can be two things.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    school = {
      lines = {
        { id = "school_1", text = "All along the coast, pal, from the Wild Shore up to the Savage Coast by Grom'gol and round to Yojamba Isle. Look for the water boilin' with fins, get there before the other fella, and don't waste a cast in open water on a Sunday." },
        { id = "school_2", when = { faction = "Horde" }, text = "All along the coast, and you've got the Grom'gol shore right there, friend, which the Alliance has to swim past. Look for the water boilin' with fins, and get there first." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    won = {
      lines = {
        { id = "won_1", text = "Now you come back next Sunday and defend it, champ! And the one after. I've got anglers who've won a dozen times and still row out at dawn to scout the schools, because once you've heard me shout your name, pal, nothing else does it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    baron = {
      lines = {
        { id = "baron_1", text = "Because every angler who comes for the contest eats in his taverns, sleeps in his inn and repairs their boots at his smith. The prizes cost a little and the port takes in a lot, and the Baron likes any sum that comes out that way round." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "Born on a Steamwheedle trawler, pal, and I was guttin' fish before I could count the profit on 'em. The Baron gave me the dock, and I gave him Sundays." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel sponsors the Extravaganza, friend, and the Cartel never sponsors a loss. Read into that what ya like." } },
    bloodsail = { { id = "tp_bloodsail", text = "Pirates can fish in my contest same as anybody, if they can get to my dock before the bruisers get to them. That's why I stand out on the end of it." } },
    advice = { { id = "tp_advice", text = "Scout the schools Saturday night, and fish the far ones first. Everybody runs to the near one." } },
    _none = { { id = "tp_none", text = "If it hasn't got fins, pal, I've got no patter for it." } },
  },
}

-- Cowardly Crosby: a freewheeling trader selling tailoring supplies in a Bloodsail camp on the Wild Shore.
P:NPC {
  key = "cowardly_crosby", id = TODO_NPC("Cowardly Crosby"), name = "Cowardly Crosby", title = "Tailoring Supplies", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = {}, temper = { "nervous", "wheedling" }, values = { "survival", "profit" },
  notices = { "kit", "craft" },
  impression = {
    first = "Cowardly Crosby sells thread and cloth in a pirate camp on the Wild Shore and flinches whenever a Bloodsail walks behind him. He says he is a neutral trader, loudly, several times a day, in case anyone has forgotten.",
    third = "{name} met Cowardly Crosby, a trader selling tailoring supplies among the Bloodsail on the Wild Shore.",
  },
  greetings = {
    { id = "g_default", text = "Don't shoot! I'm a trader, an independent trader, I'm with nobody at all. Oh, you're a customer. Good, good, come closer, but not quickly." },
    { id = "g_2", when = { metBefore = true }, text = "Oh, thank goodness, it's only you. I thought you were the bosun wanting his shirt." },
    { id = "g_3", when = { class = "ROGUE" }, text = "I didn't see you there, which I'm sure is the point. I've nothing worth stealing, friend, only thread, and I'll sell it to you very cheaply." },
  },
  notice = {
    { id = "n_1", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been fighting your way along this beach, haven't you? Please tell me it wasn't with anyone who knows I'm here." },
    { id = "n_2", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Oh, that's a relief, somebody who only wants thread. I've a pattern or two the pirates don't know I kept back." },
    { id = "n_3", cat = "kit", when = { minLevel = 40 },
      text = "You look as though you could clear this whole camp. I'm not asking you to, mind, I'm only observing it, as a neutral party." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Crosby's the name. They call me Cowardly, and I've decided to take it as a description of my business methods, which are cautious. I sell thread, cloth and patterns to anyone, and I mend sails for the Bloodsail so that they go on letting me." },
        { id = "hello_2", when = { profession = "Tailoring" }, text = "Crosby, and you're of the trade, so I'll show you the good bolts. I'd sooner sell to a tailor than stitch another skull and crossbones, though I'd thank you not to repeat that near the tents." },
      },
      again = {
        { id = "hello_again1", text = "Was there something else? Quietly, if you would." },
        { id = "hello_again2", text = "Go on, but keep an eye over my shoulder for me." },
        { id = "hello_again3", text = "Yes? Yes, what is it?" },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Why trade in a pirate camp?", next = "why" },
        { text = "How did you get that name?", next = "name" },
        { text = "You're no neutral. You're supplying pirates.", next = "supply" },
        { text = "What patterns did you keep back?", next = "patterns", when = { profession = "Tailoring" } },
        { text = "I'm looking into the Bloodsail for Booty Bay.", next = "spy", when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") } },
        { text = "Have you thought of escaping?", next = "escape" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_1", text = "I didn't choose it, friend. I was on a merchantman bound for Booty Bay with a hold full of cloth, and the Bloodsail took the ship, and when they found I could sew they kept me and the cloth both." },
      },
      choices = {
        { text = "And they let you sell to strangers?", next = "let" },
        { text = "Something else.", next = "BACK" },
      },
    },
    let = {
      lines = {
        { id = "let_1", text = "So long as they get a share, and so long as their sails get mended first. A pirate's a practical man about anything that brings in coin, and I've made very sure I bring in a little." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "name_1", text = "When they boarded, the captain asked who'd fight and who'd serve, and I'm told I answered before he'd finished asking. The crew thought it was the funniest thing they'd seen that voyage, and the name's kept me alive since, so I've stopped minding." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      big = true,
      lines = {
        { id = "supply_1", text = "I mend their sails, yes, and I'd be at the bottom of the bay if I didn't. I've not lifted a blade for them, and I never will. A man can be frightened and still not be one of them, can't he?" },
      },
      choices = {
        { text = "You're a prisoner doing what you must to survive.", next = "BACK", reply = "That's it exactly, and thank you. It's been a long while since anyone said so.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Every sail you mend carries them to another ship.", next = "BACK", reply = "I know it. I think about it every night, and in the morning I thread the needle again.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    patterns = {
      lines = {
        { id = "patterns_1", text = "An admiral's hat, which the crew think is only for officers, and a swashbuckler's shirt in red that's finer than anything this crew deserves. Buy what you like, only don't wear the hat within sight of the camp." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spy = {
      lines = {
        { id = "spy_1", text = "For the Baron? Then you didn't hear this from me. They've three ships lying off the coast to the south, and the captains row ashore to argue over who strikes Booty Bay first. Now please, buy something, so this looks like trade." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    escape = {
      lines = {
        { id = "escape_1", text = "Every night, friend, in great detail. Booty Bay is just round the cape, and I can see its lamps from the tide line. But there are Bloodsail between here and there, and sharks besides, and I've never claimed to be anything but what they call me." },
        { id = "escape_2", when = { minLevel = 40 }, text = "Every night. And you look like someone who could walk me out of here past the whole camp, which I'm not asking you to do. I've mended their sails, you see, and the Baron's men might not stop to hear why." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    rumors = { { id = "tp_y_rumors", text = "The crew say there's a Booty Bay man who's gone over to their side. I sew his sort of shirt for nobody here, so I can't tell you who." } },
    background = { { id = "tp_background", text = "A cloth merchant's clerk from Stormwind. I took one sea voyage to see the world, and this is the part of the world I've seen." } },
    bloodsail = { { id = "tp_bloodsail", text = "They're at war with Booty Bay, and they talk of little else. I nod, and I sew, and I agree with whoever's nearest." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "If the Baron's bruisers ever come for this camp, I mean to be the first one with my hands up." } },
    advice = { { id = "tp_advice", text = "When armed men ask you a question, answer quickly. It's worked for me so far." } },
    _none = { { id = "tp_none", text = "I don't know, and I'd rather not be seen thinking about it." } },
  },
}

-- Knaz Blunderflame: a gnome selling engineering supplies from a hidden hilltop camp south of the Mosh'Ogg ogre mound.
P:NPC {
  key = "knaz_blunderflame", id = TODO_NPC("Knaz Blunderflame"), name = "Knaz Blunderflame", title = "Engineering Supplies", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = {}, temper = { "cheerful", "scattered" }, values = { "invention", "curiosity" },
  notices = { "craft", "race" },
  impression = {
    first = "Knaz Blunderflame sells engineering supplies from a hilltop above the Mosh'Ogg ogres, which he chose for the view and the privacy. He is delighted and slightly alarmed that anyone found the path.",
    third = "{name} met Knaz Blunderflame, a gnome engineer hidden on a hill above the Mosh'Ogg ogre mound.",
  },
  greetings = {
    { id = "g_default", text = "Oh! A visitor! You found the path, which means either you're very observant or my camouflage netting has a fault, and I'd like to know which." },
    { id = "g_2", when = { metBefore = true }, text = "You found it twice! That rules out luck, statistically. Come in, come in, mind the tripwire, it only rings a bell." },
    { id = "g_3", when = { profession = "Engineering" }, text = "Is that a gyromatic spanner on your belt? A colleague! Oh, this is splendid, I haven't talked torque with anyone in weeks." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Engineering" },
      text = "You've got solder burns in exactly the places I have. I've schematics up here you won't find in any shop, because no shop would insure them." },
    { id = "n_2", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, all the way out here! Have you news of Tinker Town? I get it third-hand from goblins, and I adjust for bias, but the error bars are enormous." },
    { id = "n_3", cat = "craft", when = { profession = "Mining" },
      text = "A miner! There's a rather good mithril seam on the north face of this very hill, about forty feet below an ogre, which I mention for completeness." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Knaz Blunderflame, engineering supplies, field office! I sell parts, powder and one or two schematics of my own devising, and I chose this hill because nothing I test up here can damage anything that belongs to anyone I like." },
        { id = "hello_2", when = { faction = "Horde" }, text = "Knaz Blunderflame, engineering supplies. You're Horde, and I'm a gnome on a hill with a great many explosives, so let's agree that science is neutral and that you'd like to buy something." },
      },
      again = {
        { id = "hello_again1", text = "Anything else? I've a fuse running, but it's a long one." },
        { id = "hello_again2", text = "Go on, I'm listening with at least sixty percent of my attention!" },
        { id = "hello_again3", text = "Yes? Ask, ask, I don't mind." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why set up shop above an ogre mound?", next = "why" },
        { text = "What are you testing up here?", next = "testing" },
        { text = "This is reckless. You'll get yourself killed.", next = "reckless" },
        { text = "What schematics won't a shop insure?", next = "schematics", when = { profession = "Engineering" } },
        { text = "Why aren't you in Ironforge with the rest of us?", next = "ironforge", when = { race = "Gnome" } },
        { text = "Are you kin to Gnaz Blunderflame, in Booty Bay?", next = "gnaz" },
        { text = "I'll find my own way down.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_1", text = "Three reasons! One, it's level on top. Two, the ogres never look up, which I've verified over one hundred and twelve days of observation. Three, when something does go wrong, the debris falls on ogres, and nobody has ever sent me a bill for an ogre." },
      },
      choices = {
        { text = "Don't the ogres ever climb up?", next = "climb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    climb = {
      lines = {
        { id = "climb_1", text = "One did, on day forty-one. He ate a crate of blasting powder, thinking it was pepper, and then sat rather too close to my campfire. The others seem to have drawn a conclusion from it, which I hadn't thought ogres did." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    testing = {
      lines = {
        { id = "testing_1", text = "A deepdive helmet, for breathing underwater, which works beautifully provided you don't need to see, and a rocket boot improvement that I'd describe as eighty percent boot. Also a new fuse compound, which is what that hissing is, and don't worry about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    reckless = {
      big = true,
      lines = {
        { id = "reckless_1", text = "Reckless would be doing this in a city! I've put four miles and an ogre tribe between my work and anybody it could hurt. I call that the most responsible laboratory in the Eastern Kingdoms, and the least visited, and those two facts are related." },
      },
      choices = {
        { text = "You've thought it through. Bold work needs room to fail.", next = "BACK", reply = "Exactly! Failure is just a result with a louder report.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Some things shouldn't be built, however far away you build them.", next = "BACK", reply = "Oh dear. That's what the High Tinker's safety board said. I do take the point, a little.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    schematics = {
      lines = {
        { id = "schematics_1", text = "The deepdive helmet, for one, and a goblin-pattern rocket fuel I reverse-engineered from a zeppelin that came down nearby. That one I sell with a signed waiver, and the waiver is longer than the schematic." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ironforge = {
      lines = {
        { id = "ironforge_1", text = "I was, in Tinker Town, after Gnomeregan. But it's very hard to think with ten thousand of us in one cavern, all grieving and all inventing at once, and the dwarves have rules about detonations indoors. So I came where the only neighbours are ogres." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gnaz = {
      lines = {
        { id = "gnaz_1", text = "Gnaz! Yes, we're family, and he has the sensible shop on the boardwalk with a counter and a roof. He sends up powder and tinned fish, and I send down anything I've made that's safe to sell in a town, which is about one item in six." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    steamwheedle = { { id = "tp_y_steamwheedle", text = "Goblin engineering is fast, cheap and loud, and gnomish engineering is slow, dear and loud. Gnaz says we've more in common than either side will admit." } },
    rumors = { { id = "tp_y_rumors", text = "A goblin trader told me somebody in Booty Bay has lost a whole ship to a navigation device. I'd love to see the device, and I'd hate to have been on the ship." } },
    background = { { id = "tp_background", text = "Gnomeregan born, Tinker Town briefly, and now here. I count this as my third laboratory and the only one I haven't had to evacuate." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We lost it to our own mistakes, you know, and I think about that with every fuse I cut. It's why I work where I can only hurt myself." } },
    venture_company = { { id = "tp_venture_company", text = "Their shredders are crude, wasteful and very fast, and I'd dearly love to take one apart. I've asked several adventurers to bring me a piece." } },
    advice = { { id = "tp_advice", text = "Cut your fuse twice as long as you think you need, and then run as though you'd cut it half." } },
    _none = { { id = "tp_none", text = "I've no data on that, I'm afraid, and I never speculate without data. Well, rarely." } },
  },
}

-- Corporal Kaleb: cooks for the Rebel Camp in northern Stranglethorn; his mechanical pot, built by the goblin Krazek, has broken.
P:NPC {
  key = "corporal_kaleb", id = TODO_NPC("Corporal Kaleb"), name = "Corporal Kaleb", gender = "male",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "rebel_camp" }, temper = { "weary", "good-natured" }, values = { "duty", "comrades" },
  notices = { "hunger", "craft", "soldier" },
  impression = {
    first = "Corporal Kaleb cooks for the Rebel Camp over an open fire and misses his mechanical cooking pot more than he misses Stormwind. He judges the camp's spirits by how much is left in the bowls.",
    third = "{name} met Corporal Kaleb, the Rebel Camp's cook, in northern Stranglethorn.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Rebel Camp. If you're hungry, there's stew, and if you've eaten army stew before, you'll know not to ask what's in it." },
    { id = "g_2", when = { metBefore = true }, text = "Back again? There's a bowl for you, if you can face it." },
    { id = "g_3", when = { questActive = TODO_QUEST("Krazek's Cookery") }, text = "Any luck with Krazek? The lads have had boiled raptor three nights running, and the grumbling's getting organised." },
    { id = "g_4", when = { questDone = TODO_QUEST("Return to Corporal Kaleb") }, text = "There {g:he|she} is, the saviour of supper! Sit down, and taste what a proper pot can do." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Cooking" },
      text = "You cook, don't you? You winced at the smell before you were through the gate. Don't judge me by tonight, friend; I'm working with a campfire and a bent kettle." },
    { id = "n_2", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look as if the jungle's had the better of you. Sit by the fire and eat something before you report to the Lieutenant." },
    { id = "n_3", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A proper soldier. Then you know an army marches on its stomach, and you'll forgive me for saying ours has been limping." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Corporal Kaleb, and I feed this camp, or I did. I'd a mechanical cooking pot from a goblin named Krazek, a marvel of a thing that stewed and stirred on its own, and it's broken, and I'm back to a kettle over a fire like my grandmother." },
        { id = "hello_2", when = { questDone = TODO_QUEST("Return to Corporal Kaleb") }, text = "Corporal Kaleb, and thanks to you I'm a cook again and not a man burning things in a kettle. The pot's back on the fire, and the lads have stopped looking at me like I'd betrayed the crown." },
        { id = "hello_3", when = { questActive = TODO_QUEST("Krazek's Cookery") }, text = "Corporal Kaleb. You've got my pot, so I'll say it again; Krazek's at Nesingwary's camp, down the road and across the river, and he's the only one alive who knows what's inside the thing." },
      },
      again = {
        { id = "hello_again1", text = "Something else? The kettle wants watching." },
        { id = "hello_again2", text = "Go on, I can stir and talk." },
        { id = "hello_again3", text = "Aye, what is it?" },
      },
      choices = {
        { text = "Tell me about this cooking pot.", next = "pot" },
        { text = "What does the camp eat out here?", next = "eat" },
        { text = "How are the men holding up?", next = "men" },
        { text = "A cook is wasted in a place like this.", next = "wasted" },
        { text = "What would you make of jungle game, with a good pot?", next = "game", when = { profession = "Cooking" } },
        { text = "How's the pot working since Krazek mended it?", next = "mended", when = { questDone = TODO_QUEST("Return to Corporal Kaleb") } },
        { text = "Carry on, Corporal.", next = "END" },
      },
    },
    pot = {
      lines = {
        { id = "pot_1", text = "Krazek built it, and I bought it off him with a month's pay when we first came south. You put in meat, water and whatever grows, and you wind it, and it keeps an even heat and stirs itself while you're off on patrol." },
      },
      choices = {
        { text = "How did it break?", next = "broke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    broke = {
      lines = {
        { id = "broke_1", text = "One of the privates wound it too tight, wanting his supper faster, and something inside went off like a crossbow. I don't blame the lad, much. But I can't mend it, and Krazek's with the dwarf's hunting party to the south, so I need somebody to carry it to him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    eat = {
      lines = {
        { id = "eat_1", text = "Raptor, mostly, and tiger when the patrols are lucky, and a root Brother Nimetz swears is safe. Stormwind sends us hard biscuit twice a season, and the weevils in it are the freshest meat we get from home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    men = {
      lines = {
        { id = "men_1", text = "Tired, and angry, since it's our own old comrades we're fighting up in those hills. Lieutenant Doren keeps them sharp and Sergeant Yohwa keeps them moving, and I keep them fed, and of the three I'm the one they complain to." },
        { id = "men_2", when = { questDone = TODO_QUEST("Colonel Kurzen") }, text = "Better than they've been in a year, since word came that Kurzen's dead. They sat up half the night by my fire and hardly spoke, and nobody left a scrap in the pot.", fx = { learn = { "kurzen" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wasted = {
      big = true,
      lines = {
        { id = "wasted_1", text = "That's kind, I suppose, but look at it from the fire. A man who's fought his old friends all day and comes back to a hot bowl has one thing in the world that's gone right. I'd not trade that post for a kitchen in Stormwind." },
      },
      choices = {
        { text = "You're doing as much for this camp as any sword.", next = "BACK", reply = "That's what the Lieutenant says, when the stew's good. Thank you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "They need another fighter more than they need a cook.", next = "BACK", reply = "I take my turn on the wall, friend. Then I come back and they still want feeding.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    game = {
      lines = {
        { id = "game_1", text = "Tiger wants long, slow stewing with something sour, and raptor's better seared quick or it goes to leather. With the pot, I could do both at once and be on patrol besides, which is what I keep telling the Lieutenant it's for." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mended = {
      lines = {
        { id = "mended_1", text = "Better than new. Krazek's put a little stop on the winding key, so nobody can do it again, and he sent a note saying the next repair costs double. Sergeant Yohwa had two bowls last night, and she's never had two of anything." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I was a cook's boy in the Stormwind barracks before I was a soldier. Colonel Kurzen's expedition wanted both, so I came south, and when he turned, I stayed with those who didn't." } },
    kurzen = { { id = "tp_kurzen", text = "We marched down here under him, and he was a good officer, once. Now he's up in that compound with the men who followed him, and we eat down here with our backs to the river." } },
    rumors = { { id = "tp_rumors", text = "The patrols say Kurzen's men have ogres fighting for them now. I'd like to know what he's feeding them, professionally speaking." } },
    advice = { { id = "tp_advice", text = "Boil the river water, and then boil it again. I've lost more men to that river than to arrows." } },
    _none = { { id = "tp_none", text = "Can't help you there. Ask the Lieutenant, he's the one who's meant to know things." } },
  },
}
