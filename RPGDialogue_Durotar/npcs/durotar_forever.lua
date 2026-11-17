-- Durotar's Forever-only people: the Den's junior skinning and mining trainers, the Valley of
-- Trials' profession guide and herbalist, Pa'zula the Sen'jin enchanter, Pal'juh the shadow
-- hunter trainee lost in Kolkar Crag, Slizzy Kreeg of Rocktusk Farm and Turroc of the Razor Hill
-- barracks. Voices: bibles/durotar_forever.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local QPZ = TODO_QUEST("A Pain in the Neck")
local QPJ = TODO_QUEST("Lost in the Shadows")
local QTU = TODO_QUEST("For Honor")

---------------------------------------------------------------------------
-- The Den and the Valley of Trials
---------------------------------------------------------------------------

-- Kagil: junior skinning trainer at the Den.
P:NPC {
  key = "kagil", id = TODO_NPC("Kagil"), name = "Kagil", title = "Junior Skinning Trainer",
  bible = "bibles/durotar_forever.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "gruff" }, values = { "practical", "craft" },
  notices = { "craft", "pet" },
  impression = {
    first = "Kagil teaches skinning at the Den, a blunt orc who judges a hide before he judges the beast that wore it. He talks about boars and scorpids as if they owe him leather.",
    third = "{name} met Kagil, the junior skinning trainer at the Den in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Got a knife? Then you've got half of what you need, and I'll teach you the other half." },
    { id = "g_skin", when = { profession = "Skinning" }, text = "Back with blood on your sleeves, I see. Show me your hands, and tell me you haven't been sawing at hides like a peon." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The boars are still out there, and they're still wearing good leather." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { name = "Skinning", min = 50 } },
      text = "Your cuts are getting cleaner, I can see it on your gear. You don't learn that from me, you learn it from a hundred boars, and you've done your hundred." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep that {pet} of yours away from my drying racks, hunter. I've lost three good hides to a hungry wolf already this season." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Kagil. I teach the young ones how to take leather off a beast without ruining it, which is harder than killing the beast in the first place. Do you want to learn, or do you need a knife?" },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren at the Den. Your people thank the beast before they skin it, I hear, and I won't stop you, so long as you thank it quickly and keep your knife moving." },
        { id = "h_skin", when = { profession = "Skinning" }, text = "Already skinning, are you? Good. Let me see your knife, then, and we'll talk about what you're doing wrong." },
      },
      again = {
        { id = "h_again", text = "What else? Ask while I've a hide in my lap and nothing better to do." },
        { id = "h_again2", text = "Go on. I'm listening, though the leather isn't." },
      },
      choices = {
        { text = "What's worth skinning around here?", next = "beasts" },
        { text = "Why bother with skinning at all?", next = "why" },
        { text = "Who else teaches a trade at the Den?", next = "den" },
        { text = "Teach me. I'm ready.", next = "BUSINESS" },
        { text = "Another time, Kagil.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", text = "The mottled boars on the valley floor give you your first scraps, and the scorpids up the slopes give you scales, if you can stand the smell. Raptors and kodos come later, out in the Barrens, when your knife and your nerve have grown." },
      },
      choices = {
        { text = "Scorpids? Is there even leather on those?", next = "scorpids" },
        { text = "Something else, Kagil.", next = "BACK" },
      },
    },
    scorpids = {
      lines = {
        { id = "sc_default", text = "No leather, but the plates come off whole if you're patient, and leatherworkers pay for them. Mind the tail, though, because it can still sting a careless hand after the beast is dead." },
      },
      choices = {
        { text = "Waste nothing. Every part of the kill has a use.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Take what sells and leave the rest for the vultures.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because the Horde wears leather, carries leather and sleeps under leather, and none of it grows on trees. Every hide you take is one more grunt who doesn't freeze at night out on the Barrens." },
      },
      choices = {
        { text = "And it sells, I'd imagine.", next = "sells" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "se_default", text = "It sells well enough, and the goblins at Razor Hill will buy whatever you can't use. Go out with an empty pack and come back with a full one, and you'll have more coin than most recruits ever see in the valley." },
      },
      choices = {
        { text = "Good. Then I'll learn.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    den = {
      lines = {
        { id = "d_default", text = "Norzsh teaches mining just over there, if you'd rather hit rocks than skin things, and Zor'la keeps her herbs further up the valley. If you can't decide, Thedda will talk your ear off about every trade there is." },
      },
      choices = {
        { text = "You don't sound fond of Thedda.", next = "thedda" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thedda = {
      lines = {
        { id = "td_default", text = "She means well, and she knows where every trainer in Durotar stands. I just think a recruit learns more by gutting a boar than by hearing about it, and that's all I'll say on it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've skinned beasts since I was old enough to hold a knife, in the camps and then here. The Warchief needs leather, so I teach." } },
    advice = { { id = "tp_ad", text = "Cut along the belly, never across it. And kill the beast all the way before you start." } },
    _none = { { id = "tp_none", text = "I know hides, and that isn't a hide. Ask somebody with less blood on their hands." } },
  },
}

-- Norzsh: junior mining trainer at the Den.
P:NPC {
  key = "norzsh", id = TODO_NPC("Norzsh"), name = "Norzsh", title = "Junior Mining Trainer",
  bible = "bibles/durotar_forever.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "gruff" }, values = { "strong", "practical" },
  notices = { "craft", "class" },
  impression = {
    first = "Norzsh teaches mining at the Den and seems to doubt anyone can swing a pick until they prove it. Behind the scowl he cares about the copper in Durotar's hills.",
    third = "{name} met Norzsh, the junior mining trainer at the Den in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "You think you've got the arms for a pick? We'll see about that." },
    { id = "g_mine", when = { profession = "Mining" }, text = "There's rock dust in your hair, so you've been working. Good, keep at it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The hills haven't moved, recruit, and neither has the copper in them." },
  },
  notice = {
    { id = "n_mine", cat = "craft", when = { profession = { name = "Mining", min = 50 } },
      text = "You've been at it properly, I can tell by your shoulders. Most recruits quit after their third blister, and you clearly didn't." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior's arms and a warrior's patience, or I hope so. A pick wants the same swing as an axe, only you hit the same spot a hundred times." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Norzsh. I teach mining, and I sell picks to the ones too green to have their own. You think you've got what it takes to break rock all day?" },
        { id = "h_forsaken", when = { race = "Scourge" }, text = "A Forsaken with a pick. Your arms won't tire, I suppose, but I've seen your kind's bones, and I'd swing carefully if I were you." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've rocks waiting." },
        { id = "h_again2", text = "Speak up, recruit. I've been deafened by better hammers than your questions." },
      },
      choices = {
        { text = "Where's the ore in Durotar?", next = "ore" },
        { text = "What makes a good miner?", next = "good" },
        { text = "What's the ore for?", next = "uses" },
        { text = "Train me.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },
    ore = {
      lines = {
        { id = "o_default", text = "Copper, mostly, in veins along the cliff walls of the valley and out across the red rock toward Razor Hill. Look for green streaks in the stone, and look up too, because the best veins sit right where a harpy can drop on you." },
      },
      choices = {
        { text = "Anything better than copper nearby?", next = "better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    better = {
      lines = {
        { id = "bt_default", text = "Tin comes out in the Barrens, and silver if you're lucky, but you'll want more skill and a stronger arm before you go looking. Mine the copper until your hands stop shaking, and then we'll talk." },
      },
      choices = {
        { text = "My hands don't shake.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good = {
      lines = {
        { id = "g_good", text = "Patience and a strong back, and the sense to stop swinging when the rock above you starts to groan. Plenty of brave orcs have died under stone that they didn't bother to listen to." },
      },
      choices = {
        { text = "Strength matters most. Swing hard and the rock gives.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Patience matters most. Read the stone before you strike.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    uses = {
      lines = {
        { id = "u_default", text = "Blades, armor, rivets and nails, all of which Orgrimmar eats faster than we can dig. Every bar you smelt ends up on a grunt's chest or in a grunt's hand, and that's a better use than most things in this world." },
      },
      choices = {
        { text = "So I should learn blacksmithing too?", next = "smith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = {
        { id = "sm_default", text = "If you want to make the blades yourself, yes, and I sell the hammer for it here. Otherwise sell your ore to someone who does, because a miner with no forge still eats." },
      },
      choices = {
        { text = "Then let's see your wares.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I broke rock for the Horde before I taught it, and I'll break more when the young ones stop needing me." } },
    advice = { { id = "tp_ad", text = "Listen to the stone above you. When it talks, you leave." } },
    _none = { { id = "tp_none", text = "If it isn't in a rock, I don't know it. Ask somebody else." } },
  },
}

-- Thedda: the Valley of Trials' profession guide.
P:NPC {
  key = "thedda", id = TODO_NPC("Thedda"), name = "Thedda",
  bible = "bibles/durotar_forever.md", role = "citizen", tier = "service",
  communities = { "valley_of_trials" }, temper = { "warm" }, values = { "helpful", "practical" },
  notices = { "craft", "greenness" },
  impression = {
    first = "Thedda stands in the Valley of Trials to help new recruits pick a trade, and she is more patient about it than anyone else in the Den. She knows where every trainer in Durotar keeps their bench.",
    third = "{name} met Thedda, who helps the recruits of the Valley of Trials choose their professions.",
  },
  greetings = {
    { id = "g_default", text = "Hello, {name}! Have you thought about taking up a trade? I can tell you about any of them." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Still deciding? That's no shame, because a trade is a long road and you should pick the right one." },
    { id = "g_two", when = { any = { { profession = "Mining" }, { profession = "Skinning" }, { profession = "Herbalism" } } }, text = "You've started gathering, I see, and good for you. Do you know what you'll make with it yet?" },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "You're fresh off the cart, aren't you? Don't let the trainers frighten you, because every one of them was as green as you once." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Hello, {name}! I'm Thedda, and I help recruits choose a trade. If it feels like a lot to take in, that's all right, because you can always come back here, or find the trainers in Orgrimmar later." },
        { id = "h_troll", when = { race = "Troll" }, text = "Hello there! The Darkspear brought their herb lore with them from the islands, so Zor'la might suit you, but I'll tell you about all of them before you choose." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? There's no question too small." },
        { id = "h_again2", text = "Go on, ask. I'd rather you asked me than wasted coin learning the wrong trade." },
      },
      choices = {
        { text = "What are professions, exactly?", next = "what" },
        { text = "How many can I learn?", next = "how_many" },
        { text = "Who teaches here in the valley?", next = "who" },
        { text = "Which trade would you choose?", next = "choose" },
        { text = "Mark the way to a trainer for me.", next = "BUSINESS" },
        { text = "Thank you, Thedda.", next = "END" },
      },
    },
    what = {
      lines = {
        { id = "w_default", text = "They're the skills of making, gathering and getting by: forging a blade, sewing a bag, cooking a meal for the road. Learn a recipe once and you can make it again whenever you have the materials, which saves a great deal of coin." },
      },
      choices = {
        { text = "And what's the difference between them?", next = "how_many" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_many = {
      lines = {
        { id = "hm_default", text = "There are primary trades and secondary ones. You can hold only two primary trades at a time, and if you abandon one you lose what you learned, but cooking, fishing and first aid you can learn all together." },
      },
      choices = {
        { text = "Why only two?", next = "why_two" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_two = {
      lines = {
        { id = "wt_default", text = "Because a craft takes your whole life if you let it, and nobody has three lives. A gatherer and a crafter make a good pair, like mining with blacksmithing, or herbs with alchemy, because one feeds the other." },
      },
      choices = {
        { text = "Pick what pays. Coin keeps a warrior alive.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Pick what serves the Horde best, and coin follows.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "Kagil teaches skinning and Norzsh teaches mining, both down at the Den, and Zor'la keeps her herbs here in the valley. The rest you'll find at Razor Hill and in Orgrimmar, and I can mark any of them on your map." },
      },
      choices = {
        { text = "Are they good teachers?", next = "teachers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teachers = {
      lines = {
        { id = "te_default", text = "Kagil is gruff and Norzsh is gruffer, but they know their work. Zor'la speaks softly and takes her time, and she'll tell you which leaf heals and which one kills, which is worth knowing whatever trade you take." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go and see them.", next = "END" },
      },
    },
    choose = {
      lines = {
        { id = "c_default", text = "Me? I'd sew, because a good bag is the first thing every recruit wants and the last thing anyone thinks to make. But you should choose for yourself, and think about whether you'd rather be out in the hills or at a bench." },
        { id = "c_warrior", when = { class = "WARRIOR" }, text = "For a warrior, I'd say mining and blacksmithing, because you'll always need a better blade and you might as well make it yourself. But it's your road, so choose what you'll enjoy." },
      },
      choices = {
        { text = "Out in the hills, I think.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've tried a little of most trades, and I'm best at none of them, which makes me a very good guide." } },
    advice = { { id = "tp_ad", text = "Pick a gathering trade and a making trade that feed each other. Your purse will thank you." } },
    _none = { { id = "tp_none", text = "I'm sorry, I only know about trades. Ask one of the grunts at the Den, they might know." } },
  },
}

-- Zor'la: junior herbalism trainer in the Valley of Trials, Darkspear.
P:NPC {
  key = "zorla", id = TODO_NPC("Zor'la"), name = "Zor'la", title = "Junior Herbalism Trainer",
  bible = "bibles/durotar_forever.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "calm" }, values = { "patient", "wise" },
  notices = { "craft", "race" },
  impression = {
    first = "Zor'la is a Darkspear herbalist in the Valley of Trials who speaks slowly and watches the ground while she talks. She misses the green of the Echo Isles and says Durotar's herbs grow angry.",
    third = "{name} met Zor'la, the Darkspear junior herbalism trainer in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a new face. Come, mon, and see what grows in this red dirt." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "You smell of peacebloom, mon, so you been listening to me. Good." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. The herbs, they don't move, but you do, and that's how you learn them." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { name = "Herbalism", min = 50 } },
      text = "Your fingers are stained green right to the knuckle, mon. Somebody been out pickin' every morning, and Zor'la can see it." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear child! Tell me true, mon, do you remember the islands, or did you grow up on these red rocks?" },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Zor'la, and I teach the herbs. Durotar is hard ground, mon, but things still grow here if you know where to look, and I can show you." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid comes to learn herbs from a troll? You already speak to the green things, mon, so maybe you teach me something while I teach you." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "A shaman, good. The earth spirits and the roots, they speak the same tongue, so you'll pick this up quick." },
      },
      again = {
        { id = "h_again", text = "What else you want to know, mon?" },
        { id = "h_again2", text = "Ask, ask. The herbs aren't going anywhere." },
      },
      choices = {
        { text = "What grows in Durotar?", next = "herbs" },
        { text = "Do you miss the Echo Isles?", next = "isles" },
        { text = "What are herbs good for?", next = "uses" },
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "Another time, Zor'la.", next = "END" },
      },
    },
    herbs = {
      lines = {
        { id = "he_default", text = "Peacebloom and silverleaf, mostly, low by the rocks where the shade lasts longest, and earthroot too if you dig a little. They grow small and tough here, mon, because the sun is angry and the soil is thirsty." },
      },
      choices = {
        { text = "How do I find them?", next = "find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    find = {
      lines = {
        { id = "fi_default", text = "Walk slow and look down, which most young orcs never do because they're too busy looking for something to fight. Silverleaf shines when the light hits it, and peacebloom is the white one the boars keep stepping on." },
      },
      choices = {
        { text = "Then I'll walk slowly.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = {
        { id = "is_default", text = "Every day, mon. The isles were green, with fruit hanging off every branch and herbs you could pick from the beach, and now the witch doctor Zalazane sits there with his hexed slaves and we stand on the shore and watch.",
          fx = { learn = { "echo_isles" } } },
      },
      choices = {
        { text = "The Darkspear should take the isles back by force.", next = "isles_take", fx = { align = { order = -1 } } },
        { text = "Vol'jin's wise to wait. The Horde needs Sen'jin strong.", next = "isles_take", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles_take = {
      lines = {
        { id = "it_default", text = "Maybe so, mon, and maybe one day. Vol'jin knows the hour better than Zor'la does, and until then I grow what I can here and teach the young ones to do the same." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    uses = {
      lines = {
        { id = "u_default", text = "Potions, poultices, and medicine for the grunts who come back with arrows in them. An alchemist will pay for every leaf you pick, and a healer will bless you for it, so either way you don't go hungry." },
      },
      choices = {
        { text = "And the ones that kill?", next = "poison" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison = {
      lines = {
        { id = "po_default", text = "There are some, mon, and I teach those too, so nobody puts the wrong leaf in their stew. What a rogue does with them afterward is between the rogue and the loa." },
        { id = "po_rogue", when = { class = "ROGUE" }, text = "You ask like a rogue asks, mon, and I see your hands. I teach you which leaf is which, and what you do with it is between you and the loa." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll keep that in mind.", next = "END" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I picked herbs on the Echo Isles before Zalazane took them. Now I pick them here, and they're smaller." } },
    advice = { { id = "tp_ad", text = "Walk slow and look down, mon. The ground tells you more than the sky." } },
    _none = { { id = "tp_none", text = "That's not a leaf or a root, mon, so Zor'la don't know it. Ask the grunts." } },
  },
}

---------------------------------------------------------------------------
-- Sen'jin Village and Kolkar Crag
---------------------------------------------------------------------------

-- Pa'zula: journeyman enchanter of Sen'jin Village; A Pain in the Neck.
P:NPC {
  key = "pazula", id = TODO_NPC("Pa'zula"), name = "Pa'zula", title = "Journeyman Enchanter",
  bible = "bibles/durotar_forever.md", role = "questgiver", tier = "quest",
  communities = { "senjin" }, temper = { "sharp" }, values = { "proud", "loyal" },
  notices = { "craft", "arcane", "race" },
  impression = {
    first = "Pa'zula is Sen'jin's enchanter, a sharp Darkspear woman who strips Zalazane's hexes from the pendants his slaves wear. She speaks of the Echo Isles as if she still lived there, and she grieves for every troll in them.",
    third = "{name} met Pa'zula, the Darkspear enchanter of Sen'jin Village who unpicks Zalazane's binding spells.",
  },
  greetings = {
    { id = "g_default", text = "What business you have on the Echo Isles, {class}? Ah, don't look at me so, I know we're on the mainland, but my heart hasn't moved yet." },
    { id = "g_active", when = { questActive = QPZ }, text = "You have the residue, mon? Three of them, and don't you dare put one of those pendants round your neck while you're about it." },
    { id = "g_ready", when = { questReady = QPZ }, text = "I can see the glow on you from here, mon. Bring it over, quick, before it fades." },
    { id = "g_done", when = { questDone = QPZ }, text = "Ah, the one who freed three spirits for me. Come, sit, the fire is warm." },
    { id = "g_away", when = { away = 14, questDone = QPZ }, text = "Gone {away}, and Zalazane made more pendants while you were gone. He never stops, that one." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "I can feel the dust on your fingers from here, mon. Somebody's been breaking down magic, and that means you can help me." },
    { id = "n_mage", cat = "arcane", when = { class = { "MAGE", "WARLOCK" } },
      text = "You carry magic like a cloak, mon, so you know what it is to bind a thing. Zalazane binds minds, and I mean to see him unbound." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, good. Then you know the isles, or your mother did, and you know what Zalazane took from us." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Pa'zula. I teach enchanting to them that want it, and I break Zalazane's magic for them that can't. The Echo Isles are just across the water, mon, and every troll on them wears his chain." },
        { id = "h_before", when = { questBefore = QPZ, profession = "Enchanting" },
          text = "You're an enchanter, mon, and I need one. Zalazane's slaves wear pendants wrapped in binding spells, and I want them stripped and brought back to me." },
        { id = "h_active", tags = { "news" }, when = { questActive = QPZ },
          text = "The hexed trolls on the isles wear the pendants, so you'll have to take them from the dead. Strip the magic off with your craft and bring me the residue, mon, three of it." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { QPZ, days = 3 } },
          text = "It's a shame about the trolls who wore them, mon, and I won't pretty it up. But with the binding gone, their spirits can rest, and that's more than Zalazane ever gave them." },
        { id = "h_done", when = { questDone = QPZ },
          text = "I've been studying the residue you brought, mon. Zalazane's hexes are clever, but they're not so clever as he thinks, and that gives me hope." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Ask quick, I've spells cooling." },
        { id = "h_again2", text = "Go on, I'm listening, and the isles are still out there waiting." },
        { id = "h_again3", when = { questDone = QPZ }, text = "Ask what you like. You've earned a little of my time." },
      },
      choices = {
        { text = "Who is Zalazane?", next = "zalazane" },
        { text = "What do the pendants do?", next = "pendants" },
        { text = "Why do you speak as if you're on the isles?", next = "isles" },
        { text = "Tell me about enchanting.", next = "craft" },
        { text = "I'm a Darkspear too. Those are my people over there.", next = "xtroll", when = { race = "Troll" } },
        { text = "I bind magic too. Show me how his works.", next = "xmagic", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "What do you need done?", next = "BUSINESS" },
        { text = "Good luck, Pa'zula.", next = "END" },
      },
    },
    zalazane = {
      lines = {
        { id = "z_default", text = "He was one of our witch doctors, mon, a clever one, and then he went mad with power. When Vol'jin led us to the mainland, Zalazane stayed and took the isles for himself, and he hexed every troll he could catch into serving him.",
          fx = { learn = { "echo_isles" } } },
      },
      choices = {
        { text = "Why did the Darkspear leave the isles at all?", next = "leave" },
        { text = "Can he be stopped?", next = "stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      lines = {
        { id = "le_default", text = "Because Thrall's Horde gave us a home and a place among them, and Vol'jin owed them for saving us from the humans and the sea witch. We came to Durotar to build it with them, and Zalazane saw his chance while our backs were turned." },
      },
      choices = {
        { text = "Then Thrall owes you help taking them back.", next = "owe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    owe = {
      big = true,
      lines = {
        { id = "ow_default", text = "Maybe he does, mon, and maybe the day comes. Vol'jin says we wait until we're strong, and the young ones say we're strong enough now. Which do you think is right?" },
      },
      choices = {
        { text = "Vol'jin is right. Strike once, and strike when you'll win.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The young ones are right. Every day you wait, more are hexed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "That isn't my choice to make.", next = "BACK" },
      },
    },
    stop = {
      lines = {
        { id = "st_default", text = "Everything can be stopped, mon, even a witch doctor. For now I take his magic apart a pendant at a time and learn how it was put together, so that when the day comes, our shamans know how to undo him." },
      },
      choices = {
        { text = "That's slow work.", next = "slow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    slow = {
      lines = {
        { id = "sl_default", text = "Slow and sure, mon. A raptor runs at its prey and gets a spear in the throat, while a tiger waits in the grass, and I mean to be the tiger." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pendants = {
      lines = {
        { id = "pe_default", text = "He hangs them round his slaves' necks, wrapped up in binding spells, and they hold the mind in place like a rope holds a goat. Take one off a living troll and he fights you anyway, because the hex is in him by then, so the pendants only come off the dead." },
      },
      choices = {
        { text = "So I have to kill your own people?", next = "kill" },
        { text = "What happens if I wear one?", next = "wear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kill = {
      big = true,
      lines = {
        { id = "k_default", text = "They're not my people now, mon, not while he holds them. They'll kill you without a thought, and the only mercy left to give them is to cut the binding after, so the spirit goes free instead of serving him in death too." },
      },
      choices = {
        { text = "Then I'll give them that mercy, and quickly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hexed troll is an enemy. Mercy doesn't come into it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wear = {
      lines = {
        { id = "we_default", text = "Then you'll be wading back across to the isles to stand guard for Zalazane, mon, and I'll have to send somebody else to take it off your corpse. So don't." },
      },
      choices = {
        { text = "Understood.", next = "BACK" },
      },
    },
    isles = {
      lines = {
        { id = "i_default", text = "Because I can see them from here, mon, every morning, and I lived there all my life before Sen'jin. My body is on the mainland but the rest of me still sits on that beach waiting to go home." },
      },
      choices = {
        { text = "What was it like there?", next = "isles_like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles_like = {
      lines = {
        { id = "il_default", text = "Warm and green, with the sea on every side and fish jumping into your hands if you stood still. Not like this red dust, where even the scorpids look thirsty." },
      },
      choices = {
        { text = "You'll see it again.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft = {
      lines = {
        { id = "c_default", text = "Enchanting is taking magic out of a thing and putting it into another, mon. You break down a cloak or a pendant into dust and essence, and then you bind that into a blade or a bracer, and it holds there." },
        { id = "c_ench", when = { profession = "Enchanting" }, text = "You know the start of it already, mon, the breaking down. The real art is in the binding, and binding is the same thing Zalazane does, only he binds minds and we bind steel." },
      },
      choices = {
        { text = "That sounds a lot like Zalazane's magic.", next = "same" },
        { text = "Train me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    same = {
      big = true,
      lines = {
        { id = "sa_default", text = "It is like it, mon, and I'll not hide it. The difference is what you bind and whether it wants to be bound, and a sword never asked to be free." },
      },
      choices = {
        { text = "Then power is only as good as who holds it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is power. Learn his tricks and use them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtroll = {
      lines = {
        { id = "xt_default", text = "I know it, mon, and I'm sorry you have to see them this way. Maybe you'll find somebody you knew out there wearing his pendant, so if you do, cut it quick and say their name, so the spirit hears it going." },
      },
      choices = {
        { text = "I'll say their names.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmagic = {
      lines = {
        { id = "xm_default", text = "His binding is old voodoo laid over the loa's names, mon, wrapped tight around the pendant like a vine. You can't burn it off without burning the mind with it, so we wait until the mind has gone and then unwrap it, slow." },
      },
      choices = {
        { text = "Crude, but effective.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I lived on the Echo Isles until Zalazane, and I've worked magic since I was small. Now I unpick his." } },
    advice = { { id = "tp_ad", text = "Never wear what you take off the dead, mon. Not on the isles, anyway." } },
    echo_isles = { { id = "tp_echo", text = "Our home, mon, and Zalazane's now, until we take it back. Every troll on those beaches wears his chain." } },
    _none = { { id = "tp_none", text = "I don't know that one, mon. Ask Master Gadrin, he knows more than me about most things." } },
  },
}

-- Pal'juh: shadow hunter trainee stranded in Kolkar Crag; Lost in the Shadows (escort).
P:NPC {
  key = "paljuh", id = TODO_NPC("Pal'juh"), name = "Pal'juh", title = "Shadow Hunter Trainee",
  bible = "bibles/durotar_forever.md", role = "questgiver", tier = "quest",
  temper = { "proud" }, values = { "brave", "ambitious" },
  notices = { "class", "race" },
  impression = {
    first = "Pal'juh is a Darkspear shadow hunter in training who went into Kolkar Crag alone to scout and ran out of magic. She's brave, quick and too proud to admit how frightened she was.",
    third = "{name} met Pal'juh, a young Darkspear shadow hunter trainee stranded among the centaur of Kolkar Crag.",
  },
  greetings = {
    { id = "g_default", text = "Psst! Down here, mon, and keep your head low before the centaur see you." },
    { id = "g_active", when = { questActive = QPJ }, text = "We best hurry before more of them show up, mon." },
    { id = "g_done", when = { questDone = QPJ }, text = "Yes, I'm back in the crag, and yes, Vornal shouted. I'm being careful this time, mon, I swear it." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You carry the spirits with you, mon, I can feel it. Mine ran dry in here, which is why I'm hiding behind a rock like a frog." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! Thank the loa, mon, because an orc would never let me forget this." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Pal'juh, and I'm going to be a shadow hunter, mon, though I'm not much of one today. I came to scout the crag on my own and my magic ran out at the wrong time, so I've been hiding here ever since." },
        { id = "h_done", when = { questDone = QPJ }, text = "You got me out once, mon, and I came back in, I know. But I'm watching where the centaur sleep this time, so the next one Vornal sends in isn't walking in blind." },
      },
      again = {
        { id = "h_again", text = "Quick, mon, ask what you need. They patrol every little while." },
        { id = "h_again2", text = "Still here? Keep your voice down, mon." },
      },
      choices = {
        { text = "What are you doing in here alone?", next = "alone" },
        { text = "What did you see in the crag?", next = "scout" },
        { text = "Who's your teacher?", next = "vornal" },
        { text = "What's a shadow hunter, anyway?", next = "shadow" },
        { text = "I'm a shadow-touched one myself. Want a lesson?", next = "xpriest", when = { class = { "PRIEST", "WARLOCK" } } },
        { text = "What did Vornal say when you got back?", next = "after", when = { questDone = QPJ } },
        { text = "Let's get you out of here.", next = "BUSINESS" },
        { text = "Stay hidden. I'll be back.", next = "END" },
      },
    },
    alone = {
      lines = {
        { id = "a_default", text = "Proving something, mon, if I'm honest. The other trainees go out in threes and come back with nothing, and I thought one quiet troll could see more than three loud ones." },
      },
      choices = {
        { text = "And were you right?", next = "right" },
        { text = "That was foolish.", next = "foolish" },
      },
    },
    right = {
      lines = {
        { id = "r_default", text = "Half right, mon. I saw plenty, and then my magic gave out and I couldn't hide myself any more, so now I'm a quiet troll stuck behind a rock with a great deal to report." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    foolish = {
      big = true,
      lines = {
        { id = "f_default", text = "Maybe it was, mon. But somebody has to go in first, and if everybody waits for a war party, the centaur ride on the valley while we're still counting spears." },
      },
      choices = {
        { text = "You were brave. The Horde needs that.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Courage without discipline gets scouts killed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scout = {
      lines = {
        { id = "s_default", text = "Kolkar, mon, more than I thought, and they're gathering. Their warlord Kolkanis wants to ride on the Valley of Trials and Sen'jin and Razor Hill, and some of the young ones even talk about Orgrimmar's gates." },
        { id = "s_lar", when = { questDone = TODO_QUEST("Thwarting Kolkar Aggression") }, text = "Kolkar, mon, though fewer since somebody went through their camps for Lar Prowltusk. Their warlord Kolkanis still wants Durotar's towns, so they're angry as well as fewer." },
      },
      choices = {
        { text = "Orgrimmar? Centaur can't take Orgrimmar.", next = "orgrimmar" },
        { text = "Who is Kolkanis?", next = "kolkanis" },
        { text = "Who knows about this?", next = "knows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orgrimmar = {
      lines = {
        { id = "o_default", text = "No, mon, and they know it too. But they don't need to take it, only to burn the farms and catch the recruits outside the walls, and that would hurt the Horde plenty." },
      },
      choices = {
        { text = "Then we strike them first.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kolkanis = {
      lines = {
        { id = "ko_default", text = "Their warlord in the crag, mon, big and loud, with a voice like a falling rock. The others do what he says because he hits harder than any of them, and I watched him beat one of his own for being slow." },
      },
      choices = {
        { text = "How do we get past him?", next = "route" },
        { text = "Something else.", next = "BACK" },
      },
    },
    route = {
      lines = {
        { id = "ro_default", text = "We don't go past him, mon, we go round. The way I came in is narrow and quiet, and if they spot us there we run, and we don't stop until I can see the village." },
        { id = "ro_active", when = { questActive = QPJ }, text = "Same as I said, mon, the narrow way and then we run. Take a moment when I say so, and not before." },
      },
      choices = {
        { text = "Lead the way.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "That I got myself in trouble again, mon, and that I should learn my lesson about going alone. Then he thanked you, and then he said the raptor thing again, in front of everybody." },
      },
      choices = {
        { text = "And have you learned your lesson?", next = "lesson" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson = {
      lines = {
        { id = "le_default", text = "Some of it, mon. I came back here, didn't I, but this time I told Vornal first, and I brought three times the magic I need. That's practically a tiger." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    knows = {
      lines = {
        { id = "k_default", text = "Lar Prowltusk at Sen'jin watches the Kolkar, mon, and Master Vornal will hear everything from me as soon as I'm out. If I get out, that is, which is where you come in." },
      },
      choices = {
        { text = "I'll get you out.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vornal = {
      lines = {
        { id = "v_default", text = "Master Vornal in Sen'jin, mon. He's patient and he's careful and he says I act more like a raptor than a tiger, which he doesn't mean kindly." },
      },
      choices = {
        { text = "What does he mean by that?", next = "raptor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptor = {
      lines = {
        { id = "ra_default", text = "A raptor sees its prey and runs straight at it, screaming, mon, and a tiger waits in the grass until the moment is right. I keep telling him I'll learn to wait, and then I see something interesting and off I go." },
      },
      choices = {
        { text = "A raptor eats too, you know.", next = "rap_end", fx = { affinity = 1 } },
        { text = "He's right. Learn to wait.", next = "rap_end" },
      },
    },
    rap_end = {
      big = true,
      lines = {
        { id = "re_default", text = "Ha! Tell him that, mon, and see what he says. Which would you be, if you had to choose, the raptor or the tiger?" },
      },
      choices = {
        { text = "The tiger. Patience wins hunts.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "The raptor. Charge in and meet the enemy head on.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow = {
      lines = {
        { id = "sh_default", text = "The Darkspear's own hunters and healers, mon, walking with the loa and the shadow both. We hunt what threatens the tribe, and we curse it, and we heal our own after, if the spirits are willing." },
      },
      choices = {
        { text = "Curse it? Is that what ran out?", next = "magic" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magic = {
      lines = {
        { id = "m_default", text = "It's what ran out, mon. A trainee only has so much, and I spent mine on a curse to weaken one big centaur and a shadow word to make another one regret chasing me, and then I had nothing left to hide with." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Rest, then. We'll go when you're ready.", next = "BUSINESS" },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "A lesson from you, mon? Maybe, when I'm not crouching in a centaur camp. The shadow is a sharp knife, and I'd like to hear how somebody else holds it." },
      },
      choices = {
        { text = "Use it carefully. Shadow takes as much as it gives.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Use it without fear. Fear is what makes it bite.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkspear, born on the islands, training under Vornal in Sen'jin. That's all, mon, and I'd like it to stay that way, without the word 'dead' at the end." } },
    advice = { { id = "tp_ad", text = "Don't scout alone, mon. I'll learn it eventually, but you should learn it from me first." } },
    _none = { { id = "tp_none", text = "Ask me about that when we're out of the crag, mon, not before." } },
  },
}

---------------------------------------------------------------------------
-- Rocktusk Farm
---------------------------------------------------------------------------

-- Slizzy Kreeg: orc at Rocktusk Farm raising Morok'ra, a beast left for dead.
P:NPC {
  key = "slizzy", id = TODO_NPC("Slizzy Kreeg"), name = "Slizzy Kreeg",
  bible = "bibles/durotar_forever.md", role = "citizen", tier = "service",
  temper = { "fierce" }, values = { "strong", "loyal" },
  notices = { "pet", "mount" },
  impression = {
    first = "Slizzy Kreeg keeps a half-dead young beast called Morok'ra at Rocktusk Farm and means to make a war mount of it. She's gentle with it and hard with everyone else.",
    third = "{name} met Slizzy Kreeg of Rocktusk Farm, who is nursing a beast called Morok'ra back to health to ride into battle.",
  },
  greetings = {
    { id = "g_default", text = "Watch your step. This little beast has been through enough." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Morok'ra's eating now, so mind your fingers." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your {pet} back a pace. Morok'ra doesn't know yet who's a friend, and I'd rather it learned that slowly." },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Get down off that beast before Morok'ra sees it, or it'll try to fight it, and it isn't ready." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Slizzy Kreeg. This is Morok'ra, and it was left for dead, but it'll start its training soon. Once it's broken and battle-hardened, we'll ride into battle as one, and our enemies will learn to fear us both." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter, so you'll know not to loom over a frightened beast. This is Morok'ra, and once it's strong we'll ride to war together." },
      },
      again = {
        { id = "h_again", text = "Anything else? Morok'ra needs feeding." },
        { id = "h_again2", text = "Ask, but keep your voice low." },
      },
      choices = {
        { text = "What happened to it?", next = "found" },
        { text = "How do you train a beast for war?", next = "train" },
        { text = "What is Rocktusk Farm?", next = "farm" },
        { text = "I tame beasts myself. Any advice?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    found = {
      lines = {
        { id = "f_default", text = "I found it in the scrub off the western road, torn up and too weak to stand, with whatever did it long gone. Most would have finished it, but I saw it bite at me with half its blood on the ground, and I knew it was worth keeping." },
      },
      choices = {
        { text = "You should have ended its pain.", next = "mercy" },
        { text = "It's lucky you found it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mercy = {
      big = true,
      lines = {
        { id = "me_default", text = "Ended it? It still had fight in it. That's the only thing that counts, in a beast or in an orc." },
      },
      choices = {
        { text = "Anything that still fights deserves a chance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A crippled beast is a burden. Mercy is quicker.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    train = {
      lines = {
        { id = "t_default", text = "First you keep it alive, and then you feed it from your own hand until it knows your smell. After that comes the breaking, which is slow and hard on both of you, and then the fighting, where it learns not to run from steel." },
      },
      choices = {
        { text = "Breaking it? That sounds cruel.", next = "break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["break"] = {
      big = true,
      lines = {
        { id = "br_default", text = "It's not cruel, it's honest. A war beast that won't take orders gets its rider killed, and then itself, so I break its fear and keep its fury." },
      },
      choices = {
        { text = "Discipline makes it strong. You're doing right by it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep some of its wildness. That's where its courage lives.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm = {
      lines = {
        { id = "fa_default", text = "Pigs, mostly, just down the road from Orgrimmar's gates, with the blockade close enough to make the farmers feel safe. It feeds the city and gives me a quiet corner to work, and the swine don't mind Morok'ra so long as it's tied." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xh_default", text = "Yours follows you because it chose to, I'd guess, and mine will follow me because it has to, at first. Feed it yourself and never let anyone else, that's all I know, and it seems to be enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a rider without a mount. Morok'ra will fix that." } },
    advice = { { id = "tp_ad", text = "Don't turn your back on anything with teeth, even when it's yours." } },
    _none = { { id = "tp_none", text = "I don't know and I don't much care. I've a beast to feed." } },
  },
}

---------------------------------------------------------------------------
-- Razor Hill
---------------------------------------------------------------------------

-- Turroc: Razor Hill Barracks; For Honor (the fallen of Tiragarde Keep).
P:NPC {
  key = "turroc", id = TODO_NPC("Turroc"), name = "Turroc",
  bible = "bibles/durotar_forever.md", role = "questgiver", tier = "quest",
  communities = { "razor_hill" }, temper = { "grim" }, values = { "honor", "loyal" },
  notices = { "class", "soldier" },
  impression = {
    first = "Turroc keeps the barracks at Razor Hill and remembers the warriors who died taking Tiragarde Keep. He wants their weapons brought home from the ruins and hung where every grunt can see them.",
    third = "{name} met Turroc of the Razor Hill barracks, who honors the Horde warriors who fell at Tiragarde Keep.",
  },
  greetings = {
    { id = "g_default", text = "Speak plainly, {class}. I've no patience left for anything else." },
    { id = "g_active", when = { questActive = QTU }, text = "Have you done what I asked? The bow, the axe and the shield, and not one of them left in human hands." },
    { id = "g_done", when = { questDone = QTU }, text = "Look at the wall, {name}. Those warriors will always be remembered, and you made sure of it." },
    { id = "g_away", when = { away = 14, questDone = QTU }, text = "You've been away {away}. The weapons are still on the wall, and the grunts still touch the shield before they march." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Good, then you'll know what it means when a blade comes home without the hand that held it." },
    { id = "n_vet", cat = "soldier", when = { minLevel = 20 },
      text = "You've seen fighting since you left the valley, I can tell by the way you stand. Then you've lost friends too, and you know why I ask what I ask." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Turroc. I keep the barracks and the memory of those who don't come back to them. We lost many brave warriors when we sacked Tiragarde Keep, and the humans are still sitting on their bones." },
        { id = "h_before", when = { questBefore = QTU },
          text = "The humans have reinforced the ruins around Tiragarde Keep, and our dead are still lying there where we can't reach them to honor them. Their weapons, at least, I want back, and I want them hung where every grunt can see them." },
        { id = "h_active", tags = { "news" }, when = { questActive = QTU },
          text = "A bow, a battleaxe and a shield, all left in the ruins round the keep. Search the watchtower and the houses, and don't come back with any human's junk instead of ours." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { QTU, days = 3 } },
          text = "I hung them myself last night, with every grunt in the barracks watching. Nobody said anything for a long while, and then old Gorrak said their names, all of them, and I'll not forget that." },
        { id = "h_done", when = { questDone = QTU },
          text = "Their weapons hang on the barracks wall now. Every recruit who passes through Razor Hill looks at them, and I tell them who carried them, and how they fell." },
      },
      again = {
        { id = "h_again", text = "What else? Speak." },
        { id = "h_again2", text = "Ask what you need. I'm not going anywhere." },
      },
      choices = {
        { text = "Tell me about Tiragarde Keep.", next = "keep" },
        { text = "Who were the warriors who fell?", next = "fallen" },
        { text = "Why do the weapons matter so much?", next = "why" },
        { text = "What's it like, keeping Razor Hill's barracks?", next = "barracks" },
        { text = "I hear the spirits of the dead. Shall I speak for yours?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I died once. Nobody hung my sword on a wall.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "I'll bring their weapons home.", next = "BUSINESS" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    keep = {
      lines = {
        { id = "k_default", text = "A Kul Tiran fort on the coast south of here, built by Proudmoore's men to keep a boot on Durotar's throat. We stormed it and broke it, and we paid for it in blood, and now the humans have crept back into the ruins and patched the walls." },
      },
      choices = {
        { text = "Why not take it again?", next = "retake" },
        { text = "Who holds it now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    retake = {
      big = true,
      lines = {
        { id = "rt_default", text = "Orgnil says not yet, and Orgnil answers to the Warchief. Thrall wants Durotar held and quiet, not a war on every shore, and I understand it even when I don't like it. What would you do?" },
      },
      choices = {
        { text = "Obey the Warchief. A quiet Durotar is a strong one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Burn them out. Leaving them there dishonors our dead.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = {
        { id = "ho_default", text = "Kul Tiran marines, what's left of the admiral's fleet, too stubborn to sail home since we killed him at Theramore. They shoot from the walls and patrol the ruins, and they'd take any orc's skull for a trophy." },
      },
      choices = {
        { text = "What do you think of the admiral?", next = "admiral" },
        { text = "Something else.", next = "BACK" },
      },
    },
    admiral = {
      lines = {
        { id = "ad_default", text = "Proudmoore came across the sea to finish us, and his own daughter stood with the Warchief against him. He died with his sword in his hand, which is more than he meant to give us." },
      },
      choices = {
        { text = "He was an enemy, but he died bravely. I respect that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Brave or not, he got what he came for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fallen = {
      lines = {
        { id = "f_default", text = "Good warriors, every one, and I'd tell you all their names if we had the night for it. The bow belonged to a hunter who could put an arrow through a gull, and the axe to a big brute who sang while he fought, and the shield was carried by the one who held the gate while the rest of us got through." },
      },
      choices = {
        { text = "You were there?", next = "there" },
        { text = "Something else.", next = "BACK" },
      },
    },
    there = {
      lines = {
        { id = "th_default", text = "I was there. I came back, and they didn't, and the difference between us was a few steps and some luck. So I keep their memory, because it's the only debt I can still pay." },
      },
      choices = {
        { text = "Do you still dream of it?", next = "dream" },
        { text = "That's not a debt. That's honor.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = {
        { id = "dr_default", text = "Some nights. I hear the gate breaking and the singer still singing, and then I wake up in the barracks with forty grunts snoring around me. It's not the worst way to wake." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because we can't bring the bodies home, and an orc who isn't remembered dies twice. A weapon on the wall says that they fought, and that the Horde hasn't forgotten them." },
      },
      choices = {
        { text = "Honor the dead, and the living fight harder.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The dead don't care. Weapons belong in living hands.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where will you hang them?", next = "wall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall = {
      lines = {
        { id = "wa_default", text = "On the wall above the barracks door, where every grunt passes under them twice a day. A recruit who looks up and asks whose they were has already learned the first lesson." },
        { id = "wa_done", when = { questDone = QTU }, text = "Above the barracks door, where you saw them. The grunts touch the shield on the way out, for luck, though I've never told them to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    orgnil = {
      lines = {
        { id = "og_default", text = "Orgnil Soulscar holds Razor Hill, and he's a careful commander, more careful than I'd be. These days he watches the Burning Blade in the hills more than he watches the humans on the coast, and he may be right to.",
          fx = { learn = { "burning_blade" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    barracks = {
      lines = {
        { id = "b_default", text = "Long nights, and green grunts who think a war is a story. I feed them, I drill them, and I send them to Orgnil, and I try to send them out knowing what they're fighting for." },
      },
      choices = {
        { text = "Who is Orgnil?", next = "orgnil" },
        { text = "What are they fighting for?", next = "for" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["for"] = {
      lines = {
        { id = "fo_default", text = "Durotar, a home of our own, after the camps and the chains. The Warchief gave us that, and every grunt who dies at Tiragarde dies keeping it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "xs_default", text = "You'd do that? Then go to the ruins with the weapons in your hands and tell them they're going home. I can't hear the spirits, but I'd like to think someone told them." },
      },
      choices = {
        { text = "I'll tell them.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "xf_default", text = "No, and I'm sorry for it, though your kind is a mystery to me. The Banshee Queen fights beside the Warchief, and that's enough for me to call you kin of the Horde." },
      },
      choices = {
        { text = "Then remember me when I fall again.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought at Tiragarde. That's the part of my story worth telling." } },
    advice = { { id = "tp_ad", text = "Learn the names of the ones beside you. You'll want them later." } },
    _none = { { id = "tp_none", text = "I don't know. Ask Orgnil, or somebody who sits in a chair." } },
  },
}
