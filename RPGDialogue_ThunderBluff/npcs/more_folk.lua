-- More of Thunder Bluff: Tah Winterhoof of Winterhoof Totems, the herbalism and mining and skinning
-- trainers (Komin Winterhoof, Brek Stonehoof, Mooranta), and four shopkeepers (Netali Proudwind,
-- Sunn Ragetotem, Jyn Stonehoof, Fyr Mistrunner). Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Tah Winterhoof: totem carver on the High Rise. Forever: Pigments for Paints.
---------------------------------------------------------------------------
P:NPC {
  key = "tah_winterhoof", id = TODO_NPC("Tah Winterhoof"), name = "Tah Winterhoof",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "calm", "dry" }, values = { "craft", "tradition" },
  notices = { "race", "class" },
  impression = {
    first = "Tah Winterhoof carves and paints totems in the Winterhoof shop on the High Rise, and he talks about colour the way a hunter talks about tracks. His own paint pots were nearly empty, and that seemed to trouble him more than anything else.",
    third = "{name} met Tah Winterhoof, who carves and paints totems at Winterhoof Totems on the High Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Come in, and mind the drying poles. The paint on that one is still wet, and it is the last of my red." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Sit, if you can find a place among the shavings." },
    { id = "g_pig", when = { questActive = TODO_QUEST("Pigments for Paints") }, text = "Have you found the pigments? The totems stand pale and waiting, and so do I." },
    { id = "g_pigdone", when = { questDone = TODO_QUEST("Pigments for Paints") }, text = "Look at the colour in them now. A totem without paint is only wood, and you helped make these something more." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. You will know that the spirits do not live in the wood, but they do look kindly on a totem made with care." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers. Your people carve for the winds, I am told; one day you must tell me what colours the air prefers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tah Winterhoof. I carve totems here on the High Rise, as the Winterhoof have done since we first raised tents on this bluff, and I paint them with what the land gives me." },
        { id = "h_pig", when = { questActive = TODO_QUEST("Pigments for Paints") }, text = "The pigments are not hard to find if you know where the earth keeps its colours, but my legs are older than my eyes. Bring them when you can, and the totems will thank you." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Child of the Earth Mother, welcome. Your family has a totem somewhere on this bluff, I expect, and perhaps I painted it." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "One of the Forsaken. You are welcome in my shop, though I ask that you do not touch the totems; the old ones would not understand." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I can carve and listen at the same time." },
        { id = "h_again2", text = "Ask, then. The paint must dry anyway." },
      },
      choices = {
        { text = "Why do your totems need paint at all?", next = "paint" },
        { text = "You said the red was the last of it.", next = "pigments" },
        { text = "Who carves totems for the other tribes?", next = "tribes" },
        { text = "I walk with the spirits too, Tah.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "These totems carry far more than decoration, don't they?", next = "druid", when = { class = "DRUID" } },
        { text = "Earth Mother keep you, Tah.", next = "END" },
      },
    },
    paint = {
      lines = { { id = "pa_default", text = "A totem tells a story, and wood alone tells it in a whisper. The red is for the blood of the hunt, the white for the clouds over Mulgore, and the black for the night when the ancestors walk; without them, the story is half told." } },
      choices = {
        { text = "And who reads these stories?", next = "paint_read" },
        { text = "Something else, Tah.", next = "BACK" },
      },
    },
    paint_read = {
      big = true,
      lines = { { id = "pr_default", text = "The young read them, if their elders teach them how, and the ancestors read them whether we teach anyone or not. I worry that fewer of the young bother to learn, now that the tribes live together in one city and the old stories are written down instead of carved." } },
      choices = {
        { text = "The old ways must be carved, not only written.", next = "BACK", reply = "So I believe, and so my father believed. Perhaps you will tell the young that, since they no longer listen to me.", fx = { align = { order = 1 } } },
        { text = "Let the young find their own ways to tell it.", next = "BACK", reply = "Perhaps they will, and perhaps I am only an old carver grumbling. The Earth Mother has seen many changes and still she endures.", fx = { align = { order = -1 } } },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    pigments = {
      lines = {
        { id = "pg_default", text = "It is, and the yellow and the white are nearly gone as well. The colours come from earth and stone and growing things out on the plains, and I have not walked far enough to gather them in many seasons." },
        { id = "pg_active", when = { questActive = TODO_QUEST("Pigments for Paints") }, text = "You carry my request already, so you know the need. The earth keeps its colours close, but it gives them to those who look." },
      },
      choices = {
        { text = "I can gather what you need.", next = "pigments_help" },
        { text = "Couldn't you buy paint from a merchant?", next = "pigments_buy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pigments_help = {
      lines = { { id = "ph_default", text = "Then I would be grateful, and the totems more so. Speak to me when you are ready to listen, and I will tell you what I need and where the land keeps it." } },
      choices = {
        { text = "I'll do it gladly, Tah.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Let me think on it.", next = "BACK" },
      },
    },
    pigments_buy = {
      big = true,
      lines = { { id = "pb_default", text = "The goblins sell paint in little jars, bright as a fire and twice as foul. It flakes in a season and smells of the Barrens oil pits, and I will not put it on anything an ancestor must look upon." } },
      choices = {
        { text = "Then the work deserves pigments gathered by hand.", next = "BACK", reply = "It does, and I am glad you see it. A slow thing done well lasts longer than a quick thing done cheaply.", fx = { align = { order = 1 } } },
        { text = "Goblin paint is still paint. Use what works.", next = "BACK", reply = "Spoken like a trader. I have seen goblin paint run in the first rain, and I will keep my own ways a while yet.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribes = {
      lines = { { id = "tr_default", text = "Each tribe once carved its own, and some still do. The Ragetotem carve with an angry hand, the Runetotem carve with a druid's patience, and the Grimtotem on Elder Rise carve nothing they will show to outsiders." } },
      choices = {
        { text = "The Grimtotem keep strange company here.", next = "tribes_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribes_grim = {
      lines = { { id = "tg_default", text = "Cairne gave them a place among us, and Magatha sits on the Elder Rise as if it were hers alone. I paint my totems and keep my opinions in my mouth, which is where an old carver should keep them." } },
      choices = {
        { text = "Wise of you. I'll keep mine there too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    shaman = {
      big = true,
      lines = { { id = "sh_default", text = "Then you know what a totem is for better than most who buy one. Some shamans tell me paint means nothing to the elements, and some tell me it means everything; which do you say?" } },
      choices = {
        { text = "Care in the making honours the spirits.", next = "BACK", reply = "That is what I have always believed, and it is good to hear it from one who speaks to them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The elements answer strength, not paint.", next = "BACK", reply = "Perhaps they do, but the ancestors answer care. I paint for them as much as for the elements.", fx = { align = { light = -1 } } },
        { text = "Something else, Tah.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "They do, druid. Every totem holds a tribe's memory, and Hamuul's people on Elder Rise remind me that the Earth Mother is in the wood before ever I touch it with a knife." } },
      choices = {
        { text = "Then you and the druids agree.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carve totems on the High Rise and I paint them. There is little else to tell, and I prefer it that way." } },
    grimtotem = { { id = "tp_grim", text = "They carve, but not for us. I leave it there." } },
    _none = { { id = "tp_none", text = "I could not say. Ask me about wood or paint, and I will talk until the sun goes down." } },
  },
}

---------------------------------------------------------------------------
-- Komin Winterhoof: herbalism trainer at Holistic Herbalism. Forever: ends Camping 101: Herbalism.
---------------------------------------------------------------------------
P:NPC {
  key = "komin", id = TODO_NPC("Komin Winterhoof"), name = "Komin Winterhoof", title = "Herbalism Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gentle", "patient" }, values = { "nature", "craft" },
  notices = { "craft", "class" },
  impression = {
    first = "Komin Winterhoof teaches herbalism at Holistic Herbalism on the middle rise, where the air is thick with drying leaves. He speaks slowly and thanks every herb he handles, out loud, without any embarrassment at all.",
    third = "{name} met Komin Winterhoof, the patient herbalism trainer of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Holistic Herbalism. Breathe deep; the peacebloom is drying, and it is good for the spirit." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you return, and with soil on your hooves, I hope." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { name = "Herbalism", min = 75 } },
      text = "You carry the smell of silverleaf and earthroot. You have been gathering, and gathering well, I think." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You will know half of what I teach before I say it, so I will try to teach you the other half." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Komin Winterhoof, and I teach the gathering of herbs. Nida sorts the leaves while I teach, and between us we keep half of Thunder Bluff's healers in poultices." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Herbalism") }, text = "Kaga Wildhoof sent you, I can tell, because you have the look of someone who has slept beside a fire. Show me what you have learned of herbs, and I will show you how to make an incense candle for your camp." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Herbalism") }, text = "How burns the candle? Remember, it is for the wild places, not for the middle of a town." },
      },
      again = {
        { id = "h_again", text = "What else? The leaves will wait for us." },
        { id = "h_again2", text = "Ask what you will. I have no hurry in me." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "Where do the best herbs grow in Mulgore?", next = "grows" },
        { text = "You thank every leaf you pick up.", next = "thanks" },
        { text = "What does an herbalist bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Herbalism") } },
        { text = "Do the Forsaken buy your herbs?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    grows = {
      lines = { { id = "gr_default", text = "Peacebloom and silverleaf grow everywhere the grass is long, and earthroot hides where the ground has been broken. Mageroyal and briarthorn you will find in the Barrens, if the quilboar leave you time to look." } },
      choices = {
        { text = "And further than the Barrens?", next = "grows_far" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows_far = {
      lines = { { id = "gf_default", text = "Stonetalon has herbs that grow nowhere else, though the goblins of the Venture Company are cutting the slopes bare. Go there while there is still something to gather, and take only what you need." } },
      choices = {
        { text = "I'll remember that, Komin.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thanks = {
      big = true,
      lines = { { id = "th_default", text = "I do, and I will not stop because a young one finds it strange. Every herb is a gift from the Earth Mother, and a gift you do not thank for is a gift you have stolen." } },
      choices = {
        { text = "Then I'll thank them too.", next = "BACK", reply = "Good. You will find the land gives more freely to those who do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A plant can't hear thanks. Only the gathering matters.", next = "BACK", reply = "Perhaps it cannot, but you can, and so can the Earth Mother. I will keep thanking them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "Calm, and a clear head in the morning. The incense candle is made with herbs that soothe, and a weary healer who sleeps beside one will rise with more in them to give." } },
      choices = {
        { text = "Then show me how it's made.", next = "BACK" },
      },
    },
    forsaken = {
      big = true,
      lines = { { id = "fo_default", text = "Your apothecaries on Spirit Rise buy more than anyone, and they do not tell me what they brew. I sell to them because they are of the Horde, but I do not sleep easily on it." } },
      choices = {
        { text = "They brew medicine, Komin. Rest easy.", next = "BACK", reply = "If you say so, then I will try. I would be glad to be wrong about them.", fx = { align = { honor = 1 } } },
        { text = "Best you don't ask what they brew.", next = "BACK", reply = "That is exactly what troubles me. I will keep asking, all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I teach herbs on the middle rise. Before that, I gathered them on the plains, and some days I wish I still did." } },
    camping = { { id = "tp_camp", text = "Kaga Wildhoof teaches the fire, and I teach the herbs to burn beside it. Ask her first." } },
    _none = { { id = "tp_none", text = "That is not a thing that grows, so I know little of it. Ask me about leaves." } },
  },
}

---------------------------------------------------------------------------
-- Brek Stonehoof: mining trainer at Stonehoof Geology. Forever: ends Camping 101: Mining.
---------------------------------------------------------------------------
P:NPC {
  key = "brek_stonehoof", id = TODO_NPC("Brek Stonehoof"), name = "Brek Stonehoof", title = "Mining Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gruff", "steady" }, values = { "craft", "family" },
  notices = { "craft", "race" },
  impression = {
    first = "Brek Stonehoof teaches mining at Stonehoof Geology on the lower rise, and he knocks on the stone of the bluff as he talks, as if to check it is still sound. He has the Stonehoof stubbornness, and he seems proud of it.",
    third = "{name} met Brek Stonehoof, the mining trainer at Stonehoof Geology in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Stonehoof Geology. If you want to learn what's under the grass, you've come to the right tent." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me see your pick; I can tell a lot from the edge on it." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone, and the bluff has not fallen down. I checked this morning." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A young one of the tribes. You have the shoulders for a pick, whatever else you have chosen to carry." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Then you are my best kind of customer, because you need the ore and you know what it is worth." },
    { id = "n_mine", cat = "craft", when = { profession = { name = "Mining", min = 75 } },
      text = "There's copper dust in the creases of your hands. Good; that means you've been working and not only talking about it." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people taught us more about digging than we like to admit, and I'll admit it once, here, and not again." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brek Stonehoof. I teach mining, and my kin teach what to do with the ore after: Karn at the forge, Orm with his helms, and Melor wherever he's wandered off to this season." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Mining") }, text = "Kaga sent you up to learn what a miner brings to a camp. Show me you can work a vein first, and then we'll talk about it." },
      },
      again = {
        { id = "h_again3", text = "Yes? Mind your hooves on that slag." },
        { id = "h_again", text = "What else? Talk quick; I've ore to sort." },
        { id = "h_again2", text = "Go on. Stone doesn't hurry, and neither do I." },
      },
      choices = {
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Do tauren really dig into the Earth Mother?", next = "earth" },
        { text = "Where is the ore near Mulgore?", next = "ore" },
        { text = "What does a miner bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Mining") } },
        { text = "Tell me about the Stonehoof kin.", next = "kin" },
        { text = "You keep knocking on the bluff as you talk.", next = "knock" },
        { text = "I already carry a pick, Brek.", next = "miner", when = { profession = { name = "Mining", min = 50 } } },
        { text = "My people mined Durotar's red rock.", next = "orc", when = { race = { "Orc", "Troll" } } },
        { text = "Stone and ore. I'm on my way.", next = "END" },
      },
    },
    earth = {
      big = true,
      lines = { { id = "ea_default", text = "Some of the elders frown on it, and I understand why. I say the Earth Mother gave us ore the same as she gave us grass and kodo, and a careful miner takes no more than a careful hunter does; but you'll hear otherwise on Elder Rise." } },
      choices = {
        { text = "A careful miner honours her as much as any hunter.", next = "BACK", reply = "That's what I tell the elders, and they grumble and buy my copper anyway.", fx = { align = { order = -1 } } },
        { text = "The elders are right. Ore should stay buried.", next = "BACK", reply = "Then you'll be fighting with a sharpened stick, friend. The elders don't say no to steel when the centaur come.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = { { id = "or_default", text = "Copper in the hills of Mulgore, if the Venture Company hasn't dug it all out first. Further out, there's tin in the Barrens and Stonetalon, and the goblins are digging there faster than anyone ought to." } },
      choices = {
        { text = "The Venture Company is in Mulgore too?", next = "ore_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_venture = {
      lines = { { id = "ov_default", text = "They dug a mine in the hills of Mulgore and set their machines on the land, as if it were theirs to strip. Baine's braves have been chasing them off, but goblins are like weeds in a field: you pull one, two more come up." } },
      choices = {
        { text = "They'll find me less patient than the braves.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else, Brek.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "A miner knows how to make a fire burn hot and how to bank it so it lasts the night. I'll teach you the rest once you've proved your pick is more than decoration." } },
      choices = {
        { text = "Fair enough.", next = "BACK" },
      },
    },
    kin = {
      lines = {
        { id = "kin_d", text = "There are more of us on this bluff than there are totems. Karn runs the forge, Thrag hammers beside him, Taur sells the smith's supplies, Kurm sells the picks, Jyn sells whatever blades come out of it all, and I pull the ore that starts the whole business." },
      },
      choices = {
        { text = "And Melor? You said he wanders.", next = "kin_melor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin_melor = {
      lines = {
        { id = "kin_melor_d", text = "Melor is the hunter of the family, and he would rather sleep under a thorn tree in the Barrens than under a roof up here. He comes home to Hunter Rise when he runs out of arrows or stories, and he leaves again when he has both." },
      },
      choices = {
        { text = "Every herd needs one who roams.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knock = {
      lines = {
        { id = "knock_d", text = "Habit, and a miner's caution. This whole city sits on four pillars of stone, and I like to hear for myself that they are still sound, whatever the elders say about the Earth Mother holding us up." },
      },
      choices = {
        { text = "And are they sound?", next = "knock_sound" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knock_sound = {
      big = true,
      lines = {
        { id = "knock_sound_d", text = "As sound as the day Cairne chose them, and they will be standing when my grandchildren's grandchildren are dust. The only thing that could bring down a bluff like this is somebody digging under it, which is why I teach the young ones where not to swing." },
      },
      choices = {
        { text = "Rules for digging are right. The city depends on them.", next = "BACK", reply = "That it does. I will make a miner of you yet, with talk like that.", fx = { align = { order = 1 } } },
        { text = "Ore is where you find it. Rules don't move veins.", next = "BACK", reply = "No, but they keep roofs up. Dig where you like in the Barrens, and dig where I tell you in Mulgore.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    miner = {
      lines = {
        { id = "miner_d", text = "Then you have felt a vein ring under the pick when it runs true, and I need not explain why I love this work. When you have copper to smelt, Karn's forge by the pond is open to anyone who cleans up after themselves." },
      },
      choices = {
        { text = "I'll leave it cleaner than I found it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = {
        { id = "orc_d", text = "So I have heard, and a harder country I cannot imagine. The orcs who come up here for training tell me the rock in Durotar splits like old bread, and I tell them that Mulgore's stone has better manners." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Listen to the rock before you swing. A vein that rings dull is already played out, and you will only tire your arm." } },
    background = { { id = "tp_bg", text = "I'm a Stonehoof. We work stone and metal, and we argue about it at supper." } },
    stonehoof = { { id = "tp_stonehoof", text = "Karn, Orm, Melor, Zangen and me, and more cousins than I can count. We're a tribe that likes its hands dirty." } },
    _none = { { id = "tp_none", text = "Never dug that up. Ask somebody who doesn't spend all day looking at rocks." } },
  },
}

---------------------------------------------------------------------------
-- Mooranta: skinning trainer on the middle rise.
---------------------------------------------------------------------------
P:NPC {
  key = "mooranta", id = TODO_NPC("Mooranta"), name = "Mooranta", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "blunt", "warm" }, values = { "respect", "craft" },
  notices = { "class", "craft" },
  impression = {
    first = "Mooranta teaches skinning on the middle rise and wastes nothing, not a hide, not a sinew and not a word. She says every beast gives itself twice, once to the hunter and once to the skinner, and she expects the skinner to be worthy of it.",
    third = "{name} met Mooranta, the blunt and careful skinning trainer of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "If you've come to learn skinning, sharpen your knife first. A dull blade dishonours the beast." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Show me your hands; I want to see if you've been working." },
    { id = "g_away", when = { away = 14 }, text = "{away}, and I hope you wasted nothing in all that time." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You have a hunter's quiet about you, young one, the kind our people are born with and the others have to learn." },
    { id = "n_skin", cat = "craft", when = { profession = { name = "Skinning", min = 75 } },
      text = "You've been skinning, and cleanly too, by the look of the leather on your belt. Good." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} watches my knife very closely. Tell it I only work on the dead." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mooranta, and I teach skinning. A good skinner wastes nothing the beast gave, because the beast held nothing back from us." },
        { id = "h_skinner", when = { profession = "Skinning" }, text = "I am Mooranta. You carry a skinning knife already, and you carry it where you can reach it, so somebody has taught you the first lesson." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Mooranta, and you are a hunter, so half of what you kill will come across a table like mine. Learn to do the second half yourself, and you will owe nobody." },
      },
      again = {
        { id = "h_again3", text = "Speak. The hide will not scrape itself, but it will wait." },
        { id = "h_again", text = "What else? Be quick, or be useful." },
        { id = "h_again2", text = "Ask. My hands keep working while my mouth does." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "Who buys the hides you take?", next = "hides" },
        { text = "What do you mean, the beast gives itself twice?", next = "twice" },
        { text = "Some skinners just sell the best hide and leave the rest.", next = "waste" },
        { text = "Who sends hunters to you?", next = "hunters" },
        { text = "Thunder Bluff must use a great many hides.", next = "city" },
        { text = "My beast and I hunt together.", next = "pet", when = { class = "HUNTER" } },
        { text = "I tan and stitch what I skin.", next = "lw", when = { profession = "Leatherworking" } },
        { text = "I was taught to thank the beast first.", next = "thanks", when = { race = "Tauren" } },
        { text = "Earth Mother keep you, Mooranta.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Una and her leatherworkers take most of them, and Ahanu at Hewa's Armory takes what she doesn't. A plainstrider hide goes for boots, a kodo hide for a tent, and nothing goes to the fire if I can help it." } },
      choices = {
        { text = "And the bones?", next = "hides_bones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_bones = {
      lines = { { id = "hb_default", text = "Bones for needles and tools, horns for the drum-makers on Elder Rise, and sinew for bowstrings at the Thunderhorns' shop. When I say nothing is wasted, I mean it." } },
      choices = {
        { text = "That's a good way to work.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    twice = {
      lines = { { id = "tw_default", text = "Once to the hunter, who takes its life, and once to the skinner, who takes the rest. The hunter's debt is paid in prayer, but the skinner's debt is paid in care, because a torn hide is a gift thrown in the dirt." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    waste = {
      big = true,
      lines = { { id = "wa_default", text = "They do, and they are not skinners, they are thieves with knives. I have seen whole kodo left to the vultures in the Barrens for the sake of one good hide." } },
      choices = {
        { text = "Then I'll take everything the beast gives.", next = "BACK", reply = "Then you will be a skinner, and not a thief. Come and learn.", fx = { align = { honor = 1 } } },
        { text = "Coin is coin. The best hide pays.", next = "BACK", reply = "Then you will grow rich and the plains will grow empty. I hope you are proud of it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters = {
      lines = {
        { id = "hunters_d", text = "Holt Thunderhorn and his kin on Hunter Rise send me every student who can bring down a prowler, because they will not have a hunter who cannot dress a kill. Melor Stonehoof sends me the rest, usually with a note that only says to be hard on them." },
      },
      choices = {
        { text = "And are you hard on them?", next = "hunters_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters_hard = {
      big = true,
      lines = {
        { id = "hunters_hard_d", text = "I am exact with them, which they take for hardness. A calf who nicks a hide does it again for me on a fresh one, and again, until the knife goes where the eye tells it to." },
      },
      choices = {
        { text = "Exactness is a kindness, in the end.", next = "BACK", reply = "It is. The beast cannot be asked to die a second time so that a student may practise.", fx = { align = { order = 1 } } },
        { text = "Let them make mistakes. That's how I learned.", next = "BACK", reply = "And how many hides did your learning spoil? I would rather spoil their pride.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = {
        { id = "city_d", text = "More than you would think. Every tent on these rises is hide, every drum, every saddle strap on Tal's wind riders, and the great lodge of the High Chieftain took the skins of forty kodo that died in their own time." },
      },
      choices = {
        { text = "Forty kodo, and none hunted?", next = "city_kodo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    city_kodo = {
      lines = {
        { id = "city_kodo_d", text = "None. Cairne would not have a roof over his head that was taken before its time, and the tribes waited two winters for the last of those hides. That is the kind of patience I try to teach, and mostly fail to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pet = {
      lines = {
        { id = "pet_d", text = "Then teach it to leave the kill alone once it is down. I have had hunters bring me a prowler so chewed that there was nothing left to take but the tail, and I sent them back to Holt with it." },
      },
      choices = {
        { text = "My beast knows better.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lw = {
      lines = {
        { id = "lw_d", text = "Good. Then you finish what you begin, and I have more respect for that than for any amount of hunting. Show your work to Una when you think it is ready, and show it to Tarn first if you want the truth gently." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    thanks = {
      lines = {
        { id = "thanks_d", text = "Then you were taught properly, and I have nothing to add but practice. Say the words before the cut and not after it, because after is only an apology." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Skin while the beast is still warm, and keep your blade shallow. The hide wants to come away, if you let it." } },
    background = { { id = "tp_bg", text = "I skin, and I teach skinning. Everything else is talk." } },
    _none = { { id = "tp_none", text = "I know hides and knives. That isn't either." } },
  },
}

---------------------------------------------------------------------------
-- Netali Proudwind: general goods on Spirit Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "netali", id = TODO_NPC("Netali Proudwind"), name = "Netali Proudwind", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful", "chatty" }, values = { "community", "trade" },
  notices = { "race", "class" },
  impression = {
    first = "Netali Proudwind sells general goods on Spirit Rise, where the shamans and priests come and go, and she knows all of them by what they buy. She is cheerful company and doesn't seem to mind the Forsaken in the pools below as much as some.",
    third = "{name} met Netali Proudwind, who sells general goods on Spirit Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Spirit Rise! Thread, flasks, flour, flint, and whatever else a walker of the spirit world forgets to bring." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Did the flasks hold? They usually do." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you were last up here. The rise has been dull without you." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! You'll be wanting the lodge across the way, but come back to me afterward, because they'll send you for supplies." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Another priest! You'll be wanting candles, then, and I've just had a fresh box up from Bloodhoof." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers! Your shamans buy more feathers from me than anyone, and I still don't know what they do with them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Netali Proudwind, and I keep the shop on Spirit Rise. The shamans need flasks, the priests need candles, and everybody needs flour, so I'm never short of company." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "Up from the Pools of Vision? Your people buy the strangest things, but they always pay in full, and I can't say that of everyone on this rise." },
      },
      again = {
        { id = "h_again3", text = "Yes? Go on, the shop's quiet." },
        { id = "h_again", text = "Anything else, friend? I'm in no hurry." },
        { id = "h_again2", text = "Go on, I love a chat between customers." },
      },
      choices = {
        { text = "Let me see what you sell.", next = "BUSINESS" },
        { text = "Who comes up to Spirit Rise?", next = "rise" },
        { text = "What lies under this rise?", next = "pools" },
        { text = "You must hear every bit of gossip in the city.", next = "gossip" },
        { text = "Who are your neighbours on this rise?", next = "neighbours" },
        { text = "Candles for the priests? Tauren priests are rare.", next = "priests" },
        { text = "I'm bound for the Pools of Vision myself.", next = "mine", when = { race = "Scourge" } },
        { text = "What do the shamans buy from you?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Good day, Netali.", next = "END" },
      },
    },
    rise = {
      lines = { { id = "ri_default", text = "Shamans to the elders, priests to the spirit lodge, and the young ones who want to be both. Some days it's so quiet you can hear the wind on the totems, and some days I can't keep the candles on the shelf." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pools = {
      lines = { { id = "po_default", text = "The Pools of Vision, where the earth goes deep and the water shows things it oughtn't. Cairne lets the Forsaken keep their mages and apothecaries down there, and some of our people still won't walk past the stair." } },
      choices = {
        { text = "And you?", next = "pools_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pools_you = {
      big = true,
      lines = { { id = "pu_default", text = "I sell them flour and thread like anyone else. If the High Chieftain says they are our allies, I'll treat them as allies, though I do wish they'd stop asking whether I sell bones." } },
      choices = {
        { text = "Cairne is right. Allies are allies.", next = "BACK", reply = "That's what I think too, and it's good for trade besides.", fx = { align = { order = 1 } } },
        { text = "I'd keep a closer eye on them, Netali.", next = "BACK", reply = "Oh, I do, friend, I count my candles twice when they've been in. But I still sell to them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip = {
      lines = { { id = "go_default", text = "Every bit, though I only pass on the kind ones. The rest I keep, and believe me, there's enough of it to fill a kodo's saddlebags." } },
      choices = {
        { text = "Then give me a kind one.", next = "gossip_kind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_kind = {
      lines = { { id = "gk_default", text = "Aska Mistrunner fed three young braves for free last week because they looked thin, and then told them off for not eating properly. That's the kind of gossip I like." } },
      choices = {
        { text = "That sounds like her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "neighbours_d", text = "Tigor, Siln and Beram Skychaser teach the young shamans across the way, and Xanis Flameweaver frightens them a little, which I think she enjoys. Old Chesmu comes up from the bank on his rest days to complain about the stairs." },
      },
      choices = {
        { text = "And Magatha's people?", next = "neighbours_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours_grim = {
      big = true,
      lines = {
        { id = "neighbours_grim_d", text = "The Grimtotem keep to Elder Rise, mostly, but her messengers pass through here on the way to the pools. They are polite, and they never stay to talk, and I have learned not to wonder aloud where they are going." },
      },
      choices = {
        { text = "Wonder aloud. Someone ought to.", next = "BACK", reply = "Perhaps someone ought. I sell flour, friend, and I would like to go on selling it.", fx = { align = { order = -1 } } },
        { text = "Best to leave an elder's business alone.", next = "BACK", reply = "That is what I tell myself, and it lets me sleep. Thank you for agreeing with me.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests = {
      lines = {
        { id = "priests_d", text = "They are not ours, mostly. The priests in the spirit lodge are Forsaken, Father Cobb and his two colleagues, and they burn through candles as though they were afraid of the dark, which I would not have expected." },
      },
      choices = {
        { text = "What are they like as customers?", next = "priests_cobb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests_cobb = {
      lines = {
        { id = "priests_cobb_d", text = "Father Cobb is courteous in a way that feels a hundred years old, and he counts his change twice. Miles Welsh once asked me whether the flour was for eating, and I am still not sure if he was joking." },
      },
      choices = {
        { text = "With the Forsaken, it's hard to tell.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = {
        { id = "mine_d", text = "Then take the ramp down past the lodge and mind the wet stone. I'll say this for your apothecaries, they have never once tracked anything nasty into my shop, which is more than I can say for the young braves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      lines = {
        { id = "shaman_d", text = "Flasks, thread for their totem bindings, and more ankhs than I can keep on the shelf. Beram Skychaser buys the ankhs by the dozen and says his students lose them, though I suspect they use them." },
      },
      choices = {
        { text = "They use them. I promise you that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Buy your candles before the storms come in, friend. Everyone on the bluff remembers them at the same moment." } },
    background = { { id = "tp_bg", text = "I keep a shop on Spirit Rise. I've seen more shamans pass my counter than the elders have, I'd wager." } },
    _none = { { id = "tp_none", text = "Oh, I've no idea, friend. If it isn't on my shelf or in somebody's gossip, I've not heard of it." } },
  },
}

---------------------------------------------------------------------------
-- Sunn Ragetotem: staff merchant on the High Rise (the rainsticks shop).
---------------------------------------------------------------------------
P:NPC {
  key = "sunn", id = TODO_NPC("Sunn Ragetotem"), name = "Sunn Ragetotem", title = "Staff Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "proud", "dry" }, values = { "tribe", "craft" },
  notices = { "class" },
  impression = {
    first = "Sunn Ragetotem sells staves on the High Rise under a sign that promises rainsticks, and she shakes one at every customer so they can hear the rain inside. She is a Ragetotem, and she makes sure you know it.",
    third = "{name} met Sunn Ragetotem, who sells staves and rainsticks on the High Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Listen to this one. That is the sound of rain on the plains, held in a stick of cured wood." },
    { id = "g_back", when = { metBefore = true }, text = "Back for a staff, or back to hear the rain again? Both are welcome." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you were on this rise. It has rained twice, and I claim no credit." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You turned your head when the rainstick moved. Every one of our people does, and the orcs never notice it at all." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid's hands. You'll want a staff that bends before it breaks, and I have one or two." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Take this rainstick in your hands and tell me the water spirits don't know it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Sunn Ragetotem. I sell staves, mostly, and rainsticks to anyone who misses the sound of a storm up here on the bluff." },
        { id = "h_caster", when = { class = { "DRUID", "SHAMAN", "MAGE", "PRIEST", "WARLOCK" } }, text = "I am Sunn Ragetotem, and you have the look of someone who leans on a staff for more than walking. Good, because those are the customers I keep the best wood for." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "I am Sunn Ragetotem. If it is steel you want, warrior, my kin in the weapon hall will see to you, but stay a moment and hear the rain first." },
      },
      again = {
        { id = "h_again3", text = "Yes? Shake one while you think, if you like." },
        { id = "h_again", text = "What else? I am listening, and so is the rain." },
        { id = "h_again2", text = "Ask. A Ragetotem answers straight." },
      },
      choices = {
        { text = "Show me your staves.", next = "BUSINESS" },
        { text = "What is a rainstick for?", next = "rain" },
        { text = "The Ragetotem have a fierce name.", next = "ragetotem" },
        { text = "I need a staff for the spirits, not for fighting.", next = "caster", when = { class = { "SHAMAN", "DRUID", "PRIEST", "MAGE" } } },
        { text = "Who else trades on the High Rise?", next = "rise" },
        { text = "Where does the wood for a staff come from?", next = "wood" },
        { text = "Tell me of the Ragetotem warriors.", next = "warriors", when = { class = "WARRIOR" } },
        { text = "I remember rainsticks from when I was a calf.", next = "calf", when = { race = "Tauren" } },
        { text = "Farewell, Sunn.", next = "END" },
      },
    },
    rain = {
      lines = { { id = "ra_default", text = "For remembering the rain, and some say for calling it. The old ones shook them in the dry seasons when the herds grew thin, and the young ones buy them now because the sound helps them sleep." } },
      choices = {
        { text = "Does it really call the rain?", next = "rain_call" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rain_call = {
      lines = { { id = "rc_default", text = "Ask a shaman, not a merchant. I can promise you the sound, and I leave the clouds to the Earth Mother." } },
      choices = {
        { text = "An honest answer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ragetotem = {
      big = true,
      lines = { { id = "rt_default", text = "It is a warrior's name, and we earned it fighting the centaur when the other tribes were still arguing. Ker, Sark, Taim and Torm keep our name on Hunter Rise, and I keep it here, in good wood." } },
      choices = {
        { text = "A fierce name, honestly earned, should be worn proudly.", next = "BACK", reply = "It should, and we do. Remember it when the centaur come again.", fx = { align = { honor = 1 } } },
        { text = "Names fade. Only what you do now matters.", next = "BACK", reply = "Spoken like someone with no famous name. We will keep doing, and keep the name besides.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caster = {
      lines = { { id = "ca_default", text = "Then you want lighter wood, and a straight grain that will hold a charm. Come, I have a few that were cut from the high groves of Stonetalon, before the goblins came." } },
      choices = {
        { text = "Let me look at them.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = {
        { id = "rise_d", text = "My own kin, mostly, in the weapon hall: Kard, Delgo and Etu sell the blades and maces, and the rest of the Ragetotem train warriors on Hunter Rise. Kuruk has the general goods beside the great tent, and Nan Mistrunner sells fruit that she swears is ripe." },
      },
      choices = {
        { text = "Why staves, when your kin sell steel?", next = "rise_staves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise_staves = {
      big = true,
      lines = {
        { id = "rise_staves_d", text = "Because someone in a family of warriors ought to sell a thing that is not meant for splitting skulls. My kin laughed at first, and then the druids of Elder Rise began sending their students to me, and they laughed less." },
      },
      choices = {
        { text = "You chose your own path. Good.", next = "BACK", reply = "I did, and I have not regretted it. A name is where you start, and where you go is your own affair.", fx = { align = { order = -1 } } },
        { text = "A Ragetotem should carry on the warrior's trade.", next = "BACK", reply = "My uncle says the same, loudly, at every feast. A staff has cracked more skulls than he likes to admit.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = {
        { id = "wood_d", text = "From Mulgore's river trees for the plain ones, and from Stonetalon for the hard timber, when traders bring it down. I will not take wood cut in Ashenvale, whatever the Warsong offer, because the price of that timber is paid by somebody else." },
      },
      choices = {
        { text = "How do you choose a branch?", next = "wood_choose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_choose = {
      lines = {
        { id = "wood_choose_d", text = "I look for one the wind has already tested, grown on an open bank and bent a little without breaking. A staff from a sheltered tree is pretty and it will fail you, as sheltered things do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    warriors = {
      lines = {
        { id = "warriors_d", text = "Then go to Hunter Rise and find Sark, Torm and Ker, who will tell you everything and shout most of it. They taught half the braves who held the line against the centaur, and they have not let anyone forget it." },
      },
      choices = {
        { text = "I'll bear the shouting.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    calf = {
      lines = {
        { id = "calf_d", text = "Then some grandmother shook one over your bed when the dry wind kept you awake, and you slept. They buy them from me now for their own grandchildren, and I have never once had one brought back." },
      },
      choices = {
        { text = "Mine did exactly that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Hold a staff a hand's width below where it feels natural. You will thank me the first time something heavy lands on it." } },
    background = { { id = "tp_bg", text = "Ragetotem by birth, staff-maker by choice, and merchant because the staves must go somewhere." } },
    _none = { { id = "tp_none", text = "I don't know. Shake a rainstick and ask the spirits, they may have a better answer." } },
  },
}

---------------------------------------------------------------------------
-- Jyn Stonehoof: weapons merchant on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "jyn_stonehoof", id = TODO_NPC("Jyn Stonehoof"), name = "Jyn Stonehoof", title = "Weapons Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "brisk", "sharp" }, values = { "craft", "family" },
  notices = { "class" },
  impression = {
    first = "Jyn Stonehoof sells weapons on the lower rise, mostly forged by her own Stonehoof kin, and she will tell you the weight and balance of every one before you ask. She has no patience for anyone who buys a blade for its looks.",
    third = "{name} met Jyn Stonehoof, the weapons merchant of Thunder Bluff's lower rise.",
  },
  greetings = {
    { id = "g_hi", text = "Weapons, friend, made on this bluff by Stonehoof hands. Pick one up; feel the balance before you look at the shine." },
    { id = "g_back", when = { metBefore = true }, text = "How's the blade holding? Bring it back if it isn't, and we'll see whose fault that is." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you were last in. I hope whatever you bought has blood on it by now." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That weapon of yours is one hard blow from being scrap. Get it to Karn's forge before you trust your life to it again." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people like their axes heavy at the head, and I keep a few that way for exactly that reason." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Good, I like selling to someone who will actually use what they buy." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jyn Stonehoof. My cousins forge, and I sell, which suits all of us, because Karn can't haggle and Orm won't." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Jyn Stonehoof. You stand like someone who has used what they carry, so I will skip the speech I give the calves and show you Karn's better work." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Jyn Stonehoof. You do not look as though you swing anything heavier than a staff, but everyone should own one good knife, and I have those as well." },
      },
      again = {
        { id = "h_again3", text = "Yes? Ask while I work the stone." },
        { id = "h_again", text = "What else? Make it quick; a customer's eyeing that axe." },
        { id = "h_again2", text = "Go on. I'm sharpening, not ignoring you." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What makes a good weapon?", next = "good" },
        { text = "Do you sell many to the young braves?", next = "braves" },
        { text = "A tauren weapon should be big and heavy.", next = "heavy" },
        { text = "Who else sells weapons on the bluff?", next = "rivals" },
        { text = "You can tell a buyer from a browser, I think.", next = "buyer" },
        { text = "Find me something I can truly swing.", next = "fit", when = { class = { "WARRIOR", "SHAMAN", "HUNTER" } } },
        { text = "I've hammered a blade or two myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Farewell, Jyn.", next = "END" },
      },
    },
    good = {
      lines = { { id = "gd_default", text = "Balance first, temper second, edge third, and looks last of all. A blade that sits wrong in your hand will tire you before the fight is half done, however pretty the hilt." } },
      choices = {
        { text = "And who tempers yours?", next = "good_karn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_karn = {
      lines = { { id = "gk_default", text = "Karn, at the forge by the great totem. He thanks the ore before he melts it, which I tease him for, but his blades don't break, so maybe the ore is listening." } },
      choices = {
        { text = "I'll thank my blade too, then.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    braves = {
      lines = { { id = "br_default", text = "Every season, after they've finished at Camp Narache and earned a few coins at Bloodhoof. They want the biggest axe on the rack and can barely lift it, so I sell them a good club and tell them to come back in a year." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    heavy = {
      big = true,
      lines = { { id = "hv_default", text = "Big, yes, because we are big; heavy, only if you can swing it twice. I've seen braves fall to centaur because they bought an axe to impress their friends and could not lift it a second time." } },
      choices = {
        { text = "A weapon is for the fight, not for pride.", next = "BACK", reply = "Exactly. Come and take the one that fits your arm, not your vanity.", fx = { align = { order = 1 } } },
        { text = "If they fear you, the fight's half won.", next = "BACK", reply = "Fear lasts one swing. After that you need balance. But I'll sell you the big one if you insist.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals = {
      lines = {
        { id = "rivals_d", text = "The Ragetotems have the hall on the high rise, and they sell every blade as if it had already won a war. Kard has the swords, Delgo the axes and Etu the maces, and Ohanko sells anything that takes two hands to lift." },
      },
      choices = {
        { text = "And how do you compete?", next = "rivals_compete" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals_compete = {
      big = true,
      lines = {
        { id = "rivals_compete_d", text = "By telling the truth, which costs me a sale now and then. If a brave cannot swing what he has picked up, I say so, and the Ragetotems would sooner sell it to him and wish him luck." },
      },
      choices = {
        { text = "Honest dealing is worth the lost sale.", next = "BACK", reply = "It is, in the long run, because they come back. The ones the Ragetotems oversell do not always come back at all.", fx = { align = { honor = 1 } } },
        { text = "A sale is a sale. Let the buyer beware.", next = "BACK", reply = "That is how a goblin trades. I am a Stonehoof, and my name is on what I sell.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyer = {
      lines = {
        { id = "buyer_d", text = "In the time it takes them to cross the shop. A buyer picks a thing up and tests the weight, and a browser strokes the edge and asks what it is made of." },
      },
      choices = {
        { text = "Which am I?", next = "buyer_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyer_me = {
      lines = {
        { id = "buyer_me_d", text = "You asked me a question before you touched anything, so you are either very careful or very poor. I have sold to both, and the careful ones are better company." },
      },
      choices = {
        { text = "Careful, I hope.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Poor, for now.", next = "BACK", reply = "Then come back when the Barrens have paid you. Everything here will keep.", fx = { trait = { witty = 1 } } },
      },
    },
    fit = {
      narr = "She takes the weapon out of your hands without asking and replaces it with another.",
      lines = {
        { id = "fit_d", text = "Then put down the one you are looking at, because it is too long for you by a hand. Try the one beside it, swing it three times without stopping, and tell me honestly whether your shoulder complains." },
      },
      choices = {
        { text = "It doesn't. I'll remember this one.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = {
        { id = "smith_d", text = "Have you, now? Then you know why I will not haggle on Karn's work. Bring me something of your own one day, and if it holds an edge, I may even put it on the rack beside his." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Buy the weapon you can swing all day, not the one that looks best on your back." } },
    background = { { id = "tp_bg", text = "I'm a Stonehoof who sells instead of forges. Somebody in the family had to learn to count." } },
    stonehoof = { { id = "tp_stonehoof", text = "We're metal and stone people. Brek digs it, Karn forges it, Orm shapes the helms and I sell what's left." } },
    _none = { { id = "tp_none", text = "Not my trade. If it hasn't got an edge, I don't keep track of it." } },
  },
}

---------------------------------------------------------------------------
-- Fyr Mistrunner: bread vendor at Breads and Grains on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "fyr", id = TODO_NPC("Fyr Mistrunner"), name = "Fyr Mistrunner", title = "Bread Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm", "gentle" }, values = { "community", "hospitality" },
  notices = { "race" },
  impression = {
    first = "Fyr Mistrunner sells bread at Breads and Grains on the lower rise, and the whole shop smells of warm corn and oat. She is gentle and slow-spoken, and she pressed a crust on me before I had decided to buy anything.",
    third = "{name} met Fyr Mistrunner, who bakes and sells bread at Breads and Grains in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Come in from the wind. The cornbread is still warm, and warm bread should not wait." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and hungry, I hope. I baked extra this morning." },
    { id = "g_away", when = { away = 14 }, text = "{away} without my bread. You look as though you felt it." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You have plains dust on you still. Sit a moment and eat something that grew in it." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "Your hands know a kneading board, I think. I can always tell by the wrists." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Do your people eat bread? Forgive me, I have never known how to ask it politely." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Fyr Mistrunner. I bake for the lower rise, and the grain comes up from the fields by Bloodhoof, so every loaf tastes a little of Mulgore." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Fyr Mistrunner, little one, and you look as though the lift up the bluff took the breath out of you. Sit by the oven a moment; the grain in these loaves grew on the same plains you did." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Fyr Mistrunner. Your people like their bread dark and hard, I am told, so I keep a few loaves a day longer for the orcs who come up from the Barrens." },
      },
      again = {
        { id = "h_again3", text = "Yes, little one? Mind the tray, it is hot." },
        { id = "h_again", text = "What else, little one? The oven keeps me company, but so do you." },
        { id = "h_again2", text = "Ask what you like. Bread rises in its own time." },
      },
      choices = {
        { text = "Let me buy some bread.", next = "BUSINESS" },
        { text = "Where does your grain come from?", next = "grain" },
        { text = "Are you kin to the other Mistrunners?", next = "kin" },
        { text = "Some say tauren bread is too plain.", next = "plain" },
        { text = "Who buys the most bread on the lower rise?", next = "buyers" },
        { text = "Baking for a whole city must be heavy work.", next = "work" },
        { text = "This smells like the bread of my mother's tent.", next = "tent", when = { race = "Tauren" } },
        { text = "Do the Forsaken below ever buy bread?", next = "dead", when = { race = "Scourge" } },
        { text = "I do some cooking of my own.", next = "cook", when = { profession = "Cooking" } },
        { text = "Walk with the Earth Mother, Fyr.", next = "END" },
      },
    },
    grain = {
      lines = { { id = "gr_default", text = "From the fields below Bloodhoof, where the farmers grow corn and oats in the long grass. When the harpies or the quilboar trouble the fields, my shelves go thin, and the whole rise goes hungry with them." } },
      choices = {
        { text = "Then I'll keep the fields safe.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "ki_default", text = "We are one family, spread across the bluff like crumbs. Aska cooks, Kah fishes, Kaga sells meat, and I bake, so between us no Mistrunner has ever gone hungry." } },
      choices = {
        { text = "Which of them is the best cook?", next = "kin_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin_best = {
      lines = { { id = "kb_default", text = "Aska, and she knows it, and she would want me to say so. Do not tell her I said her bread is heavier than mine, though, because that is also true." } },
      choices = {
        { text = "Your secret is safe with me.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plain = {
      big = true,
      lines = { { id = "pl_default", text = "Plain, perhaps, but honest; it fills a brave on a long hunt and does not spoil in a saddlebag. The Undercity bakers send down sweet things with sugar in them, and I could never eat them on the trail." } },
      choices = {
        { text = "Plain food for a plain life. It's right.", next = "BACK", reply = "It is the tauren way, and it has served us well. Have a crust.", fx = { align = { order = 1 } } },
        { text = "A little sweetness wouldn't hurt anyone.", next = "BACK", reply = "Perhaps I'll try some honey in the next batch. Do not tell Aska.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_d", text = "The Bluffwatchers, who come off their watch hungry enough to eat the basket. After them it is the wind rider handlers at Tal's tower, and Innkeeper Pala, who takes forty loaves each morning and always asks for forty-one." },
      },
      choices = {
        { text = "Do you give her the forty-first?", next = "buyers_pala" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_pala = {
      big = true,
      lines = {
        { id = "buyers_pala_d", text = "I do, and she knows I will, and we have never once spoken of it. That is how neighbours should be, I think; the kindness is done and nobody has to carry the thanks around afterward." },
      },
      choices = {
        { text = "A gift needs no ledger.", next = "BACK", reply = "Just so, little one. You would do well on the lower rise.", fx = { align = { light = 1 } } },
        { text = "She's taking advantage of you, Fyr.", next = "BACK", reply = "Perhaps she is, by one loaf a day. I can think of worse things to lose.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "work_d", text = "It is, and I start before An'she is up, when the rise is quiet and the only ones awake are the watchers and the bakers. I like that hour best, because the whole bluff smells of my oven and nobody has yet asked me for anything." },
      },
      choices = {
        { text = "What do you think about, at that hour?", next = "work_think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_think = {
      lines = {
        { id = "work_think_d", text = "About the grain, mostly, and whether the rains came at the right time for the fields below. When the plains are kind, the bread is sweet, and when they are not, I add a little honey and say nothing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tent = {
      lines = {
        { id = "tent_d", text = "Then your mother baked with ground oats and a little tallow, on a flat stone, the way we all did when the tribes still followed the kodo. I only have a bigger stone, and a roof over it." },
      },
      choices = {
        { text = "She would have liked your oven.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = {
        { id = "dead_d", text = "Some of you do, though I do not know what you do with it, and I have never liked to ask. One of the apothecaries told me she only wanted to remember the smell, so I gave her a warm loaf to carry down to the pools." },
      },
      choices = {
        { text = "That was kind of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = {
        { id = "cook_d", text = "Then go and see Aska on the high rise when you are ready to learn more, because she teaches the craft and I only practise one corner of it. Do not tell her your bread is better than hers, even if it is." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Carry flatbread on a long road and soft bread on a short one. The other way about, and you will be eating mould by the third day." } },
    background = { { id = "tp_bg", text = "I bake. My mother baked before me on the plains, in a stone oven we carried on a kodo." } },
    _none = { { id = "tp_none", text = "I don't know, little one. I know flour and fire, and not much else." } },
  },
}

---------------------------------------------------------------------------
-- Atepa: banker on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "atepa", id = TODO_NPC("Atepa"), name = "Atepa", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "thunder_bluff" }, temper = { "careful", "courteous" }, values = { "trust", "order" },
  notices = { "kit", "race" },
  impression = {
    first = "Atepa keeps accounts at the bank of Thunder Bluff with a patience that makes coin seem a solemn thing. Every question got a full answer, and nothing was hurried.",
    third = "{name} met Atepa, one of the bankers of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome to the bank of Thunder Bluff. What you leave with us will be here when you return, however long the road." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and so has everything you left. I checked it myself this morning." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you last stood at this counter. Nothing of yours has moved by so much as a finger's width." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A young one of the tribes, with a first purse. Do not be ashamed that it is light; every herd begins with one calf." },
    { id = "n_purse", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear has seen hard use, friend. If you have coin laid by with us, this may be the day to spend a little of it on a smith." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc of Orgrimmar. Your own city's vaults and ours answer to one another, so what you left there may be asked for here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Atepa, and I keep the bank with Chesmu and Torn. The tribes carried all they owned on their backs once, and now that we have a home, someone must mind what is set down." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Atepa. You are of the tribes, so you will understand me when I say this is not a goblin's bank; what is yours stays yours, and we take pride in that and little else." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "I am Atepa. Your people keep very exact accounts, I have found, and never forget a sum, which makes the Forsaken the easiest customers on the bluff." },
      },
      again = {
        { id = "h_again", text = "Is there something more? I have the time." },
        { id = "h_again2", text = "Ask, friend. The ledgers will keep." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "I'd like to see my vault.", next = "BUSINESS" },
        { text = "How did the tauren come to have a bank?", next = "how" },
        { text = "Who works beside you?", next = "others" },
        { text = "A bank on a clifftop must be hard to rob.", next = "rob" },
        { text = "My family never trusted coin.", next = "coin", when = { race = "Tauren" } },
        { text = "Do you deal with the goblin banks?", next = "goblin", when = { race = { "Orc", "Troll", "Scourge" } } },
        { text = "What do the tribes leave in your keeping?", next = "keep" },
        { text = "My thanks, Atepa.", next = "END" },
      },
    },
    how = {
      lines = {
        { id = "how_d", text = "When Cairne raised the first totem here, the tribes had more to keep than a kodo could carry, and nowhere to keep it. The orcs showed us how a ledger is ruled, and the rest we worked out between ourselves." },
      },
      choices = {
        { text = "What did you work out?", next = "how_rule" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_rule = {
      big = true,
      lines = {
        { id = "how_rule_d", text = "That a thing left in trust is a promise, and a promise is heavier than gold. We do not lend what is not ours, and we do not ask why anyone wants what is theirs." },
      },
      choices = {
        { text = "That's the only honest way to keep a vault.", next = "BACK", reply = "So we believe. It makes us poor bankers by Ratchet's measure, and I am content with that.", fx = { align = { honor = 1 } } },
        { text = "Coin sitting idle earns nothing. The goblins have it right.", next = "BACK", reply = "The goblins have a great many things, and other people's trust is not among them. We will keep to our way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_d", text = "Chesmu has been at this counter longest, and he remembers every face that has ever leaned on it. Torn is younger and quicker with figures, and between the two of them I am seldom needed for anything but courtesy." },
      },
      choices = {
        { text = "And the auction house next door?", next = "others_stampi" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_stampi = {
      lines = {
        { id = "others_stampi_d", text = "That is Stampi's affair, and he is welcome to the noise. Half of what is sold there is carried straight in here afterward, so I hear of every bargain within the hour, and of every regret." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rob = {
      lines = {
        { id = "rob_d", text = "It has been tried once, by a goblin who came up the lift with an empty sack and a great deal of confidence. The Bluffwatchers let him fill it, and then asked how he planned to get down." },
      },
      choices = {
        { text = "What became of him?", next = "rob_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rob_end = {
      lines = {
        { id = "rob_end_d", text = "He returned everything and was walked to the lift, and Cairne is said to have laughed for most of an afternoon. We have had no trouble since, for the story got about." },
      },
      choices = {
        { text = "A gentle justice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Too gentle. He'd have robbed you blind.", next = "BACK", reply = "Perhaps. But he tells the story against himself in every tavern in Ratchet, and that guards us better than a spear.", fx = { trait = { stern = 1 } } },
      },
    },
    coin = {
      lines = {
        { id = "coin_d", text = "Nor did mine, and I do not blame them. Coin cannot be eaten or worn, and it took me years to see that it is only a way of remembering what one person owes another." },
      },
      choices = {
        { text = "A ledger is a kind of memory, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin = {
      lines = {
        { id = "goblin_d", text = "We honour their notes and they honour ours, and each of us counts the other's coin twice. It is not friendship, but it has never yet failed a traveller." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = {
        { id = "keep_d", text = "Hides, totems, a grandmother's beads, the first horn a calf shed. The orcs bring us gold, and our own people bring us the things they could not bear to lose." },
      },
      choices = {
        { text = "Those matter more than the gold.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept accounts since the bluff was settled. Before that I kept count of the herd, and it is not so different." } },
    advice = { { id = "tp_ad", text = "Leave with us what you could not replace, and carry what you could. The road takes its share from everyone." } },
    _none = { { id = "tp_none", text = "That is beyond a banker's knowing. A Bluffwatcher could direct you better than I." } },
  },
}

---------------------------------------------------------------------------
-- Krumn: guild master on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "krumn", id = TODO_NPC("Krumn"), name = "Krumn", title = "Guild Master",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "hearty", "formal" }, values = { "fellowship", "tradition" },
  notices = { "kit", "race" },
  impression = {
    first = "Krumn registers guilds on the lower rise of Thunder Bluff and treats each charter like the founding of a small tribe. He asked who I travelled with before he asked anything else.",
    third = "{name} met Krumn, the guild master of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Well met. Do you walk alone, or do you walk with others? It is my business to ask." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Tell me, have you found companions worth a charter yet?" },
    { id = "g_guild", when = { guild = true }, text = "You wear a guild's name, and I am glad to see it. May your fellowship stand as long as these bluffs." },
    { id = "g_away", when = { away = 14 }, text = "{away} on the road. I hope you did not walk all of it alone." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the tribes. You were born into one fellowship already, so you know what the others are reaching for." },
    { id = "n_tabard", cat = "kit", when = { tabard = true },
      text = "That tabard sits well on you. Colours mean something when the one wearing them has earned them." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. Your people band together more tightly than any I register, and I think I understand why." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Krumn, and I keep the charters of those who band together under one name. A guild is a tribe that chose itself, and I see that each is founded properly." },
        { id = "h_guild", when = { guild = true }, text = "I am Krumn. You already walk under a banner, so I need not tell you what it is worth, only that Thrumn beside me can see to your tabard." },
        { id = "h_alone", when = { guild = false }, text = "I am Krumn. You bear no guild's name, and there is no shame in that, but when you find those you would bleed beside, bring them to me." },
      },
      again = {
        { id = "h_again", text = "What more would you ask? I have ink and time." },
        { id = "h_again2", text = "Speak, friend. No charter is waiting on me this hour." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "I have guild business.", next = "BUSINESS" },
        { text = "What makes a guild worth founding?", next = "worth" },
        { text = "How is a guild like a tribe?", next = "tribe" },
        { text = "Have you turned a charter away?", next = "refuse" },
        { text = "Who is Thrumn?", next = "thrumn" },
        { text = "The tribes were scattered once. I know that story.", next = "scattered", when = { race = "Tauren" } },
        { text = "My guildmates and I would honour Thunder Bluff.", next = "honour", when = { guild = true } },
        { text = "Farewell, Krumn.", next = "END" },
      },
    },
    worth = {
      lines = {
        { id = "worth_d", text = "A purpose that is larger than any one of its members, and ten signatures from those who believe in it. I can count the signatures, and the purpose I must take on trust." },
      },
      choices = {
        { text = "What purposes do you hear?", next = "worth_hear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worth_hear = {
      lines = {
        { id = "worth_hear_d", text = "To drive the centaur from the Barrens, to hunt the great beasts of Kalimdor, to grow rich, to be remembered. The honest ones say they only wish to have friends at their back, and those are the guilds that last." },
      },
      choices = {
        { text = "Friendship outlasts ambition.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe = {
      lines = {
        { id = "tribe_d", text = "It has a name, a leader and its own ways, and it looks after its own. The difference is that nobody is born into it, so every member has chosen to be there, and may choose to go." },
      },
      choices = {
        { text = "Which is stronger, then?", next = "tribe_strong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe_strong = {
      big = true,
      lines = {
        { id = "tribe_strong_d", text = "I have turned that over for many seasons. Blood holds when everything else fails, but a bond that is chosen is held more carefully, because it can be lost." },
      },
      choices = {
        { text = "Blood. Kin stand when friends scatter.", next = "BACK", reply = "So the elders say, and they have seen more winters than I. A tribe does not need a charter to endure.", fx = { align = { order = 1 } } },
        { text = "Choice. I'd rather be wanted than merely born.", next = "BACK", reply = "A bold thing to say on a tauren bluff. I will not tell the elders, but I will remember it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuse = {
      lines = {
        { id = "refuse_d", text = "Once, from a band who wished to call themselves by a name that mocked the High Chieftain. I told them to found it in Orgrimmar, if the orcs would have them, and I am told the orcs would not." },
      },
      choices = {
        { text = "You'd refuse a charter over a name?", next = "refuse_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuse_name = {
      lines = {
        { id = "refuse_name_d", text = "A name is the first thing a guild says to the world, and the last thing remembered of it. I will write nearly anything on a charter, but I will not write an insult to the one who gave us this home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    thrumn = {
      lines = {
        { id = "thrumn_d", text = "My neighbour at the next table, who sells the tabards. I write down who you are, and he sees that everyone else can tell at a glance, and we argue over which of us matters more." },
      },
      choices = {
        { text = "Which of you does?", next = "BACK", reply = "I do, plainly. Do not tell him I said so within his hearing.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scattered = {
      lines = {
        { id = "scattered_d", text = "Then you know that we were many small herds, each alone against the centaur, until Cairne gathered us. I think of that every time ten strangers sign a single page." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    honour = {
      lines = {
        { id = "honour_d", text = "Then carry its name where the tribes cannot go, and behave as though Cairne could see you. That is all the honour this city asks." },
      },
      choices = {
        { text = "We will.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept the tallies of my tribe before the bluff was raised. Now I keep the tallies of tribes that are not yet born." } },
    advice = { { id = "tp_ad", text = "Choose companions for how they behave when the hunt goes badly. Anyone is good company at a feast." } },
    _none = { { id = "tp_none", text = "That is not written in any charter of mine. Ask a Bluffwatcher, or old Chesmu at the bank." } },
  },
}

---------------------------------------------------------------------------
-- Stampi: auctioneer on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "stampi", id = TODO_NPC("Stampi"), name = "Stampi", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "loud", "cheerful" }, values = { "trade", "fairness" },
  notices = { "craft", "race" },
  impression = {
    first = "Stampi calls the auctions on the lower rise in a voice that carries across the bridges. He seemed to enjoy the shouting more than the selling, and to know the worth of everything by its weight in his hand.",
    third = "{name} met Stampi, the auctioneer of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Buying or selling? Speak up, friend, I have been shouting since dawn and I am half deaf from it." },
    { id = "g_back", when = { metBefore = true }, text = "Back to the block! Have you brought me something, or come to take something away?" },
    { id = "g_away", when = { away = 14 }, text = "{away} since you last bid here. Prices have gone up, down and up again, so you have missed nothing." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A young one with a first hide to sell, is it? Hold it up proudly; nobody bids on a thing its owner is ashamed of." },
    { id = "n_craft", cat = "craft", when = { profession = { "Leatherworking", "Blacksmithing", "Tailoring", "Alchemy" } },
      text = "You make things, I can tell. Bring them here before you take them to a merchant, and let the bluff decide what they are worth." },
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "A goblin at my block! I will count my fingers after we shake hands, and I mean that as a compliment." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Stampi, and this is the auction house of Thunder Bluff. Everything the Horde hunts, digs, stitches or finds comes across my block sooner or later." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Stampi! You have your father's horns or somebody's, and you will be wanting to turn plainstrider feathers into coin, as we all did once." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Stampi. The orcs taught us this trade, and I like to think the student now shouts louder than the teacher." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly now, a lot is closing." },
        { id = "h_again2", text = "Ask, ask, I can talk and count bids at once." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Let me see what's for sale.", next = "BUSINESS" },
        { text = "How does a tauren come to love an auction?", next = "love" },
        { text = "What sells best on the bluff?", next = "sells" },
        { text = "Does anyone ever try to cheat the block?", next = "cheat" },
        { text = "What's my craft worth up here?", next = "craft", when = { profession = { "Leatherworking", "Blacksmithing", "Tailoring", "Alchemy" } } },
        { text = "The elders can't approve of all this shouting.", next = "elders", when = { race = "Tauren" } },
        { text = "Who are your neighbours down here?", next = "neighbours" },
        { text = "Good selling, Stampi.", next = "END" },
      },
    },
    love = {
      lines = {
        { id = "love_d", text = "I was the loudest calf in my tribe, and nobody could find a use for it until the orcs showed us an auction. Now I am paid to do what I was cuffed for, and I thank the Earth Mother daily." },
      },
      choices = {
        { text = "What did the tribes do before auctions?", next = "love_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    love_before = {
      big = true,
      lines = {
        { id = "love_before_d", text = "They bartered, very slowly and very politely, and a good trade could take three days and two feasts. I miss the feasts, but I do not miss the three days." },
      },
      choices = {
        { text = "Something was lost with the feasts.", next = "BACK", reply = "It was, and I say so to anyone who will listen. A bid is quick, but nobody ever became your friend over one.", fx = { align = { order = 1 } } },
        { text = "Quick trade is better trade.", next = "BACK", reply = "Ha! You would get on with the orcs. And you are not wrong, or I would be out of work.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "sells_d", text = "Leather and hides before anything, because every hunter in Mulgore skins and not every one of them stitches. After that, herbs for the alchemists on the middle rise, and ore that the Stonehoofs buy as fast as I can call it." },
      },
      choices = {
        { text = "And what never sells?", next = "sells_never" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_never = {
      lines = {
        { id = "sells_never_d", text = "Plainstrider beaks. Every young brave brings me a sack of them, sure that somebody must want them, and I have not the heart to tell them what I do with the sacks." },
      },
      choices = {
        { text = "What do you do with them?", next = "BACK", reply = "They make a fine path to my tent door, and they crunch when visitors come. Say nothing to the braves.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat = {
      lines = {
        { id = "cheat_d", text = "Now and then somebody bids against themselves with a friend's help, to drive a price up. I can hear it in the rhythm, the way you would hear a kodo with a limp." },
      },
      choices = {
        { text = "And then what?", next = "cheat_then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat_then = {
      lines = {
        { id = "cheat_then_d", text = "I stop the sale and say, in my largest voice, that the block seems to have an echo today. I have never had to do it twice to the same person." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    craft = {
      lines = {
        { id = "craft_d", text = "Whatever the bluff will pay, and not a copper more, which is the beauty of it. Lay it on the block at a fair opening, stand well back, and try not to look as though you care." },
      },
      choices = {
        { text = "I'll practise not caring.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders = {
      lines = {
        { id = "elders_d", text = "Hamuul Runetotem once asked me, very kindly, whether I could auction more quietly. I tried it for a morning, and sold nothing, and he has not asked again." },
      },
      choices = {
        { text = "The Arch Druid knows when to yield.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "neighbours_d", text = "Atepa, Chesmu and Torn at the bank, who are as quiet as I am loud, and Innkeeper Pala, who sends me her guests when they run short of coin. Krumn the guild master complains that I drown out his oath-taking." },
      },
      choices = {
        { text = "Do you?", next = "BACK", reply = "Every time. I have offered to shout the oaths for him, and he declined.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have called the block since the auction house was a hide stretched on four poles. It has a roof now, and I am no quieter." } },
    advice = { { id = "tp_ad", text = "Never bid in the first rush, friend. Let the eager ones tire themselves, and come in when the block goes quiet." } },
    _none = { { id = "tp_none", text = "I only know what things are worth, not where they are or why. Ask a Bluffwatcher!" } },
  },
}

---------------------------------------------------------------------------
-- Kuruk: general goods vendor on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "kuruk", id = TODO_NPC("Kuruk"), name = "Kuruk", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "easygoing", "observant" }, values = { "hospitality", "community" },
  notices = { "kit", "race" },
  impression = {
    first = "Kuruk sells general goods on the High Rise, within sight of the High Chieftain's lodge, and watches who goes in and out of it all day. He is easy company and misses very little.",
    third = "{name} met Kuruk, who sells general goods on the High Rise of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, friend. Rope, torches, a waterskin? Whatever you forgot to pack, I have probably got it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. What was it this time, the flint or the bedroll?" },
    { id = "g_away", when = { away = 14 }, text = "{away} on the road. Your pack must be down to crumbs and string by now." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "First time up on the bluff, young one? Do not lean on the bridge ropes; they hold, but your stomach will not thank you." },
    { id = "n_weary", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look as though the road chewed on you a while. Sit a moment, nobody is in a hurry up here." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken, come up to the High Rise. You will be wanting the lodge, then; most of your people do, and they never buy food." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kuruk, and this is my tent. From here I can see the lodge of the High Chieftain, the weapon hall and the cook fires, so if I do not sell it, I can at least point at who does." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Kuruk. You have come to see Cairne, I expect, as every young one does once the elders send them up, so let me sell you a clean blanket to sit on while you wait." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Kuruk. An orc on the High Rise usually carries a message for the High Chieftain, and usually needs a waterskin after the climb." },
      },
      again = {
        { id = "h_again", text = "Anything else? I am only watching the lodge door." },
        { id = "h_again2", text = "Ask away, friend." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "You must see everyone who visits Cairne.", next = "lodge" },
        { text = "Who are your neighbours on the High Rise?", next = "rise" },
        { text = "What do travellers forget most?", next = "forget" },
        { text = "I've been sent to speak with the High Chieftain.", next = "sent", when = { race = "Tauren" } },
        { text = "How do the tribes take to Horde visitors?", next = "horde", when = { race = { "Orc", "Troll", "Scourge" } } },
        { text = "The view from your tent must be something.", next = "view" },
        { text = "Good day, Kuruk.", next = "END" },
      },
    },
    lodge = {
      lines = {
        { id = "lodge_d", text = "Everyone, and how they walk when they come out again. Those he has praised come out tall, those he has corrected come out thoughtful, and nobody at all comes out angry, which I have never understood." },
      },
      choices = {
        { text = "Who visits him most?", next = "lodge_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge_who = {
      lines = {
        { id = "lodge_who_d", text = "Hamuul Runetotem, as an old friend does, and the envoys from Orgrimmar. Magatha Grimtotem comes across from Elder Rise more often than I would have guessed, and she always comes out smiling." },
      },
      choices = {
        { text = "That smile troubles you.", next = "lodge_magatha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge_magatha = {
      big = true,
      lines = {
        { id = "lodge_magatha_d", text = "I sell rope and lamp oil, friend, and it is not for me to be troubled by an elder crone. I only notice that she smiles the same way going in as coming out, and nobody else does." },
      },
      choices = {
        { text = "Someone should tell Cairne what you've seen.", next = "BACK", reply = "Cairne has better eyes than mine, and a wiser head. If there is something to see, he has seen it.", fx = { align = { order = -1 } } },
        { text = "An elder's dealings with her chieftain are her own.", next = "BACK", reply = "That is what I tell myself. It is a comfortable thing to believe, and I mean to go on believing it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = {
        { id = "rise_d", text = "The Ragetotems in the weapon hall, who are loud, and Sunn Ragetotem with her rainsticks, who is not. Aska Mistrunner cooks across the way, and Nan Mistrunner sells fruit, and between them I have not bought my own supper in years." },
      },
      choices = {
        { text = "A good arrangement.", next = "rise_trade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise_trade = {
      lines = {
        { id = "rise_trade_d", text = "I keep them in lamp oil and twine, and they keep me fed. No coin changes hands, and the orcs who see it think we are all mad." },
      },
      choices = {
        { text = "It's how the tribes always lived.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = {
        { id = "forget_d", text = "Water, every time. They carry three weapons and a spare shield down to the Barrens, and not one skin of water, as though the centaur were the only thing out there that could kill them." },
      },
      choices = {
        { text = "I'll take the hint.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sent = {
      lines = {
        { id = "sent_d", text = "Then go in with your head up and say what you were sent to say. He was a calf once too, though it is hard to credit, and he has more patience for the young than for anyone." },
      },
      choices = {
        { text = "Thank you, Kuruk.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "horde_d", text = "Kindly, on the whole. We owe the orcs this home, and nobody on the bluff forgets it. With the Forsaken it comes more slowly, but Cairne has given his word, and his word is the tribes' word." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    view = {
      lines = {
        { id = "view_d", text = "On a clear morning you can see the whole of Mulgore from the edge behind my tent, Bloodhoof and the lake and the smoke from Narache. I take my first drink of the day there, and I have never once got used to it." },
      },
      choices = {
        { text = "That's worth a climb.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept this tent since the lifts were built. Before that I carried the tribe's cook pots, and this is easier on the back." } },
    advice = { { id = "tp_ad", text = "Carry twice the water you think you need, and half the weapons. I have never been wrong about that." } },
    _none = { { id = "tp_none", text = "I could not say, friend. Ask a Bluffwatcher, they like being asked." } },
  },
}

---------------------------------------------------------------------------
-- Tepa: tailoring trainer on the middle rise.
---------------------------------------------------------------------------
P:NPC {
  key = "tepa", id = TODO_NPC("Tepa"), name = "Tepa", title = "Tailoring Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gentle", "precise" }, values = { "craft", "tradition" },
  notices = { "class", "craft", "race" },
  impression = {
    first = "Tepa teaches tailoring on the middle rise of Thunder Bluff, and works with thread so fine that I could hardly see it. The teaching came softly, and every stitch I was shown was unpicked until it lay right.",
    third = "{name} met Tepa, the tailoring trainer of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Come in out of the wind, and mind the loom. Have you come to learn, or only to be measured?" },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Let me see your hems before you tell me how well they went." },
    { id = "g_away", when = { away = 14 }, text = "{away} since your last lesson. Your fingers will have stiffened, so we shall begin gently." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "That seam at your shoulder is your own work, I think. It is sound, though you hurried the last hand's width." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You wear cloth to do your work in. Then you of all people should know how to mend it, far from any tailor." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A young one of the tribes. Our people came late to the needle, and we have large hands, but do not let anyone tell you they are clumsy." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tepa, and I teach the making of cloth and the sewing of it. Hide was all our people wore for a thousand years, and I mean to show the bluff that we can do more." },
        { id = "h_tailor", when = { profession = "Tailoring" }, text = "I am Tepa. You have held a needle before, so we can speak as one crafter to another, which is a pleasure I do not often have up here." },
        { id = "h_troll", when = { race = "Troll" }, text = "I am Tepa. The Darkspear weave bright things, and I have learned two of my best dyes from troll travellers, so sit down and tell me what you know." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk while I thread this." },
        { id = "h_again2", text = "Ask, and hold this end for me while you do." },
        { id = "h_again3", text = "Yes, dear one?" },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Tauren tailors must be few.", next = "few" },
        { text = "Who works with you on this rise?", next = "rise" },
        { text = "Where does your cloth come from?", next = "cloth" },
        { text = "What should a tailor learn after the basics?", next = "after", when = { profession = "Tailoring" } },
        { text = "My robes take a beating. How do I make them last?", next = "last", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "That loom looks older than the city.", next = "loom" },
        { text = "My thanks, Tepa.", next = "END" },
      },
    },
    few = {
      lines = {
        { id = "few_d", text = "We are, and when I began, the elders asked me why a tauren would wear anything a beast had not given. I told them that the sheep and the flax are the Earth Mother's as well, and they had no answer." },
      },
      choices = {
        { text = "Have they come round?", next = "few_round" },
        { text = "Something else.", next = "BACK" },
      },
    },
    few_round = {
      big = true,
      lines = {
        { id = "few_round_d", text = "Some have. Hamuul Runetotem wears a mantle of my weaving at the gatherings, and after that, nobody liked to say aloud that cloth was not for our people." },
      },
      choices = {
        { text = "New crafts make the tribes stronger.", next = "BACK", reply = "I believe they do. A people who only keep what they had are already losing it.", fx = { align = { order = -1 } } },
        { text = "The elders had a point. Hide is the old way.", next = "BACK", reply = "It is, and I wear it myself in winter. But the old way was new once, and somebody was scolded for that as well.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = {
        { id = "rise_d", text = "Vhan is my apprentice, and Mahu sells the thread and dye from the next tent. Una's leatherworkers are our neighbours, and we borrow each other's awls and never return them." },
      },
      choices = {
        { text = "Is Vhan a good student?", next = "rise_vhan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise_vhan = {
      lines = {
        { id = "rise_vhan_d", text = "He will be better than I am, if he ever learns to stop talking while he counts stitches. I lose a row every time he tells me a story, and I have not the heart to stop him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = {
        { id = "cloth_d", text = "Linen from flax that grows along the streams of Mulgore, and wool when the traders bring it. The finer stuffs come up from the Barrens in bolts, taken from who knows where, and I wash them three times before I trust them." },
      },
      choices = {
        { text = "Why three times?", next = "cloth_wash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth_wash = {
      lines = {
        { id = "cloth_wash_d", text = "Once for the dust, once for the smell, and once for whatever the last owner was thinking. Cloth holds more than dye, and I will not stitch someone else's trouble into a new garment." },
      },
      choices = {
        { text = "A careful habit.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "after_d", text = "Patience with silk, when you find it, and the humility to unpick your own work. After that, go wherever there are tailors of other peoples and watch their hands, for I have never met one who had nothing to teach." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    last = {
      lines = {
        { id = "last_d", text = "Double the seams at the shoulder and under the arm, where the strain is, and line the hem with something that does not mind mud. And learn to mend by firelight, because that is when you will be doing it." },
      },
      choices = {
        { text = "By firelight. I'll practise.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    loom = {
      lines = {
        { id = "loom_d", text = "My mother's mother made it from the ribs of a kodo and the sinew of another, before we had wood to spare for such things. It creaks, and I would not change it for a new one from Orgrimmar." },
      },
      choices = {
        { text = "It has earned its creak.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned to weave from my grandmother and to sew from an orc who had learned in the camps. I teach both, and I name them both." } },
    advice = { { id = "tp_ad", text = "Measure twice, and then measure once more when the customer has breathed out. Everyone holds their belly in for a tailor." } },
    _none = { { id = "tp_none", text = "I am afraid that is beyond me, dear one. Ask at the inn; Pala hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Pand Stonebinder: first aid trainer on Spirit Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "pand", id = TODO_NPC("Pand Stonebinder"), name = "Pand Stonebinder", title = "First Aid Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady", "plainspoken" }, values = { "mercy", "duty" },
  notices = { "class", "kit" },
  impression = {
    first = "Pand Stonebinder teaches the binding of wounds on Spirit Rise, among the shamans and the Forsaken priests. He is plain-spoken and steady-handed, and he looked me over for injuries before he said hello.",
    third = "{name} met Pand Stonebinder, who teaches first aid on Spirit Rise in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Hold still a moment. No, you will do; nothing is bleeding that should not be. Now, what did you want?" },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and walking evenly. Good. Did the last bandage hold?" },
    { id = "g_away", when = { away = 14 }, text = "{away} since I saw you. Show me your hands; they tell me how the time went." },
  },
  notice = {
    { id = "n_hurt", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour took those blows, so some of them reached you. Sit down, and do not tell me it is nothing." },
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "SHAMAN", "DRUID" } },
      text = "You heal by other means, I can see. Learn the bandage as well, because there will be a day when the spirits are slow to answer." },
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } },
      text = "You have no healing of your own, by the look of you. Then what I teach is the difference between limping home and not coming home." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Pand Stonebinder. The shamans beside me mend with spirits and the priests with their strange Light, and I mend with clean linen and a steady hand, which works on days when nothing else will." },
        { id = "h_aid", when = { profession = "First Aid" }, text = "I am Pand Stonebinder. You already carry bandages, and you have rolled them properly, so somebody taught you well enough that I need only teach you more." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "I am Pand Stonebinder. I will be honest with you: binding the wounds of the Forsaken took some learning, for you do not bleed as we do. But flesh is flesh, and I have learned." },
      },
      again = {
        { id = "h_again", text = "What else? Speak, I am only rolling linen." },
        { id = "h_again2", text = "Ask. Nobody is bleeding at the moment." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Teach me to bind wounds.", next = "BUSINESS" },
        { text = "Why bandages, with healers on every side?", next = "why" },
        { text = "What wounds come up to you most?", next = "wounds" },
        { text = "You teach beside the Forsaken priests.", next = "priests" },
        { text = "My spells mend faster than linen.", next = "spells", when = { class = { "PRIEST", "SHAMAN", "DRUID" } } },
        { text = "How do the tribes treat a wound on the plains?", next = "plains", when = { race = "Tauren" } },
        { text = "Stonebinder is a curious name for a healer.", next = "name" },
        { text = "Thank you, Pand.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_d", text = "Because a shaman must be heard by the spirits, and a priest must have the strength to call, and a bandage asks nothing of anyone. I have seen great healers kneel beside a friend with nothing left to give, and wish they had learned my trade." },
      },
      choices = {
        { text = "Has that happened to you?", next = "why_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_you = {
      lines = {
        { id = "why_you_d", text = "It happened in front of me, in the Barrens, in the centaur days, to a shaman I had followed since I was a calf. I took up the linen the next morning, and I have not put it down." },
      },
      choices = {
        { text = "That was the right answer to it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds = {
      lines = {
        { id = "wounds_d", text = "Harpy claws from the young braves, which fester if they are not washed out. Quilboar tusk wounds, long and shallow, and now and then a burn from someone who stood too near Xanis Flameweaver's lessons." },
      },
      choices = {
        { text = "And from farther off?", next = "wounds_far" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds_far = {
      lines = {
        { id = "wounds_far_d", text = "Centaur arrows from Desolace, carried up by wind rider with the shaft still in. Those are the ones I teach from, because pulling an arrow badly does more harm than the arrow did." },
      },
      choices = {
        { text = "How should it be pulled?", next = "BACK", reply = "Pushed through, if it is past the bone, and never yanked. Come and learn it properly, and I will show you on a hide.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests = {
      lines = {
        { id = "priests_d", text = "I do. Father Cobb and I have sat over many of the same patients, he with his prayers and I with my needle. He is a cold sort of company, but I have never once seen him refuse a wounded tauren." },
      },
      choices = {
        { text = "Do you trust them?", next = "priests_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests_trust = {
      big = true,
      lines = {
        { id = "priests_trust_d", text = "I trust what their hands do in front of me, and I have learned not to ask what their Society does below in the pools. A healer who refused every ally he did not fully understand would have very few patients left alive." },
      },
      choices = {
        { text = "Judge them by the lives they save.", next = "BACK", reply = "That is how I have settled it with myself. It is good to hear someone else arrive at the same place.", fx = { align = { light = 1 } } },
        { text = "Ask what's in the pools. A healer shouldn't look away.", next = "BACK", reply = "You may be right, and it does not sit easily with me. But I am one bull with a roll of linen, and they answer to a queen.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spells = {
      lines = {
        { id = "spells_d", text = "So they do, until the day you are spent and your friend is still bleeding. I do not ask you to choose, only to carry both, because linen weighs almost nothing." },
      },
      choices = {
        { text = "I'll carry both.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plains = {
      lines = {
        { id = "plains_d", text = "With boiled water, a poultice of earthroot, and a strip of the softest hide tied firm. It is very nearly what I teach here, only up here the cloth is cleaner and nobody is shooting at you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "name_d", text = "My grandfather set bones for the tribe, and bound them in wet rawhide that dried as hard as stone. The name came from that, and I have tried to be worthy of it with gentler materials." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I followed the war parties as a calf, carrying water. I learned what a wound is long before I learned how to close one." } },
    advice = { { id = "tp_ad", text = "Wash it first, however much they shout. A clean wound badly bound heals better than a dirty one bound well." } },
    _none = { { id = "tp_none", text = "That I cannot mend or answer. Ask the shamans in the lodge; they hear more than I do." } },
  },
}
