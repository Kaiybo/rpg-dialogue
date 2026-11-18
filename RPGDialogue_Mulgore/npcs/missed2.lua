-- Mulgore's merchants the roster scan found unwritten. Camp Narache's armory tent (Bronk Steelrage,
-- Marjak Keenblade, Varia Hardhide) and its general goods (Kawnie Softbreeze); Bloodhoof Village's
-- Harn Longcast, Kennah Hawkseye, Moorat Longstride and Wunna Darkmane, and Magrin Rivermane at the inn.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Bronk Steelrage: armorer and shieldcrafter in Camp Narache's armory tent.
---------------------------------------------------------------------------
P:NPC {
  key = "bronk_steelrage", id = TODO_NPC("Bronk Steelrage"), name = "Bronk Steelrage", title = "Armorer & Shieldcrafter", gender = "male",
  bible = "bibles/missed.md", role = "blacksmith", tier = "service",
  communities = { "narache" }, temper = { "gruff" }, values = { "craft", "protective" },
  notices = { "class", "kit" },
  impression = {
    first = "Bronk Steelrage works at the back of Camp Narache's armory tent among stacked shields, and he knocks on each one with a knuckle before he will sell it. His voice is rough, but he fits a strap with great care.",
    third = "{name} met Bronk Steelrage, the armorer and shieldcrafter of Camp Narache.",
  },
  greetings = {
    { id = "g_default", text = "Come in under the hide, {class}, and let me see what stands between you and the world." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and still whole, so either my work held or you were lucky." },
  },
  notice = {
    { id = "n_shield", cat = "class", when = { class = { "WARRIOR", "SHAMAN" } },
      text = "Yours is a calling that can carry a shield, and you should. A spear wins the fight, but it is the shield that lets you walk home from it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "By the Earth Mother, look at the state of those buckles. Take that off and let me mend it before it falls off you in front of a quilboar." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Bronk Steelrage, and I make the mail and the shields for the young of the Hawkwind camp. Marjak beside me will sell you something to hit with, but I am the one who sees that you live long enough to swing it twice." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up over the hammering." },
        { id = "h_again2", text = "Ask, and then let me measure your arm." },
      },
      choices = {
        { text = "What makes a good shield?", next = "shield" },
        { text = "You share the tent with two others.", next = "tent" },
        { text = "I've never fought behind a shield.", next = "never" },
        { text = "I'll look over your wares.", next = "END" },
      },
    },
    shield = {
      lines = { { id = "s_default", text = "Good wood under good hide, with iron only where the blow will land, because a shield you cannot lift by evening is no shield at all. I stretch kodo hide over the frame wet and let An'she shrink it tight." } },
      choices = {
        { text = "And the quilboar's thorns?", next = "shield_thorns" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shield_thorns = {
      lines = { { id = "st_default", text = "A Bristleback spear will stick in the hide and stay there, which is exactly what you want, since a quilboar without his spear is only an angry pig. Pull it out afterward and bring the shield to me to patch.", fx = { learn = { "quilboar" } } } },
      choices = { { text = "I'll remember. Something else.", next = "BACK" } },
    },
    tent = {
      lines = { { id = "t_default", text = "Marjak Keenblade has the weapons and Varia Hardhide the leathers, and between the three of us a young brave can be armed from horn to hoof without leaving the shade. We argue about whose work matters most, and I am right." } },
      choices = { { text = "Naturally. Something else.", next = "BACK" } },
    },
    never = {
      lines = { { id = "n_default", text = "Then you have been fortunate, or quick, and neither lasts. Ask Harutt Thunderhorn to show you how to set your feet behind one, for it is more than holding up a plank." } },
      choices = {
        { text = "My magic is my shield.", next = "BACK", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, reply = "So the spell-folk always tell me, and I hope for your sake that your magic never gets tired." },
        { text = "I'll speak to Harutt. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Steelrage have worked metal for the tribes since we first traded for it, and I came to Narache to arm the young." } },
    quilboar = { { id = "tp_qb", text = "Their spears are crude and their thorns are sharp, and my shields are made with both in mind." } },
    advice = { { id = "tp_adv", text = "Check your straps each morning, because it is always the strap that fails and never the shield." } },
    _none = { { id = "tp_none", text = "I know hide, wood and iron, and I leave the rest to the elders." } },
  },
}

---------------------------------------------------------------------------
-- Marjak Keenblade: weaponsmith in Camp Narache's armory tent.
---------------------------------------------------------------------------
P:NPC {
  key = "marjak_keenblade", id = TODO_NPC("Marjak Keenblade"), name = "Marjak Keenblade", title = "Weaponsmith", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "narache" }, temper = { "calm" }, values = { "craft", "respect" },
  notices = { "class" },
  impression = {
    first = "Marjak Keenblade lays out axes and maces on a blanket in Camp Narache's armory tent, each one turned so its edge catches the light. He hands a weapon over by the haft and watches how it is taken.",
    third = "{name} met Marjak Keenblade, the weaponsmith of Camp Narache.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, {class}. Hold out your hand, and I will tell you which of these was made for it." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to my blanket, and I hope the last edge I sold you has been honoured with good use." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You are a warrior, so we may speak plainly about weight and reach. Most who come to me only ask which one is the sharpest." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid will want a staff or a plain mace, I know. I keep a few, though I confess they are the least of my work." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Marjak Keenblade, and these are the first weapons most young tauren ever carry off the mesa. I make them plain and I make them honest, because a first weapon should teach you and not flatter you." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of me?" },
        { id = "h_again2", text = "Speak, and I will keep sharpening while you do." },
      },
      choices = {
        { text = "How do you choose a first weapon?", next = "choose" },
        { text = "What does a weapon mean to the tauren?", next = "meaning" },
        { text = "Bronk says his work matters most.", next = "bronk", when = { heardLine = "bronk_steelrage.t_default" } },
        { text = "Let me see what you have.", next = "END" },
      },
    },
    choose = {
      lines = { { id = "c_default", text = "You do not choose it by its edge, whatever my name may suggest. You pick it up, you swing it until your arm is tired, and if it still goes where you send it then it is yours." } },
      choices = {
        { text = "And if it doesn't?", next = "choose_not" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose_not = {
      lines = { { id = "cn_default", text = "Then it is too heavy, or you are too proud, and I can only mend one of those. Take the lighter axe and come back for the great one when the plainstriders have put some strength in your shoulders." } },
      choices = {
        { text = "I'll take the heavy one anyway.", next = "BACK", when = { class = "WARRIOR" }, reply = "Of course you will, and you will grow into it out of sheer stubbornness, as warriors do.", fx = { affinity = 1 } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    meaning = {
      lines = { { id = "m_default", text = "It is a tool of the hunt before it is a tool of war, and we give thanks over it either way. A tauren who has forgotten the first use will be too eager for the second.", fx = { learn = { "earth_mother" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bronk = {
      lines = { { id = "b_default", text = "Bronk says so every morning, and every morning I ask him how many cougars he has seen killed with a shield. He has no answer yet, but he is thinking hard about it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned the edge from my father, and I chose to sell to the young because they still listen." } },
    earth_mother = { { id = "tp_em", text = "The stone of the whetstone and the wood of the haft are both hers, and I try to waste neither." } },
    advice = { { id = "tp_adv", text = "Clean the blade before the blood dries, and thank the beast before you clean the blade." } },
    _none = { { id = "tp_none", text = "That is a question with no edge I can find, so take it to Chief Hawkwind." } },
  },
}

---------------------------------------------------------------------------
-- Varia Hardhide: leather armor merchant in Camp Narache's armory tent.
---------------------------------------------------------------------------
P:NPC {
  key = "varia_hardhide", id = TODO_NPC("Varia Hardhide"), name = "Varia Hardhide", title = "Leather Armor Merchant", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "narache" }, temper = { "practical" }, values = { "thrift", "craft" },
  notices = { "class", "craft" },
  impression = {
    first = "Varia Hardhide sits cross-legged in Camp Narache's armory tent with a half-stitched jerkin across her knees. Her leathers are stiff, plain and a little dusty, and she plainly thinks that is how leathers ought to be.",
    third = "{name} met Varia Hardhide, who sells leather armor at Camp Narache.",
  },
  greetings = {
    { id = "g_default", text = "Sit, {class}, and try a jerkin on while I finish this seam." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Let me see how the stitching has held before you tell me anything else." },
  },
  notice = {
    { id = "n_leather", cat = "class", when = { class = { "HUNTER", "DRUID", "ROGUE", "SHAMAN" } },
      text = "You will want leather, which means you want me and not that noisy pair with their iron. Hold your arms out and let me see the length of you." },
    { id = "n_skinner", cat = "craft", when = { profession = "Skinning" },
      text = "You carry a skinning knife, I see. Take the hide off cleanly and scrape it the same day, or do not trouble to bring it to anyone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Varia Hardhide, and I sell good plain leathers to those who are just setting out. They are not pretty, and by the time you have earned prettier ones you will be glad these were tough." },
      },
      again = {
        { id = "h_again", text = "What else? I can stitch and listen at once." },
        { id = "h_again2", text = "Ask it, then." },
      },
      choices = {
        { text = "Your leathers look a little dusty.", next = "dusty" },
        { text = "Where do the hides come from?", next = "hides" },
        { text = "How do you bear Bronk and Marjak?", next = "pair" },
        { text = "Show me what fits.", next = "END" },
      },
    },
    dusty = {
      lines = { { id = "d_default", text = "They are dusty because Red Cloud Mesa is dusty, and I see no sense in oiling a thing that will be rolled in the dirt by a battleboar before sundown. Dust does no harm to a hide that was cured properly." } },
      choices = {
        { text = "What makes a proper cure?", next = "dusty_cure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dusty_cure = {
      lines = { { id = "dc_default", text = "Smoke, patience and the beast's own fat worked in by hand, the way my grandmother did it on the trail when we had no tents that stayed in one place. The quick ways you will hear about in the cities make a hide that cracks in its first winter." } },
      choices = {
        { text = "I work leather myself.", next = "BACK", when = { profession = "Leatherworking" }, reply = "Then go and see Chaw Stronghide at Bloodhoof Village when you leave the mesa, for he teaches it better than I have patience to.", fx = { affinity = 1 } },
        { text = "The old way, then. Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "From the hunters of the camp, who bring me cougar and plainstrider and the odd wolf from below the mesa. Nothing is taken only for its skin, and I will not buy from anyone who hunts that way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pair = {
      lines = { { id = "p_default", text = "I let them argue over which of them keeps a brave alive, and I go on quietly dressing nearly everyone who walks in. They are good neighbours, and they would be better ones if iron made less noise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family has dressed hides for the Hawkwind for as long as anyone remembers, and the name was earned honestly." } },
    advice = { { id = "tp_adv", text = "Let wet leather dry slowly in the shade, and never beside the fire, however cold you are." } },
    earth_mother = { { id = "tp_em", text = "A hide is a gift twice over, once from the beast and once from her, and I do not waste gifts." } },
    _none = { { id = "tp_none", text = "I could not tell you, and I have a seam to finish." } },
  },
}

---------------------------------------------------------------------------
-- Kawnie Softbreeze: general goods at Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "kawnie_softbreeze", id = TODO_NPC("Kawnie Softbreeze"), name = "Kawnie Softbreeze", title = "General Goods", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "narache" }, temper = { "warm" }, values = { "kind", "community" },
  notices = { "race" },
  impression = {
    first = "Kawnie Softbreeze keeps the general goods at Camp Narache, with waterskins, pouches and bundles of kindling set out in neat rows. She packs a young traveller's bag as though it were her own calf's.",
    third = "{name} met Kawnie Softbreeze, who sells general goods at Camp Narache.",
  },
  greetings = {
    { id = "g_default", text = "Come and sit a moment, {class}. Have you water enough, and something to carry it in?" },
    { id = "g_back", when = { metBefore = true }, text = "There you are again, and I am glad to see you looking fed." },
    { id = "g_tauren", when = { race = "Tauren", maxLevel = 6 }, text = "You are about to walk your rites, little one, unless I am much mistaken. Let us make sure your pack is ready before your courage is tested." },
  },
  notice = {
    { id = "n_outsider", cat = "race", when = { race = { "Orc", "Troll", "Scourge" } },
      text = "We see few of your people up on the mesa, and you are welcome among us. The sun is stronger here than you may think, so drink before you are thirsty." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kawnie Softbreeze, and I sell the small things that nobody thinks of until they are a day's walk from camp. Every young tauren who leaves Narache passes my blanket first, and I have not yet let one go without a full waterskin." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you, dear one?" },
        { id = "h_again2", text = "Ask, and I will keep packing while you talk." },
      },
      choices = {
        { text = "What should a traveller carry?", next = "carry" },
        { text = "You've seen many young ones off.", next = "young" },
        { text = "The camp seems quiet today.", next = "camp" },
        { text = "Let me see your goods.", next = "END" },
      },
    },
    carry = {
      lines = { { id = "c_default", text = "You need water first, bread second, and a pouch to keep them out of the dust. After that take flint and a little wood, for a fire at night keeps the cougars thoughtful." } },
      choices = {
        { text = "And what should I leave behind?", next = "carry_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry_leave = {
      lines = { { id = "cl_default", text = "Leave anything you are carrying only because you are afraid. A heavy pack will tire you sooner than the plains will, and most of what you fear out there can be walked around." } },
      choices = { { text = "That's good sense. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    young = {
      lines = { { id = "y_default", text = "I have seen more than I can count, and I remember a surprising number of them. Some come back up the road seasons later, grown and scarred, and still let me check that their waterskin is full." } },
      choices = {
        { text = "You packed my first bag, Kawnie.", next = "BACK", when = { race = "Tauren" }, reply = "Did I? Then stand in the light and let me look at you, for you have grown, and I want to see whether you kept the strap mended.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "It is as quiet as the Bristleback allow, which is quieter some days than others. Moodan Sungrain's bread is baking, the braves are at their posts, and that is as much peace as a camp can ask for.", fx = { learn = { "quilboar" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I raised three calves of my own in this camp, and I suppose I have never stopped fussing over other people's." } },
    quilboar = { { id = "tp_qb", text = "They steal from our hunters and frighten the little ones, and I wish they would simply go and dig somewhere else." } },
    advice = { { id = "tp_adv", text = "Drink before you are thirsty and rest before you are tired, and you will walk twice as far." } },
    _none = { { id = "tp_none", text = "Oh, that is beyond me, dear one, but the chief will know." } },
  },
}

---------------------------------------------------------------------------
-- Harn Longcast: fishing supplies, by the north bridge out of Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "harn_longcast", id = TODO_NPC("Harn Longcast"), name = "Harn Longcast", title = "Fishing Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "easygoing" }, values = { "patience", "plenty" },
  notices = { "craft" },
  impression = {
    first = "Harn Longcast sells poles and lines beside the bridge on the north side of Bloodhoof Village, close enough to Stonebull Lake to keep an eye on the water. He tells a fishing story as slowly as he would play a fish.",
    third = "{name} met Harn Longcast, who sells fishing supplies by the north bridge of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you, {class}. The lake is calm and the fish are rising, so you have chosen your hour well." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you are back! Tell me what you caught, and do not be modest, for no fisherman ever is." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You have a fisher's patient look about you. Tell me what you use for bait, and I will tell you what Stonebull's fish think of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Harn Longcast, and I sell everything a fisher needs except the patience. Uthan Stillwater will teach you the craft down on the shore, and when you have snapped your first line you may come back to me." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Fishing") }, text = "So Kaga has you fishing for your camp, has she? Uthan is the one you want for the teaching, but you will need a pole first, and that is my part of it." },
      },
      again = {
        { id = "h_again", text = "What else? I have all day, and so do the fish." },
        { id = "h_again2", text = "Go on, friend." },
      },
      choices = {
        { text = "How did you earn the name Longcast?", next = "name" },
        { text = "What's biting in Stonebull Lake?", next = "biting" },
        { text = "Why set up at the bridge?", next = "bridge" },
        { text = "Show me your poles.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "I once put a hook into the middle of Stonebull Lake from this very bank, on a wager with Uthan. He says the wind carried it, and I say that a good fisherman knows when to let the wind help." } },
      choices = {
        { text = "Did you catch anything with it?", next = "name_catch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_catch = {
      lines = { { id = "nc_default", text = "I caught a fish as long as my arm, and it has grown a little every time I have told the story since. Ask Uthan and he will tell you it was the size of my hand, but he was standing a long way off." } },
      choices = { { text = "I believe you, mostly. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    biting = {
      lines = { { id = "b_default", text = "There are bright little fish in the shallows that will take anything shiny, and slow fat ones in the deep water that want real bait and real waiting. Mind the swoops when you land one, for they are quicker thieves than any gnoll." } },
      choices = {
        { text = "I prefer the deep-water sort.", next = "BACK", when = { profession = "Fishing" }, reply = "Then you are a true fisher and not merely a hungry one, and you will want the heavier line.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bridge = {
      lines = { { id = "br_default", text = "Everyone bound for Thunder Bluff crosses here, and half of them look down at the water as they go. That look is how fishing begins, and I like to be standing nearby when it does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have fished Stonebull Lake since the tribe first camped beside it, and I began selling poles when my own tent filled up with them." } },
    camping = { { id = "tp_camping", text = "A camp by the water with a line out is the best kind there is, and Uthan can show you what a fisher adds to one." } },
    advice = { { id = "tp_adv", text = "Cast where the water is in shadow, and do not talk, however good the story is." } },
    _none = { { id = "tp_none", text = "I have never pulled that out of the lake, friend, so I cannot say." } },
  },
}

---------------------------------------------------------------------------
-- Kennah Hawkseye: gunsmith at Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "kennah_hawkseye", id = TODO_NPC("Kennah Hawkseye"), name = "Kennah Hawkseye", title = "Gunsmith", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "curious" }, values = { "craft", "precision" },
  notices = { "class", "race" },
  impression = {
    first = "Kennah Hawkseye is a tauren who sells guns, and he seems to know how strange that looks. He handles each long barrel with enormous careful fingers, and he sights down it at the far bluffs before setting it back in its place.",
    third = "{name} met Kennah Hawkseye, the gunsmith of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, {class}. Yes, they are guns, and yes, a tauren is selling them, so let us speak of something more interesting." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and I trust the powder stayed dry on the plains." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You are a hunter, and so you already have an opinion about bow and gun. I would like to hear it, because I have argued both sides at this fire." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "It was orcs who first put one of these in my hands, in the days when our peoples had just met. I have been taking them apart ever since." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kennah Hawkseye. I sell firearms and shot to the hunters of Bloodhoof, and I hear from the elders about it at least once a moon." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Mind the barrel there, for it is loaded." },
        { id = "h_again2", text = "Ask on, friend." },
      },
      choices = {
        { text = "How did a tauren come to sell guns?", next = "how" },
        { text = "What do the elders say about it?", next = "elders" },
        { text = "A bow is quieter and cleaner.", next = "bow" },
        { text = "Show me your stock.", next = "END" },
      },
    },
    how = {
      lines = { { id = "hw_default", text = "When the orcs marched with us against the centaur, some of them carried these, and I saw one drop a charging centaur at a distance no bow of ours could reach. I traded a good kodo hide for a broken one and taught myself the workings." } },
      choices = {
        { text = "Who makes them for you now?", next = "how_make" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_make = {
      lines = { { id = "hm_default", text = "The barrels come by caravan from Orgrimmar and from goblin traders on the coast, and I fit the stocks and set the sights myself. My hands are too large for the smallest springs, which I am told is very funny to watch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elders = {
      big = true,
      lines = { { id = "e_default", text = "They say a hunter should be close enough to hear the beast's last breath and to thank it properly. I answer that a clean kill at a distance spares the beast more pain than a poor arrow at ten paces, and then we both drink our tea in silence.", fx = { learn = { "earth_mother" } } } },
      choices = {
        { text = "The elders are right. The old ways matter.", next = "BACK", reply = "They do matter, and I keep every one of them that I can. I say my thanks over the kill just as my father did.", fx = { align = { order = 1 } } },
        { text = "A better tool is a better tool.", next = "BACK", reply = "That is how I see it, and it is pleasant to hear it from someone who is not trying to sell me powder.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bow = {
      lines = { { id = "b_default", text = "It is both, and I will not argue otherwise. Yaw Sharpmane says the same thing more loudly, and she and I have agreed that each of us will let the hunter decide." } },
      choices = {
        { text = "I'll keep my bow, I think.", next = "BACK", when = { class = "HUNTER" }, reply = "Then keep it well, and come to me only when you meet something your arrows cannot reach." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a hunter with eyes good enough to earn my name, and I became a gunsmith out of plain curiosity." } },
    thrall = { { id = "tp_th", text = "His warriors brought us many new things, and the gun is only the loudest of them." } },
    centaur = { { id = "tp_ce", text = "They taught us what it costs to be outranged, and I have not forgotten the lesson." } },
    earth_mother = { { id = "tp_em", text = "I thank her over every kill, whether it fell to an arrow or to shot, and I do not think she counts the difference." } },
    _none = { { id = "tp_none", text = "That is outside my sights, I am afraid." } },
  },
}

---------------------------------------------------------------------------
-- Moorat Longstride: general goods at Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "moorat_longstride", id = TODO_NPC("Moorat Longstride"), name = "Moorat Longstride", title = "General Goods", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "genial" }, values = { "hospitality", "practical" },
  notices = { "race", "weary" },
  impression = {
    first = "Moorat Longstride keeps the general goods at Bloodhoof Village, and his stall is the first place most travellers stop after the inn. He asks where you have walked from before he asks what you want.",
    third = "{name} met Moorat Longstride, who sells general goods at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. Tell me where you have walked from, and I will tell you what you have run out of." },
    { id = "g_back", when = { metBefore = true }, text = "The traveller returns, and with an emptier pack than when you left, I will wager." },
  },
  notice = {
    { id = "n_far", cat = "race", when = { race = { "Scourge", "Troll" } },
      text = "You have come a very long way to stand at my stall. I should like to hear about the road, if you can spare the telling." },
    { id = "n_hunter", cat = "weary", when = { class = "HUNTER" },
      text = "Hunters empty a quiver faster than a calf empties a trough. I keep arrows and shot both, so you need not go without." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Moorat Longstride, and I sell whatever the road uses up, which is bread, water, bags, arrows and the makings of a fire. I walked a great deal before I settled here, so I know what a pack is missing by the way it hangs." },
      },
      again = {
        { id = "h_again", text = "What else, friend? There is no hurry at my stall." },
        { id = "h_again2", text = "Ask, and then let me look at that pack." },
      },
      choices = {
        { text = "Where did all that walking take you?", next = "walked" },
        { text = "Who else trades in the village?", next = "trade" },
        { text = "I'm bound out of Mulgore soon.", next = "leaving" },
        { text = "Let me see your goods.", next = "END" },
      },
    },
    walked = {
      lines = { { id = "w_default", text = "I went the length of the Barrens and back more times than I have fingers, in the years when the tribe followed the herds. I carried trade between the camps, and I learned that a tauren with spare flint is welcome at any fire." } },
      choices = {
        { text = "Do you miss the wandering?", next = "walked_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walked_miss = {
      lines = { { id = "wm_default", text = "My legs miss it and my back does not, so we have settled the matter between us. Besides, the road now walks to me, and it brings orcs and trolls and stranger folk who tell me things I would never have seen for myself." } },
      choices = { { text = "A fair bargain. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trade = {
      lines = { { id = "t_default", text = "Wunna Darkmane has the trade goods for crafters, and Jhawna Oatwind bakes better bread than the travelling loaves I sell. For weapons you want Mahnott Roughwound, or Kennah Hawkseye if you favour a loud hunt." } },
      choices = { { text = "My thanks. Something else.", next = "BACK" } },
    },
    leaving = {
      lines = { { id = "l_default", text = "Then fill your waterskins twice over, because the Barrens are well named and the wells there are far apart. Camp Taurajo is the first friendly fire beyond the pass, and you should reach it before dark if you can." } },
      choices = {
        { text = "I know the Barrens road well.", next = "BACK", when = { race = { "Orc", "Troll" } }, reply = "Of course you do, for you walked it to get here. Then you know I am not exaggerating about the water." },
        { text = "I'll remember. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a trader between the camps in the wandering years, and I earned my name on the Barrens trails." } },
    centaur = { { id = "tp_ce", text = "I lost two good pack kodo to them and counted myself lucky, for others lost far more." } },
    advice = { { id = "tp_adv", text = "Buy your water before you are thirsty, because nobody sells it where you will need it." } },
    _none = { { id = "tp_none", text = "That is one thing I do not stock, friend, not even as gossip." } },
  },
}

---------------------------------------------------------------------------
-- Wunna Darkmane: trade goods at Bloodhoof Village (sells the roasted kodo meat recipe).
---------------------------------------------------------------------------
P:NPC {
  key = "wunna_darkmane", id = TODO_NPC("Wunna Darkmane"), name = "Wunna Darkmane", title = "Trade Goods", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "bloodhoof" }, temper = { "shrewd" }, values = { "craft", "tradition" },
  notices = { "craft" },
  impression = {
    first = "Wunna Darkmane sells thread, dyes, salt and spices to the crafters of Bloodhoof Village, and she can tell what trade you follow by which basket your eye goes to. She keeps one recipe on her blanket that she is plainly proud of.",
    third = "{name} met Wunna Darkmane, who sells trade goods at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, {class}. Look as long as you like, and I will know your craft before you name it." },
    { id = "g_back", when = { metBefore = true }, text = "You have used up what you bought, I hope, for that is the only reason I like to see a crafter return." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You looked at the spices first, so you are a cook. Then you will want to hear about my family's way with kodo meat." },
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "You went straight to the thread and the salt, as a leatherworker does. Chaw Stronghide sends his students to me, and I have never sold one of them a weak thread." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Wunna Darkmane, and I keep what the crafters of the village need to finish their work. A hide is only a hide until it has thread, and meat is only meat until it has salt." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? My baskets are in no hurry." },
        { id = "h_again2", text = "Go on, I am listening." },
      },
      choices = {
        { text = "What's this recipe you're proud of?", next = "kodo" },
        { text = "How do you guess a person's craft?", next = "guess" },
        { text = "Who are your best customers?", next = "customers" },
        { text = "Let me look through your baskets.", next = "END" },
      },
    },
    kodo = {
      lines = { { id = "k_default", text = "It is roasted kodo meat, done the way it was done on the trail when a great kodo fell and fed a whole camp for days. You will not find the method written down at any other stall, for I am the one who had it set on paper." } },
      choices = {
        { text = "The tauren eat kodo? They carry your tents.", next = "kodo_eat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo_eat = {
      lines = { { id = "ke_default", text = "They carry our tents, and when the Earth Mother calls one home it feeds our children, and its hide roofs us and its bones mark our paths. To let such a beast lie and rot out of sentiment would be the real disrespect.", fx = { learn = { "earth_mother" } } } },
      choices = {
        { text = "Nothing wasted. I cook the same way.", next = "BACK", when = { profession = "Cooking" }, reply = "Then you are the sort of cook the recipe was written for. Roast it slowly, and do not be sparing with the salt.", fx = { affinity = 1 } },
        { text = "I see the sense in it. Something else.", next = "BACK" },
      },
    },
    guess = {
      lines = { { id = "gu_default", text = "A tailor touches the cloth, a leatherworker smells the salt, and a cook stands over the spices with half-closed eyes. A warrior looks at none of it and asks me where the weaponsmith is." } },
      choices = {
        { text = "So where is the weaponsmith?", next = "BACK", when = { class = "WARRIOR" }, reply = "Ha! Mahnott Roughwound is just across the village, and I will not take offence at your leaving." },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "Chaw Stronghide's students come for thread, and Jhawna Oatwind for spice when her own runs short. Moorat sends me every traveller who asks him for something clever, since he only deals in the plain and useful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My mother traded dyes between the camps, and I have her baskets and her eye for a customer." } },
    earth_mother = { { id = "tp_em", text = "Everything on this blanket came from her in one shape, and it leaves me in another." } },
    advice = { { id = "tp_adv", text = "Buy more thread than you think the work needs, for it always needs more." } },
    _none = { { id = "tp_none", text = "That is not in any of my baskets, I fear." } },
  },
}

---------------------------------------------------------------------------
-- Magrin Rivermane: a tauren who keeps a seat in the Bloodhoof Village inn.
---------------------------------------------------------------------------
P:NPC {
  key = "magrin_rivermane", id = TODO_NPC("Magrin Rivermane"), name = "Magrin Rivermane", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "bloodhoof" }, temper = { "quiet" }, values = { "hospitality", "memory" },
  notices = { "race", "class" },
  impression = {
    first = "Magrin Rivermane has a place by the fire in the Bloodhoof Village inn and the look of someone who has had it a long while. He listens to the whole room at once, and he nods to each traveller as though ticking them off a count.",
    third = "{name} met Magrin Rivermane, who keeps a seat by the fire in the Bloodhoof Village inn.",
  },
  greetings = {
    { id = "g_default", text = "Sit down by the fire, {class}, for there is room, and the plains will still be there when you are warm." },
    { id = "g_back", when = { metBefore = true }, text = "I thought we would see you at this fire again, because travellers who stop here once tend to." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It is a good night to be under a roof. Kauth has built the fire high, and you are welcome to your share of it." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken, at a tauren fire. Sit all the same, for the elders have said you are to be given a chance, and I would like to judge for myself." },
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "You carry the calm of the Cenarion teaching, young one. The inn always feels a little quieter when a druid comes in." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Magrin Rivermane. I have no stall and no post, only this seat, and from it I have watched most of the Horde come through Bloodhoof at one time or another." },
      },
      again = {
        { id = "h_again", text = "What else would you talk of? The fire has a while left in it." },
        { id = "h_again2", text = "I am listening, as I usually am." },
      },
      choices = {
        { text = "Who comes through this inn?", next = "who" },
        { text = "Strongbash says you hear everything.", next = "hear", when = { heardLine = "brave_strongbash.im_default" } },
        { text = "What do you make of the village's troubles?", next = "troubles" },
        { text = "You've chosen a good seat.", next = "seat" },
        { text = "I'll leave you to the fire.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Young tauren down from the mesa with their first kills still on their minds, and orcs who have never before seen so much green in one place. Lately there are trolls as well, and the pale dead from Lordaeron, who sit furthest from the fire and say the least." } },
      choices = {
        { text = "What do you make of the Forsaken?", next = "who_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_forsaken = {
      lines = { { id = "wf_default", text = "I think they are a people in pain who have not decided what to do with it. Our elders spoke for them before the Warchief, and I hope the day never comes when we are ashamed of having done so.", fx = { learn = { "forsaken" } } } },
      choices = {
        { text = "We have not forgotten that kindness.", next = "BACK", when = { race = "Scourge" }, reply = "Then remember it on the day it is hard to, for that is the only day it will count.", fx = { affinity = 1 } },
        { text = "A careful answer. Something else.", next = "BACK" },
      },
    },
    hear = {
      lines = { { id = "h2_default", text = "Strongbash hears everything too, but he is talking at the time, so it does not stay with him. I only know that a quiet tauren by a fire is told a great deal by people who simply wish to be listened to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troubles = {
      lines = { { id = "t_default", text = "The gnolls, the goblins and the dwarves at their digging are all one trouble with three faces, which is that others have learned Mulgore is good land. Baine handles it well, and he will handle it better with help.", fx = { learn = { "venture_company" } } } },
      choices = { { text = "Then I'll go and offer mine.", next = "BACK", fx = { affinity = 1 } } },
    },
    seat = {
      lines = { { id = "s_default", text = "It is near the fire, it faces the door, and it is within reach of Kauth's stew pot. I spent enough years sleeping on open ground to know when I have found the best seat in Mulgore." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I walked with the tribe through the wandering years, and now that we have a home I mean to sit in it." } },
    forsaken = { { id = "tp_fo", text = "They are guests of the Horde, and I watch them as I would any guest who came in out of a storm." } },
    cairne = { { id = "tp_ca", text = "He gave us a land where an old tauren can sit by one fire for as long as he pleases, and I thank him daily." } },
    venture_company = { { id = "tp_vc", text = "Their people never stop at the inn, and I think less of anyone who will not share a fire." } },
    _none = { { id = "tp_none", text = "Nobody has brought that tale to this fire yet, but stay a while and somebody may." } },
  },
}
