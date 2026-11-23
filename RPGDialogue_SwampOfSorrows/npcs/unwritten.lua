-- Swamp of Sorrows: the unnamed folk of Stonard a roster scan found with no conversation yet. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC = P.TODO_NPC

-- Stonard Orc: an ordinary orc of the Stonard garrison.
P:NPC {
  key = "sos_stonard_orc", id = TODO_NPC("Stonard Orc"), name = "Stonard Orc",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "stonard" }, temper = { "gruff", "weary" }, values = { "horde", "strength" },
  notices = { "race" },
  impression = {
    first = "An orc of Stonard, damp to the knees and in no mood for visitors. The swamp has clearly got into his temper.",
    third = "{name} spoke with one of the orcs who live in Stonard.",
  },
  greetings = {
    { id = "g_default", text = "Another traveller come to sink in the swamp. Speak your business, and mind the mud by the walls." },
    { id = "g_back", when = { metBefore = true }, text = "Still here? The swamp hasn't swallowed you yet, then. Give it time." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "One of our own blood! Sit, warrior, and tell me what news there is from Orgrimmar, because it takes a moon for word to reach this bog." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Stonard is the oldest Horde fortress on this side of the sea, built when the Horde first marched on Stormwind. We held it through the defeat and the camps, and we hold it now, even if the swamp tries to rot it out from under us." } },
      again = { { id = "h_again", text = "What else, then?" } },
      choices = {
        { text = "You held Stonard through the internment?", next = "held" },
        { text = "What's the worst thing in this swamp?", next = "swamp" },
        { text = "Do you miss the battle days?", next = "battle" },
        { text = "Lok'tar.", next = "END" },
      },
    },
    held = {
      lines = { { id = "hd_default", text = "Some of us hid in the swamp while the humans emptied the camps elsewhere, and we lived like beasts on frogs and roots. When Thrall freed our people, we were already here waiting, and Stonard was still ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    swamp = {
      lines = { { id = "s_default", text = "The trolls of the sunken temple, the Atal'ai, who pray to things that should stay drowned. The crocolisks are only hungry, but those trolls want something far worse than a meal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    battle = {
      lines = { { id = "b_default", text = "Some nights, yes, and I am not proud of it. The demon blood made the old wars sweet, and Thrall says we must remember that sweetness was a lie." } },
      choices = {
        { text = "Thrall is right. The old Horde was a curse.", next = "BACK", reply = "Spoken plainly. I believe it, even if my blood forgets sometimes.", fx = { align = { light = 1 } } },
        { text = "The old Horde was strong. There's no shame in that.", next = "BACK", reply = "Strong, yes, and blind. Careful you do not fall in love with what nearly destroyed us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am an orc of Stonard, and I have known this swamp longer than I knew freedom." } },
    _none = { { id = "tp_none", text = "Ask the Warlord's people. I only guard walls and wring out my boots." } },
  },
}

-- Stonard Hunter: one of the hunters who keep Stonard fed.
P:NPC {
  key = "sos_stonard_hunter", id = TODO_NPC("Stonard Hunter"), name = "Stonard Hunter",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "stonard" }, temper = { "quiet", "patient" }, values = { "practical", "horde" },
  notices = { "class" },
  impression = {
    first = "A Stonard hunter with mud to the hips and a string of fish and frogs at the belt. Hunting in the swamp is plainly unglamorous work.",
    third = "{name} spoke with one of the hunters of Stonard.",
  },
  greetings = {
    { id = "g_default", text = "Move softly here, stranger. The crocolisks hear a footstep long before you see them." },
    { id = "g_back", when = { metBefore = true }, text = "You came back with all your toes. You must be learning the swamp." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you know that a swamp hunts you back, and that the water tells you nothing until it is too late." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I hunt for the cookfires of Stonard, which means frogs, fish and crocolisk tail when the gods are kind. Nothing out here is fat, but everything out here has teeth." } },
      again = { { id = "h_again", text = "Speak, but quietly." } },
      choices = {
        { text = "What's good hunting around here?", next = "game" },
        { text = "Where shouldn't I go?", next = "danger" },
        { text = "Those crocolisk hides would make fine armor.", next = "hides" },
        { text = "Good hunting.", next = "END" },
      },
    },
    game = {
      lines = { { id = "g2_default", text = "The crocolisks along the Misty Reed shore, if you are strong, and the swamp jaguars in the reeds if you are quick. Bring me the meat and I will not ask who taught you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "The sunken temple in the middle of the swamp, where the Atal'ai trolls chant into the water. And Misty Valley to the west, where the lost ones live, who were something else once and are not anymore." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hides = {
      lines = { { id = "hd_default", text = "They would, if you could keep them from rotting, and in this wet that is half the craft. I take only what the camp needs and leave the rest for the next season." } },
      choices = {
        { text = "That's the right way. Take only what you need.", next = "BACK", reply = "The Earth Mother's people taught us that, and they were right.", fx = { align = { light = 1 } } },
        { text = "Take everything. The swamp will make more.", next = "BACK", reply = "Then come back next year and see how empty it is.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a hunter of Stonard, and the swamp is my larder and my enemy both." } },
    _none = { { id = "tp_none", text = "I know tracks and teeth, not that. Ask in the great hall." } },
  },
}

-- Stonard Shaman: a shaman of the Stonard garrison.
P:NPC {
  key = "sos_stonard_shaman", id = TODO_NPC("Stonard Shaman"), name = "Stonard Shaman",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "stonard" }, temper = { "calm", "grave" }, values = { "spirits", "horde" },
  notices = { "class" },
  impression = {
    first = "A shaman of Stonard, listening to the rain on the roofs as if it were saying something. Perhaps it was.",
    third = "{name} spoke with one of the shamans of Stonard.",
  },
  greetings = {
    { id = "g_default", text = "The waters are troubled today, traveller. Come in out of the rain, if you can find a place where it isn't raining." },
    { id = "g_back", when = { metBefore = true }, text = "The spirits remember you, and so do I. Welcome back." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You walk with the elements too. Then you feel it, the sickness in the water around that temple, like a fever that will not break." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I tend the spirits for Stonard, and in this swamp, the spirits of water outnumber all the rest. They are restless, because something old and wicked sleeps beneath the sunken temple." } },
      again = { { id = "h_again", text = "What else do you wish to know?" } },
      choices = {
        { text = "What sleeps under the temple?", next = "temple" },
        { text = "How did shamanism return to the orcs?", next = "return" },
        { text = "I don't believe in spirits.", next = "doubt" },
        { text = "Farewell, shaman.", next = "END" },
      },
    },
    temple = {
      lines = { { id = "t_default", text = "The trolls call him Hakkar, the Soulflayer, a god of blood their ancestors drowned along with their temple. His priests still pray to him down there, and the water carries their prayers like poison through the roots." } },
      choices = {
        { text = "Then the temple should be cleansed by force.", next = "BACK", reply = "Many have tried, and the swamp keeps their bones. Go strong, if you go.", fx = { align = { order = 1 } } },
        { text = "Leave the trolls be. Their god is their business.", next = "BACK", reply = "Their god does not stay their business. The water does not respect such lines.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["return"] = {
      lines = { { id = "r_default", text = "Thrall brought it back to us, after the warlocks led us away from the old ways and into the arms of demons. The spirits were slow to forgive, but they did forgive, and I am grateful every day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    doubt = {
      lines = { { id = "d_default", text = "The rain falls on you whether you believe in it or not. Stand in the swamp for a night and listen, and then tell me again what you do not believe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a shaman of the Horde, and the waters of this swamp have been my teachers for many years." } },
    _none = { { id = "tp_none", text = "The spirits are silent on that, and so am I." } },
  },
}

-- Stonard Explorer: a scout who walks the swamp's edges for the garrison.
P:NPC {
  key = "sos_stonard_explorer", id = TODO_NPC("Stonard Explorer"), name = "Stonard Explorer",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "stonard" }, temper = { "restless", "blunt" }, values = { "horde", "curious" },
  notices = { "race" },
  impression = {
    first = "A Stonard explorer, scratched and sunburned from paths that most of the garrison won't walk. Restless energy came off the orc like steam.",
    third = "{name} spoke with one of the explorers of Stonard.",
  },
  greetings = {
    { id = "g_default", text = "Back from the edge of the map, are you, or headed toward it? Either way, I envy you the dry roads." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Did you find anything worth the walk this time?" },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! Tell me, troll, can you make any sense of the carvings on that sunken temple, because I cannot." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I walk the swamp's edges for the garrison, from the Blasted Lands' red border to the Deadwind Pass. Somebody has to know what's out there before it comes knocking on our gates." } },
      again = { { id = "h_again", text = "Anything else? I leave at dusk." } },
      choices = {
        { text = "What's south, toward the Blasted Lands?", next = "south" },
        { text = "And west, toward Deadwind Pass?", next = "west" },
        { text = "Have you ever seen Stormwind?", next = "stormwind" },
        { text = "Safe travels.", next = "END" },
      },
    },
    south = {
      lines = { { id = "s_default", text = "Red earth and a broken sky, and the ruin of the Dark Portal, where the Horde first came into this world. The humans keep a fortress there called Nethergarde, and they watch the Portal like it might open again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    west = {
      lines = { { id = "w_default", text = "Dead trees and a silence that sits on your chest, and a tower in the pass that nobody goes near. Even the ogres give it a wide berth, which tells you plenty." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stormwind = {
      lines = { { id = "st_default", text = "From the hills, once, when I was young and the Horde burned it to the ground. They rebuilt it whiter and taller than before, I hear, and I don't know whether that should make me angry or ashamed." } },
      choices = {
        { text = "Burning it was a crime. Be ashamed.", next = "BACK", reply = "Maybe I am, and maybe that's why I keep walking.", fx = { align = { honor = 1 } } },
        { text = "It was war. The humans would have done the same.", next = "BACK", reply = "They did, after, in their camps. That doesn't make it sit easier.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an explorer for Stonard, and I've worn out more boots than I can count." } },
    _none = { { id = "tp_none", text = "Never walked that way, and never heard of it. Ask me again after my next trip." } },
  },
}

-- Stonard Cartographer: the garrison's mapmaker.
P:NPC {
  key = "sos_stonard_cartographer", id = TODO_NPC("Stonard Cartographer"), name = "Stonard Cartographer",
  bible = "bibles/missed.md", role = "scholar", tier = "service",
  communities = { "stonard" }, temper = { "fussy", "precise" }, values = { "order", "horde" },
  notices = { "race" },
  impression = {
    first = "A Stonard cartographer, an orc bent over damp parchment with ink to the wrists. Hearing a mapmaker complain about the rain is somehow new.",
    third = "{name} spoke with the cartographer of Stonard.",
  },
  greetings = {
    { id = "g_default", text = "Careful, careful, do not drip on the maps! The swamp has ruined three already this season." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the traveller. Have you anything for me, a path, a ruin, a river that moved?" },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, and in Stonard, which I will mark on my map as a very strange day. Keep your little fingers off my ink." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I make the maps that tell Stonard where the swamp ends and the dangers begin, which is harder than it sounds when the water moves every spring. Every scout who comes back tells me something, and I put it down before they forget it." } },
      again = { { id = "h_again", text = "Yes, yes, what else?" } },
      choices = {
        { text = "An orc mapmaker? That's unusual.", next = "orc" },
        { text = "What's the hardest place to map?", next = "hard" },
        { text = "Why does Stonard need maps at all?", next = "why" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    orc = {
      lines = { { id = "o_default", text = "Unusual now, but the Horde marched across half of Azeroth in the old wars, and somebody had to know the roads. I learned from an old raider who drew in the dirt with his axe, and I've only got neater since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hard = {
      lines = { { id = "hd_default", text = "The Pool of Tears around the sunken temple, because no scout who goes in close comes out willing to talk about it. I have a blank space there on every map, and I hate it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because an army that knows the land beats an army that is braver, and the Horde has learned that lesson in blood. Dispatch Commander Ruag wants to know every path an enemy could use to reach us." } },
      choices = {
        { text = "Knowledge wins wars. Your work matters.", next = "BACK", reply = "Finally, someone who understands! Tell the grunts that, they laugh at me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Courage wins wars, not parchment.", next = "BACK", reply = "Courage drowns in a bog it didn't know was there. Remember that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Stonard's mapmaker, and I know this swamp better on paper than most do on foot." } },
    _none = { { id = "tp_none", text = "It isn't on any of my maps, so I cannot help you." } },
  },
}

-- Stonard Wayfinder: guides travellers along the swamp paths.
P:NPC {
  key = "sos_stonard_wayfinder", id = TODO_NPC("Stonard Wayfinder"), name = "Stonard Wayfinder",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "stonard" }, temper = { "steady", "dry" }, values = { "duty", "horde" },
  notices = { "race" },
  impression = {
    first = "A Stonard wayfinder, an orc who leads travellers along the firm paths through the mire. He walked around one patch of ground I would have stepped straight into.",
    third = "{name} spoke with one of the wayfinders of Stonard.",
  },
  greetings = {
    { id = "g_default", text = "Lost already? Most folk are, the first time they leave the road in this swamp." },
    { id = "g_back", when = { metBefore = true }, text = "You found your way back. I'll take some of the credit for that." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren in the swamp! Step carefully, big one, because the mud here will hold a kodo to its belly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I know where the ground holds and where it swallows, and I lead the caravans and the new arrivals between Stonard and the roads. More grunts have been lost to the mire than to the trolls, and that is not a joke." } },
      again = { { id = "h_again", text = "What else do you need to know?" } },
      choices = {
        { text = "How do you tell firm ground from mire?", next = "ground" },
        { text = "Which road out is safest?", next = "roads" },
        { text = "I can find my own way.", next = "own" },
        { text = "Thanks, wayfinder.", next = "END" },
      },
    },
    ground = {
      lines = { { id = "g2_default", text = "Look for the reeds that grow upright and the roots that run along the top, because they only grow where there's something under them. If the water is still and bright, walk around it, every time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    roads = {
      lines = { { id = "r_default", text = "North through Deadwind Pass toward Duskwood, if you can stand the quiet, or south to the Blasted Lands if you have business with demons and ruins. The east is all coast and crocolisks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    own = {
      lines = { { id = "o_default", text = "Then go, and I'll see you again, or I'll see your boots sticking out of a bog. The swamp makes no promises, and neither do I." } },
      choices = {
        { text = "A good warrior trusts no one's path but their own.", next = "BACK", reply = "A good warrior, maybe. A live one listens.", fx = { align = { order = -1 } } },
        { text = "Fair enough. I'll follow the one who knows.", next = "BACK", reply = "Wise. Stay close and step where I step.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a wayfinder of Stonard, born to this swamp, and I have not lost a traveller yet." } },
    _none = { { id = "tp_none", text = "I know paths, not that. Ask at the inn." } },
  },
}

-- Broken Exile: one of the broken survivors of Draenor who shelter at the Harborage in the swamp.
P:NPC {
  key = "sos_broken_exile", id = 11198, name = "Broken Exile", gender = "male",
  role = "refugee", tier = "service",
  temper = { "weary", "wary" }, values = { "survival" },
  notices = { "race" },
  impression = {
    first = "A hunched, ashen-skinned exile who flinches at the sight of an orc's axe.",
    third = "{name} met a Broken Exile at the Harborage in the Swamp of Sorrows.",
  },
  greetings = {
    { id = "g_default", text = "You come to the Harborage, stranger. There is little here but mist and memory, but you may rest a while." },
    { id = "g_orc", when = { race = "Orc" }, text = "An orc. Your people burned my world. Say your piece and go, before my courage fails." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We are the Broken, what remains of a proud people from a world called Draenor. We came through the Dark Portal long ago, and now we hide in this swamp and wait." } },
      again = { { id = "h_again", text = "Is there more you would ask, stranger?" } },
      choices = {
        { text = "What happened to your people?", next = "people" },
        { text = "What do you wait for?", next = "wait" },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },
    people = {
      lines = { { id = "p_default", text = "The orcs fell upon us, driven mad by demon blood, and slaughtered our cities. Those of us who lived were twisted by the fel magic, and so we are broken, in body and in spirit." } },
      choices = {
        { text = "The orcs have changed since then.", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "So I hear, but the dead do not hear it, and neither do my nightmares. Perhaps one day I will believe it." } },
      choices = {
        { text = "Every people deserves a second chance.", next = "BACK", reply = "Perhaps. I am too tired to argue.", fx = { align = { order = -1 } } },
        { text = "Some crimes should never be forgotten.", next = "BACK", reply = "Then we understand each other, stranger.", fx = { align = { order = 1 } } },
      },
    },
    wait = {
      lines = { { id = "w_default", text = "For the end of our exile, or the end of ourselves, whichever comes first. The swamp is quiet, at least, and the trolls of the temple do not trouble us here." } },
      choices = { { text = "I hope it's the former. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am of the Broken. Once, that meant something else." } },
    _none = { { id = "tp_none", text = "I do not know, stranger. The mist keeps its own counsel, and so do I." } },
  },
}
