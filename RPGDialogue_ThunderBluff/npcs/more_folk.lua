-- More of Thunder Bluff: Tah Winterhoof of Winterhoof Totems, the herbalism and mining and skinning
-- trainers (Komin Winterhoof, Brek Stonehoof, Mooranta), and four shopkeepers (Netali Proudwind,
-- Sunn Ragetotem, Jyn Stonehoof, Fyr Mistrunner). Voice: bibles/more_folk.md
-- Later passes add the bank, auction and guild folk, and (second gap pass) the remaining vendors,
-- apprentices, the Dawnstrider enchanters, Birgitte Cranston and two battlemasters.
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
    first = "His nearly empty paint pots troubled him more than anything else.",
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
    first = "He thanks every herb he handles, out loud, without any embarrassment.",
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
    first = "He knocks on the stone as he talks, checking it is sound.",
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
    first = "She wastes nothing, not a hide, not a sinew, not a word.",
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
    first = "She knows every shaman and priest by what they buy.",
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
    first = "She is a Ragetotem, and she makes sure you know it.",
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
    first = "She has no patience for anyone buying a blade for its looks.",
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
    first = "She pressed a crust on me before I had decided to buy.",
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
        { id = "h_again", text = "Is there something more? I have the time for it." },
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
    cairne = { { id = "tp_cairne", text = "The High Chieftain keeps nothing with us, and has never needed to. What he values cannot be put in a vault." } },
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
    venture_company = { { id = "tp_ven", text = "The Venture Company tried to sell Mulgore's own timber across my block once. I called the lot at one copper, and nobody bid." } },
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
    cairne = { { id = "tp_cairne", text = "He walks the rise at dusk, most evenings, and greets every tent by name. I have sold him lamp oil, and he paid, though I tried to refuse." } },
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
    cairne = { { id = "tp_cairne", text = "The High Chieftain wears hide, as he always has, but he came to my loom once and stood a long while watching it. He said it was good to see our people make a new thing." } },
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
    centaur = { { id = "tp_cen", text = "Most of what I mend was done by centaur, in the Barrens or beyond. Their arrows are barbed, and I have learned more from them than I ever wished to." } },
    background = { { id = "tp_bg", text = "I followed the war parties as a calf, carrying water. I learned what a wound is long before I learned how to close one." } },
    advice = { { id = "tp_ad", text = "Wash it first, however much they shout. A clean wound badly bound heals better than a dirty one bound well." } },
    _none = { { id = "tp_none", text = "That I cannot mend or answer. Ask the shamans in the lodge; they hear more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Second gap pass: the rest of the lower rise (Torn, Thrumn, Auctioneer Gullem, Shadi Mistrunner,
-- Chepi, Pakwa, Hewa, Elki, Thrag, Taur and Kurm Stonehoof).
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Torn: the youngest of the three bankers on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "torn_tb", id = TODO_NPC("Torn"), name = "Torn", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "thunder_bluff" }, temper = { "quick", "earnest" }, values = { "order", "duty" },
  notices = { "class", "race" },
  impression = {
    first = "Torn is the youngest of the bankers on the lower rise of Thunder Bluff, and he counts faster than I can follow. He is eager to be thought as steady as the two elders beside him, and he very nearly manages it.",
    third = "{name} met Torn, a young banker of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the bank of Thunder Bluff. Whatever you set down here will be waiting when you come back for it." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and I have your tally by heart already. What shall I fetch for you?" },
    { id = "g_away", when = { away = 14 }, text = "{away} have passed since you leaned on this counter, and nothing of yours has moved by so much as a finger's width." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk very quietly for someone in a bank. I mean no offence by saying so, but I shall keep my hands on the ledger while we talk." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "It is good to serve one of the tribes. Half of what we hold belongs to orcs and trolls who are only passing through." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Torn, and I keep the bank with Chesmu and Atepa. They have the long memories and I have the quick sums, and between the three of us nothing has gone astray yet." },
        { id = "h_goblin_talk", when = { minLevel = 30 }, text = "I am Torn. You have the look of one who has banked in Orgrimmar and Booty Bay, so you will find us slower here, and I hope a good deal more honest." },
      },
      again = {
        { id = "h_again", text = "Is there something more? I can count and listen at once." },
        { id = "h_again2", text = "Ask, friend. The line behind you is patient, as our people are." },
        { id = "h_again3", text = "What else may I do for you?" },
      },
      choices = {
        { text = "I need my things from the vault.", next = "BUSINESS" },
        { text = "You count faster than the others.", next = "count" },
        { text = "How does a bank work on top of a bluff?", next = "vault" },
        { text = "What do the tribes keep here?", next = "keep" },
        { text = "Who else works on this rise?", next = "rise" },
        { text = "Did our people bank before Thunder Bluff?", next = "before", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother, Torn.", next = "END" },
      },
    },
    count = {
      lines = { { id = "count_d", text = "My mother counted kodo for the Bloodhoof herds, and she taught me on pebbles before I could lift a spear. I was a poor hunter, so the elders found a place where a head for numbers would feed the tribe as well." } },
      choices = {
        { text = "Do Chesmu and Atepa mind being outpaced?", next = "count_elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    count_elders = {
      lines = { { id = "count_elders_d", text = "They let me finish the sum, and then Chesmu tells me the name of the depositor's grandmother, which I did not know. I have learned that quick is one thing and wise is another, and that a bank needs both." } },
      choices = {
        { text = "A good lesson, well taken.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vault = {
      lines = { { id = "vault_d", text = "The same way a bank works anywhere, I am told. What you leave in Orgrimmar or the Undercity you may ask for here, and the goblins who built the arrangement will not explain to me how it is done." } },
      choices = {
        { text = "That doesn't trouble you?", next = "vault_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vault_trouble = {
      big = true,
      lines = { { id = "vault_trouble_d", text = "It troubles me every evening. I keep my own tally in knotted cord beside their paper one, and so far the two have always agreed, so I have decided to trust it one day at a time." } },
      choices = {
        { text = "Keep your cords. Never trust what you can't check.", next = "BACK", reply = "That is what I tell Atepa, who only smiles. I will keep them.", fx = { align = { order = 1 } } },
        { text = "It works. Let go of the cords and breathe.", next = "BACK", reply = "Perhaps you are right, and I worry for nothing. I shall think on it, though I doubt my hands will stop tying.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = { { id = "keep_d", text = "Fewer coins than you would think, and more feathers, carvings and old totems. A tauren's wealth was always what could be carried and what it meant, and I have boxes here whose worth no goblin could reckon." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = { { id = "rise_d", text = "Stampi and Gullem cry the auctions across the way, and Krumn and Thrumn see to the guilds beside them. When the day is done we all eat at Innkeeper Pala's fire, and Stampi is still shouting then." } },
      choices = {
        { text = "The lower rise sounds like its own village.", next = "BACK", reply = "It is, and I would not trade it for the high one. Up there they have the chieftain, but down here we have the bread." },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "before_d", text = "We did not, for we never stayed anywhere long enough to need one. The centaur saw to that, and what a family could not load onto a kodo before dawn was left for the grass." } },
      choices = {
        { text = "Then this counter is a kind of victory.", next = "BACK", reply = "I have thought the same, though I would not say it so boldly in front of Chesmu. Thank you for saying it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    cairne = { { id = "tp_cairne", text = "The High Chieftain gave us a place to stand still, and a bank is only what follows from that. I have never spoken to him, and I am not sure my tongue would work if I did." } },
    background = { { id = "tp_bg", text = "I was raised among the Bloodhoof herds below, counting kodo with my mother. I came up the lifts when the bank needed a third pair of hands." } },
    advice = { { id = "tp_ad", text = "Count what you carry before you leave a town, and again when you arrive. Most losses on the road are found too late to mend." } },
    _none = { { id = "tp_none", text = "That is not written in any ledger of mine. Chesmu may know, for he remembers everything that was ever said at this counter." } },
  },
}

---------------------------------------------------------------------------
-- Thrumn: tabard vendor beside Krumn the guild master.
---------------------------------------------------------------------------
P:NPC {
  key = "thrumn", id = TODO_NPC("Thrumn"), name = "Thrumn", title = "Tabard Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "dry", "proud" }, values = { "craft", "tradition" },
  notices = { "status", "race" },
  impression = {
    first = "Thrumn sells tabards at the table beside the guild master of Thunder Bluff, and he holds that a banner worn on the chest says more than a name in a book. He and Krumn have plainly been arguing about it for years.",
    third = "{name} met Thrumn, who sells tabards in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Come closer, and let me see what colours would suit you. A tabard is the first thing a stranger learns about you." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Has the cloth held, or has Krumn sent you to quarrel with me on his behalf?" },
  },
  notice = {
    { id = "n_guild", cat = "status", when = { guild = true },
      text = "You walk under a banner already. Wear it well, for everyone who sees it will judge the rest of your guild by you." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "I cut the tabards for our people myself, since the ones from Orgrimmar would not cover half of you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Thrumn, and I sell the tabards that guilds wear. Krumn at the next table will write your name in his book, but it is my cloth that tells the world whose side you stand on." },
        { id = "h_noguild", when = { guild = false }, text = "I am Thrumn. You wear no guild's colours, I see, so speak with Krumn first and then come back to me, because a tabard with nothing behind it is only an apron." },
      },
      again = {
        { id = "h_again", text = "What else? The cloth is not going anywhere." },
        { id = "h_again2", text = "Ask it, and stand straight while you do, so that I can judge your shoulders." },
      },
      choices = {
        { text = "Show me your tabards.", next = "BUSINESS" },
        { text = "Krumn says he matters more than you.", next = "krumn" },
        { text = "The tribes carried totems, not tabards.", next = "totems" },
        { text = "What makes a good guild emblem?", next = "emblem" },
        { text = "Who are your neighbours down here?", next = "rise" },
        { text = "Does a tabard hold up in a fight?", next = "fight", when = { class = { "WARRIOR", "HUNTER", "SHAMAN" } } },
        { text = "Good day to you, Thrumn.", next = "END" },
      },
    },
    krumn = {
      lines = { { id = "krumn_d", text = "He would say so, and he says it loudly enough for the whole rise to hear. A name in a book stays in Thunder Bluff, friend, while a tabard walks into Stranglethorn on your back and speaks for you there." } },
      choices = {
        { text = "You two enjoy this quarrel.", next = "krumn_enjoy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    krumn_enjoy = {
      lines = { { id = "krumn_enjoy_d", text = "We have shared a tent wall for longer than I care to count, and a day without the argument would feel like a day without wind. Do not tell him I said so, because he would write it down." } },
      choices = {
        { text = "Your secret is safe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    totems = {
      lines = { { id = "totems_d", text = "You are right, and I say the tabard is the same thing made light enough to wear. A Bloodhoof knew a Runetotem at a distance by the pole above the camp, and now a guild is known by the cloth on its warriors." } },
      choices = {
        { text = "Do the elders see it that way?", next = "totems_elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    totems_elders = {
      big = true,
      lines = { { id = "totems_elders_d", text = "Some of them think a banner you can buy for a little gold is worth what was paid for it. I answer that the gold only buys the cloth, and that the worth is stitched in afterward by what its wearers do." } },
      choices = {
        { text = "The elders are right. Tribe comes before any guild.", next = "BACK", reply = "I will not argue against the tribe, and I would not sell to anyone who forgot it. Wear both, and let the tribe sit nearer the skin.", fx = { align = { order = 1 } } },
        { text = "A chosen banner means more than a born one.", next = "BACK", reply = "Krumn says the very same, which pains me to admit. There is something in it, all the same.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    emblem = {
      lines = { { id = "emblem_d", text = "One shape that a tired eye can read across a battlefield, and two colours that do not quarrel. The guilds that ask me for five beasts and a motto always come back within the season for something plainer." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = { { id = "rise_d", text = "Krumn, to my sorrow, and the bankers beyond him, who are the quietest three tauren on the bluff. Stampi at the auction makes up for all of them, and Hewa at the armory sells me my plain cloth." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "fight_d", text = "It will hold better than you fear, since I double the stitching at the shoulders where the straps of a harness rub. If it comes back with a blade's cut in it, then it has done its work, and I will think the better of the guild." } },
      choices = {
        { text = "Then I'll try to bring it back cut.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I painted hides for the tribe's lodges before there were guilds on the bluff. The work is much the same, except that these hides walk away." } },
    horde = { { id = "tp_horde", text = "The Horde has one banner over all of us, and I am glad of it. The small ones underneath are how we tell our friends apart in the dust." } },
    cairne = { { id = "tp_cairne", text = "The High Chieftain wears no tabard and needs none, since every tauren knows him by his shadow. The rest of us must manage with cloth." } },
    advice = { { id = "tp_advice", text = "Keep your tabard for the days that matter, and it will still be bright when your guild has a name worth showing." } },
    _none = { { id = "tp_none", text = "I know cloth and colours, friend, and little else worth your time. Ask Krumn, who believes he knows everything." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Gullem: the quiet auctioneer beside Stampi.
---------------------------------------------------------------------------
P:NPC {
  key = "gullem", id = TODO_NPC("Auctioneer Gullem"), name = "Auctioneer Gullem",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "patient", "wry" }, values = { "fairness", "trade" },
  notices = { "craft", "race" },
  impression = {
    first = "Auctioneer Gullem works the auction house on the lower rise of Thunder Bluff, a little to one side of the shouting. He speaks low and watches closely, and I had the feeling he knew what my pack was worth before I opened it.",
    third = "{name} met Auctioneer Gullem in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Step over here, where you can hear yourself think. What have you brought to sell, or what are you hoping to find?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I kept an eye on the lots for you, as I do for everyone who is civil to me." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Herbalism", "Mining", "Skinning" } },
      text = "You gather from the land, by the look of your hands. Bring what you find to me before you sell it to a shopkeeper for half its worth." },
    { id = "n_goblin", cat = "race", when = { race = "Orc" },
      text = "You will have seen the auction hall in Orgrimmar, which is ten times the size of ours. The goods are the same, I promise you, and the air here is better." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Gullem, and I take the lots that Stampi is too busy shouting about to notice. The auction is the one place on the bluff where a stranger's price is as good as a chieftain's." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Gullem. Our people traded by gift and by promise for a thousand years, young one, so forgive the elders if they still look sideways at a bidding." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have a moment between lots." },
        { id = "h_again2", text = "Go on, and speak up a little, for Stampi has started again." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Let me see the auctions.", next = "BUSINESS" },
        { text = "You're a good deal quieter than Stampi.", next = "stampi" },
        { text = "What sells well in Thunder Bluff?", next = "sells" },
        { text = "Who decides what is a fair price?", next = "fair" },
        { text = "What should a gatherer bring you?", next = "gather", when = { profession = { "Herbalism", "Mining", "Skinning" } } },
        { text = "May your lots sell high, Gullem.", next = "END" },
      },
    },
    stampi = {
      lines = { { id = "stampi_d", text = "Someone must be, or the bankers next door would go deaf. Stampi brings the crowd in with his voice, and I see that each of them leaves with what they came for, which is the half of the work nobody hears." } },
      choices = {
        { text = "Do you two get along?", next = "stampi_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stampi_along = {
      lines = { { id = "stampi_along_d", text = "We do, in the way that a drum and a flute get along. He has never once lowered his voice to speak to me, and I have never once raised mine, and we understand each other perfectly." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = { { id = "sells_d", text = "Leather and hides above all, for half the bluff works them, and herbs for the healers on Spirit Rise. Ore goes quickly to the Stonehoofs, and anything with a feather on it will find a hunter before nightfall." } },
      choices = {
        { text = "And what sits unsold?", next = "sells_unsold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_unsold = {
      lines = { { id = "sells_unsold_d", text = "Plate too small for a tauren, mostly, which adventurers will keep bringing me. I send it on to Orgrimmar with the caravans, where there are orcs enough to fill it." } },
      choices = {
        { text = "I'll remember that before I list any.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fair = {
      big = true,
      lines = { { id = "fair_d", text = "Nobody decides it, and that is the part our elders dislike. The price is whatever two strangers will agree to without ever meeting, and I only hold the goods and the coin until they have." } },
      choices = {
        { text = "A thing is worth what the buyer will pay.", next = "BACK", reply = "So the goblins taught us, and the hall runs on it. I find it true most days and a little sad on the others.", fx = { align = { light = -1 } } },
        { text = "Nobody should be charged more because they're desperate.", next = "BACK", reply = "I agree with you, and when I see such a lot I have been known to mention it to a kinder seller. That is between us.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gather = {
      lines = { { id = "gather_d", text = "Bring it in whole stacks, clean and sorted, because a buyer in a hurry will pay more to be spared the counting. And bring it in the morning, when the crafters come down from the middle rise with empty baskets." } },
      choices = {
        { text = "Mornings, in whole stacks. My thanks.", next = "BACK", fx = { affinity = 1 } },
        { text = "Why the morning?", next = "gather_morning" },
        { text = "Something else.", next = "BACK" },
      },
    gather_morning = {
      lines = { { id = "gather_morning_d", text = "Because a crafter with a whole day ahead buys what the work needs, and a crafter at dusk buys only what is cheap. The same stack of copper is worth more to a smith who has not yet lit the forge." } },
      choices = {
        { text = "I had not thought of the buyer's day.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried trade goods between the tribes when I was young, and learned what each camp lacked. This is the same work, done standing still." } },
    goblins = { { id = "tp_gob", text = "The goblins built the auction and take their cut of every sale. I do not love them for it, but I have never caught them cheating on the count." } },
    advice = { { id = "tp_ad", text = "Look at what others are asking before you name your own price. Pride sets more bad prices than greed does." } },
    _none = { { id = "tp_none", text = "That has never come up for bidding, so I cannot say. Stampi may know, and he will certainly tell you loudly." } },
  },
}

---------------------------------------------------------------------------
-- Shadi Mistrunner: trade goods on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "shadi", id = TODO_NPC("Shadi Mistrunner"), name = "Shadi Mistrunner", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "brisk", "kind" }, values = { "craft", "family" },
  notices = { "craft", "race" },
  impression = {
    first = "Shadi Mistrunner sells trade goods on the lower rise of Thunder Bluff: thread, flux, vials, salt and every small thing a crafter forgets to bring. She seems to know which craft a customer follows before a word is spoken.",
    third = "{name} met Shadi Mistrunner, who sells trade goods in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Tell me your craft, and I will tell you what you have run out of. I am seldom wrong." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Then it was thread or it was vials, because it is always one of the two." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Alchemy", "Enchanting", "Engineering" } },
      text = "Those are a maker's hands, with the little burns and pricks to prove it. You and I shall be seeing a good deal of each other." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear on the bluff is always welcome at my tent. Your people buy dye by the armful, and they never haggle over the bright ones." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Shadi Mistrunner, and I sell the small things that every craft runs short of. The trainers teach you the making, and I see that you have something to make it with." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "I am Shadi Mistrunner. You cook, I think, so you will want my cousin Naal at Aska's Kitchen for spices, though I keep salt for those who cannot face the bridges." },
      },
      again = {
        { id = "h_again", text = "What else? I can sort and talk together." },
        { id = "h_again2", text = "Ask away, and pass me that spool while you do." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "There are Mistrunners on every rise.", next = "family" },
        { text = "What do crafters run short of most?", next = "short" },
        { text = "Where do your goods come from?", next = "from" },
        { text = "Who trades near you?", next = "rise" },
        { text = "Which crafts does the bluff need more of?", next = "need", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Alchemy", "Enchanting", "Engineering" } } },
        { text = "My thanks, Shadi.", next = "END" },
      },
    },
    family = {
      lines = { { id = "family_d", text = "There are, and we feed half the city between us. Aska cooks, Naal sells her the spices, Kaga has the meat, Fyr the bread, Nan the fruit, and Kah and Sewa see to the fishing, so I am the only one who sells nothing you can eat." } },
      choices = {
        { text = "How did that come about?", next = "family_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_how = {
      lines = { { id = "family_how_d", text = "I burn water, friend, and the family knows it. They gave me the thread and the flux to mind, where the worst I can do is tangle something, and we have all been happier since." } },
      choices = {
        { text = "Every herd needs one who can't cook.", next = "BACK", reply = "It does, so that the cooks have someone to feed. I do that part of the work very well.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = { { id = "short_d", text = "Thread, always, and after that vials and flux. The young ones buy for the one thing they mean to make, and then they are back at my tent before the sun has moved, having forgotten that things go wrong." } },
      choices = {
        { text = "So buy for the mistakes as well.", next = "BACK", reply = "Buy for two mistakes, and you will be surprised how seldom you make the second.", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    from = {
      lines = { { id = "from_d", text = "The thread is spun here from Mulgore flax, and the salt comes up from the coast with the Crossroads caravans. The flux and the vials I buy from goblins out of Ratchet, and I count every crate before the driver leaves." } },
      choices = {
        { text = "The goblins short you?", next = "from_goblin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    from_goblin = {
      lines = { { id = "from_goblin_d", text = "They shorted me once, and I sent the whole load back down the lift with a note pinned to the driver. They have been exact ever since, and I believe we respect one another now." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = { { id = "rise_d", text = "Fyr bakes within smelling distance, which is hard on me before the midday meal. Chepi sells reagents and Pakwa sells bags close by, and the Stonehoofs send their apprentices to me for flux whenever Taur runs out." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    need = {
      lines = { { id = "need_d", text = "We have leatherworkers enough to dress the whole Horde, and smiths as long as there are Stonehoofs. What we lack are tailors and those who work with spells or gears, so Tepa and Teg Dawnstrider would both be glad of you." } },
      choices = {
        { text = "I'll pay them a visit.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Mistrunner, and we have always been the ones who fed the camp. I feed the crafts instead, which my aunts consider a near thing." } },
    goblins = { { id = "tp_gob", text = "A goblin will sell you anything, including your own crate back. Count twice, smile, and they are good enough neighbours." } },
    advice = { { id = "tp_advice", text = "Keep a spare needle in your hat and a coil of thread in your boot. You will bless me for it somewhere far from any shop." } },
    cairne = { { id = "tp_cairne", text = "The High Chieftain buys nothing from me himself, but his lodge keepers do, and they pay before I have finished counting." } },
    _none = { { id = "tp_none", text = "I have no stock of that, in goods or in knowing. Try the inn, where talk is cheaper than thread." } },
  },
}

---------------------------------------------------------------------------
-- Chepi: reagent vendor on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "chepi", id = TODO_NPC("Chepi"), name = "Chepi", title = "Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm", "watchful" }, values = { "spirit", "tradition" },
  notices = { "class", "race" },
  impression = {
    first = "Chepi sells reagents on the lower rise of Thunder Bluff, from baskets of seeds, powders and small carved charms. She handles each as though it were listening, and she asks what a thing is for before she will sell it.",
    third = "{name} met Chepi, the reagent vendor of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome. Tell me what you mean to ask of the spirits, and I will find what they like to be given." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back, so the last of it was used. I hope it was used well." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The elements lean toward you as you walk, shaman. You will want ankhs, and I will not ask how many times you have needed one." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You carry the wild with you, druid. I keep seeds for your kind in the shaded basket, where they will not wake too early." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "Your magic is not of our making, and my baskets feel it. I sell to you gladly, but I keep your powders apart from the seeds." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Chepi, and I sell what a spell asks for before it will answer. Nothing given to the spirits is wasted, but a good deal is wasted on the way to them." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "I am Chepi. The teachers on Spirit Rise send their students down to me, and I can tell from what they buy how far along the path each of them has come." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "I am Chepi. I have served a few of the Forsaken who lodge by the Pools of Vision, and they buy quickly and say little, which suits us both." },
      },
      again = {
        { id = "h_again", text = "What more would you ask?" },
        { id = "h_again2", text = "Speak, and I will listen as I sort." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "You handle those seeds like living things.", next = "living" },
        { text = "Where do your reagents come from?", next = "from" },
        { text = "Who buys the most from you?", next = "buys" },
        { text = "Why does a shaman need an ankh?", next = "ankh", when = { class = "SHAMAN" } },
        { text = "What do you think of arcane magic?", next = "arcane", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "May the spirits be kind to you.", next = "END" },
      },
    },
    living = {
      lines = { { id = "living_d", text = "They are living things, only sleeping. A druid who buries one in dead ground and calls a friend back from it is asking the seed to give up the tree it would have been, and that deserves a careful hand." } },
      choices = {
        { text = "I never thought of the cost to the seed.", next = "living_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    living_cost = {
      big = true,
      lines = { { id = "living_cost_d", text = "Few do, and the magic works whether they think of it or not. I only ask that those who buy from me remember that something is always given, even when it is small and cannot complain." } },
      choices = {
        { text = "I'll remember, and give thanks when I use them.", next = "BACK", reply = "That is all I ask. The spirits notice thanks, and they are slow to forget its absence.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A seed is a seed. The living come first.", next = "BACK", reply = "The living do come first, and I would spend every seed I have for one life. I would still thank each of them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    from = {
      lines = { { id = "from_d", text = "The seeds I gather myself along the streams of Mulgore, and the totem woods come from the groves below Red Rocks. The powders and runes that mages want are brought from Orgrimmar, and I do not pretend to understand them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    buys = {
      lines = { { id = "buys_d", text = "The shamans, and after them the druids from Elder Rise, who buy seeds a few at a time as though it shamed them to need any. The young ones buy too many of everything, and the old ones forget until they are standing at the lift." } },
      choices = {
        { text = "And the Forsaken on Spirit Rise?", next = "buys_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys_forsaken = {
      lines = { { id = "buys_forsaken_d", text = "Their priests buy candles, and their mages buy runes, and they pay without a word of complaint. I do not know what the spirits make of them, and when I asked, the spirits did not seem certain either." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ankh = {
      lines = { { id = "ankh_d", text = "Because the spirits will carry you back across once, if you have left them something to hold on to. The ankh is that something, and I have never yet had one returned to me unused with a complaint." } },
      choices = {
        { text = "I'll keep more than one in my pack.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arcane = {
      lines = { { id = "arcane_d", text = "I think it is a way of taking that does not stop to ask, and the land remembers what was taken. But you stand with the Horde and the Horde stood with us against the centaur, so I sell you your powders and keep my worries in the basket." } },
      choices = {
        { text = "I take care with what I draw on.", next = "BACK", reply = "Then you are rarer than you know, and you are welcome here.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    spirits = { { id = "tp_spirit", text = "The spirits are in everything I sell, which is why I sell it slowly. Ask the shamans on Spirit Rise if you want more than a shopkeeper's answer." } },
    background = { { id = "tp_bg", text = "I gathered for the tribe's shamans when I was a calf, and I still gather. The tent is only where I sit down between walks." } },
    _none = { { id = "tp_none", text = "The spirits have told me nothing of that. Ask someone who listens to people, for I mostly listen to baskets." } },
  },
}

---------------------------------------------------------------------------
-- Pakwa: bag vendor on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "pakwa", id = TODO_NPC("Pakwa"), name = "Pakwa", title = "Bag Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful", "practical" }, values = { "craft", "thrift" },
  notices = { "class", "craft" },
  impression = {
    first = "Pakwa sells bags and packs on the lower rise of Thunder Bluff, and she weighed mine with her eyes the moment I walked up. She holds that most travellers carry too much of the wrong thing, and she said so cheerfully.",
    third = "{name} met Pakwa, the bag vendor of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Look at those straps cutting into you! Set that pack down a moment, friend, and let us see what can be done." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Then you have filled it already, as I said you would." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter always needs one more pouch than they own. I keep quivers and shot pouches at the back for you." },
    { id = "n_gather", cat = "craft", when = { profession = { "Herbalism", "Mining", "Skinning" } },
      text = "That is a gatherer's pack, bulging at the bottom and smelling of the field. You need more room, and you know that you do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Pakwa, and I sell bags. Our people carried their whole lives on their backs for generations, so you may trust a tauren to know what makes a good pack." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Pakwa. You are of the tribes, so your grandmother will have told you what mine told me, that a bad strap is felt at every step until sundown." },
      },
      again = {
        { id = "h_again", text = "What else? I have all day and plenty of leather." },
        { id = "h_again2", text = "Go on, ask. You are not the sort to carry a question about unasked." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Show me your bags.", next = "BUSINESS" },
        { text = "What makes a good pack?", next = "good" },
        { text = "You think I carry too much.", next = "much" },
        { text = "Do you make these yourself?", next = "make" },
        { text = "Who are your neighbours?", next = "rise" },
        { text = "How should a hunter carry arrows?", next = "arrows", when = { class = "HUNTER" } },
        { text = "Earth Mother keep you, Pakwa.", next = "END" },
      },
    },
    good = {
      lines = { { id = "good_d", text = "Wide straps, a flat back and seams sewn twice with sinew. After that it should sit high, so the weight rides on your shoulders and not on the small of your back, and it should open without being taken off." } },
      choices = {
        { text = "And a bad one?", next = "good_bad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_bad = {
      lines = { { id = "good_bad_d", text = "A bad one is pretty. I have seen silk bags from the east with gold thread on them that would not survive one wet night on the Barrens road, and the people carrying them were very proud." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    much = {
      lines = { { id = "much_d", text = "Everybody does! I would wager there is a stone in there that you picked up for luck, and three things you have been meaning to sell since the last town." } },
      choices = {
        { text = "The stone stays. It has been lucky.", next = "much_stone", fx = { trait = { witty = 1 } } },
        { text = "You're right. I should clear it out.", next = "much_stone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    much_stone = {
      lines = { { id = "much_stone_d", text = "Keep one thing that is only for the heart, and sell or bank the rest. When the tribes broke camp ahead of the centaur, each of us was allowed one such thing, and nobody ever regretted the choosing." } },
      choices = {
        { text = "What did you keep?", next = "BACK", reply = "A little bag my mother made, too small to hold anything but another, smaller bag. I suppose that explains me." },
        { text = "Something else.", next = "BACK" },
      },
    },
    make = {
      lines = { { id = "make_d", text = "The plain leather ones I cut and stitch here, from hides that Mooranta's students bring down. The finer cloth ones come from Tepa's loom on the middle rise, and she charges me fairly, which is more than I deserve for how I haggle." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = { { id = "rise_d", text = "Shadi Mistrunner with her trade goods, and Chepi with her reagents, who is so quiet that I talk for both of us. The bankers are just up the path, and I send them everyone whose pack I cannot save." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    arrows = {
      lines = { { id = "arrows_d", text = "In a proper quiver at the hip or the back, never loose in a pack where the fletching is crushed. Kuna Thunderhorn on the high rise makes the arrows, and she would weep to see how some of you carry them." } },
      choices = {
        { text = "I'll treat them better.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I packed the family's kodo when we were still a wandering people, and I was good at it. A shop is only a kodo that stands still." } },
    advice = { { id = "tp_ad", text = "Heavy things low and close to your back, and whatever you will need in a hurry at the top. It sounds simple, and almost nobody does it." } },
    centaur = { { id = "tp_centaur", text = "When the centaur came, you had until the dust cloud reached the ridge to pack. I can still fill a kodo's panniers in the dark, and I hope never to need to." } },
    _none = { { id = "tp_none", text = "That I cannot fit in any bag of mine, friend. Ask at the inn, where they have more room for talk." } },
  },
}

---------------------------------------------------------------------------
-- Hewa: cloth armor merchant, owner of Hewa's Armory (Ahanu keeps the leather side).
---------------------------------------------------------------------------
P:NPC {
  key = "hewa", id = TODO_NPC("Hewa"), name = "Hewa", title = "Cloth Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "careful", "fond" }, values = { "thrift", "kindness" },
  notices = { "class", "kit" },
  impression = {
    first = "Hewa owns Hewa's Armory at the foot of the wind rider tower in Thunder Bluff, and sells the cloth armor himself. He keeps the shop's coin with great care, and grumbles a good deal about his partner's generosity without doing anything to stop it.",
    third = "{name} met Hewa, who owns Hewa's Armory in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to my armory. The cloth is on this side, the leather is Ahanu's, and the mail is Elki's, so tell me which of us you need." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. I hope that means the last robe served you, and not that it fell apart." },
  },
  notice = {
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You wear cloth into battle, and you have lived to walk into my shop. Either you are careful or you are fast, and I can sell to both." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear is hanging off you in rags, friend. I cannot mend what is not cloth, but I can at least see that you leave here decent." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Hewa, and the name over the door is mine. I sell the robes and wraps, and I keep the tally for all three of us, because somebody in this shop has to know what we have given away." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Hewa. I cut every robe here to fit a tauren first and take it in for the smaller folk after, so you at least will not split the shoulders." },
      },
      again = {
        { id = "h_again", text = "What else? I am only counting, and the numbers will wait." },
        { id = "h_again2", text = "Ask, friend, and mind Ahanu's hides behind you." },
      },
      choices = {
        { text = "Show me your cloth armor.", next = "BUSINESS" },
        { text = "Ahanu says you keep the coin from him.", next = "ahanu" },
        { text = "A tauren selling robes is a rare thing.", next = "robes" },
        { text = "Your shop is the first thing a flyer sees.", next = "tower" },
        { text = "Who is Elki?", next = "elki" },
        { text = "What should a spellcaster look for in a robe?", next = "caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Good trading to you, Hewa.", next = "END" },
      },
    },
    ahanu = {
      lines = { { id = "ahanu_d", text = "I do, and he thanks me for it every winter. Ahanu would hand a pair of boots to any calf with a sad story, and then wonder at the end of the season why we had no hides and no silver." } },
      choices = {
        { text = "But you let him do it anyway.", next = "ahanu_let" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ahanu_let = {
      big = true,
      lines = { { id = "ahanu_let_d", narr = "He glances toward the leather racks and lowers his voice.", text = "Now and then I do. I mark it in the tally as spoiled stock, and I have never once told him that I know where the boots went." } },
      choices = {
        { text = "A shop should clothe those who can't pay.", next = "BACK", reply = "Within reason, it should, and a young hunter in torn leathers is within reason. Do not tell Ahanu that I said so.", fx = { align = { light = 1 } } },
        { text = "A shop that gives goods away won't last.", next = "BACK", reply = "That is what I tell him, and it is true. I only find it harder to say when the calf is standing there.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    robes = {
      lines = { { id = "robes_d", text = "It was rarer still when I began. Our shamans and druids wore hide and feathers, and nobody on the bluff wanted a robe until the orcs and trolls and Forsaken began to come up the lifts with their magi." } },
      choices = {
        { text = "So you sell mostly to visitors?", next = "robes_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    robes_who = {
      lines = { { id = "robes_who_d", text = "To visitors, and to more of our own young shamans each year. They have found that cloth is cooler than hide in the Barrens sun, and their grandmothers have stopped scolding them for it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tower = {
      lines = { { id = "tower_d", text = "That is why I chose the spot. A traveller who has flown in from the Crossroads on one of Tal's wind riders is cold and stiff and in a mood to buy something warm, and we are the first tent they come to." } },
      choices = {
        { text = "A shrewd place to pitch a tent.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elki = {
      lines = { { id = "elki_d", text = "Elki sells the mail, and he came to us when the shamans began asking for it. He is young and says little, but he oils every link himself, and I have never had a piece of his brought back." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    caster = {
      lines = { { id = "caster_d", text = "Look at the seams before the embroidery, and pull at the sleeve where it meets the shoulder. A robe that is tight across the back will tear the first time you raise both arms to cast, and that is a poor moment for it." } },
      choices = {
        { text = "I'll pull at the sleeves, then.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I traded cloth between the camps before there was a city to trade in. When Cairne raised the bluff, I was among the first to ask for a tent near the lifts." } },
    ahanu = { { id = "tp_ahanu", text = "Ahanu is the best leatherworker I know and the worst merchant. That is why we are partners." } },
    advice = { { id = "tp_advice", text = "Buy your robe a little long and take it up yourself. Cloth can always be shortened, and nobody has yet found a way to do the other." } },
    tal = { { id = "tp_tal", text = "Tal's wind riders land above my tent all day, and I owe half my custom to them. I send a blanket up to the roost each winter." } },
    _none = { { id = "tp_none", text = "That is nowhere in my tally, friend. Ask Ahanu, who talks to everyone and remembers half of it." } },
  },
}

---------------------------------------------------------------------------
-- Elki: mail armor merchant at Hewa's Armory.
---------------------------------------------------------------------------
P:NPC {
  key = "elki", id = TODO_NPC("Elki"), name = "Elki", title = "Mail Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "quiet", "diligent" }, values = { "craft", "duty" },
  notices = { "class", "kit" },
  impression = {
    first = "Elki sells mail armor at Hewa's Armory in Thunder Bluff, and he was oiling a shirt of rings when I came in. He is young and says little, though every word about his mail was worth hearing.",
    third = "{name} met Elki, the mail armor merchant at Hewa's Armory.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. The mail is here on my side, and you may lift any piece you like to feel its weight." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Turn around and let me see how the rings have worn." },
  },
  notice = {
    { id = "n_mail", cat = "class", when = { class = { "HUNTER", "SHAMAN" } },
      text = "You will grow into mail soon, if you have not already. It is heavier than leather, but you stop noticing by the third day." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor has been through something. If any of it is mail, oil it tonight, before the rust finds the broken links." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Elki. Hewa sells the cloth and Ahanu the leather, and I sell the mail, which is the newest thing in the shop and the heaviest." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "I am Elki. The shamans are the reason I am here at all, since it was they who came back from fighting beside the orcs and asked the bluff for mail." },
      },
      again = {
        { id = "h_again", text = "Was there something else?" },
        { id = "h_again2", text = "Ask, and I will keep oiling while you do, if you do not mind." },
      },
      choices = {
        { text = "Show me your mail.", next = "BUSINESS" },
        { text = "You oil every piece yourself.", next = "oil" },
        { text = "Who makes mail for the tauren?", next = "makes" },
        { text = "How do you find working for Hewa?", next = "hewa" },
        { text = "Is mail worth the weight on a long hunt?", next = "weight", when = { class = "HUNTER" } },
        { text = "Thank you, Elki.", next = "END" },
      },
    },
    oil = {
      lines = { { id = "oil_d", text = "I do, each evening, because the mist comes up off the plains at night and settles on everything. A ring that rusts will cut the ring beside it, and then the whole shirt opens where you least want it to." } },
      choices = {
        { text = "What should I oil mine with?", next = "oil_with" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oil_with = {
      lines = { { id = "oil_with_d", text = "Kodo fat rendered clear, if you can get it, and plain lamp oil if you cannot. Roll the shirt in a sack with a handful of dry sand first, and it will scour itself while you walk." } },
      choices = {
        { text = "Sand in a sack. I'll remember.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    makes = {
      lines = { { id = "makes_d", text = "The Stonehoofs draw the wire and Karn's apprentices close the rings, and it takes four times as many of them to go round a tauren as round an orc. The smaller sizes come up from Orgrimmar ready made." } },
      choices = {
        { text = "Did our people wear mail before the Horde?", next = "makes_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    makes_before = {
      lines = { { id = "makes_before_d", text = "Hardly ever. We had hide and bone and our own thick skins, and no forge that stayed in one place long enough to draw wire. Mail came with the orcs and with having a home, and I think both were good for us." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hewa = {
      lines = { { id = "hewa_d", text = "He counts everything twice and complains about all of it, and he has never been unfair to me by so much as a copper. Ahanu is the kind one, people say, but I have watched Hewa, and I am not so sure it is only Ahanu." } },
      choices = {
        { text = "You notice a good deal for a quiet one.", next = "BACK", reply = "The quiet ones generally do. There is not much else to do while the others are talking.", fx = { affinity = 1 } },
        { text = "What have you seen Hewa do?", next = "hewa_seen" },
        { text = "Something else.", next = "BACK" },
      },
    hewa_seen = {
      lines = { { id = "hewa_seen_d", text = "Last winter a young shaman came in with more courage than coin, and Hewa told her that the shirt she wanted had a flaw and must go at half its price. I oiled that shirt myself, and there was no flaw in it." } },
      choices = {
        { text = "I'll keep his secret, as you have.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    },
    weight = {
      lines = { { id = "weight_d", text = "On the first day you will curse it, and on the day a boar gets past your pet you will bless it. Wear it on short hunts near the bluff until your shoulders learn, and take it into the Barrens after that." } },
      choices = {
        { text = "Sound advice. I'll start near home.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried rings for the Stonehoof smiths as a calf, and learned mail by handling it. Hewa gave me a corner of his shop when the shamans began to ask." } },
    advice = { { id = "tp_ad", text = "Wear something soft beneath mail, always. The rings stop the blade, but it is the padding that keeps your ribs whole." } },
    shamans = { { id = "tp_shamans", text = "The shamans on Spirit Rise wear mail when they walk with the war parties. Beram Skychaser bought the first shirt I ever sold." } },
    karn = { { id = "tp_karn", text = "Karn Stonehoof lets me watch his apprentices close the rings. I have learned more by watching in silence than I would have by asking." } },
    _none = { { id = "tp_none", text = "I do not know about that. Ahanu will, or he will know who does." } },
  },
}

---------------------------------------------------------------------------
-- Thrag Stonehoof: apprentice smith at Karn's Smithy. Forever: Camping 101: Blacksmithing.
---------------------------------------------------------------------------
P:NPC {
  key = "thrag_stonehoof", id = TODO_NPC("Thrag Stonehoof"), name = "Thrag Stonehoof", title = "Apprentice Blacksmith",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "hearty", "eager" }, values = { "craft", "family" },
  notices = { "craft", "class" },
  impression = {
    first = "Thrag Stonehoof hammers beside Karn at the smithy on the lower rise of Thunder Bluff, and teaches beginners the first blows. He is loud, cheerful and very proud of his family, and he hit the anvil to make most of his points.",
    third = "{name} met Thrag Stonehoof, a smith at Karn's Smithy in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the sparks, friend! Have you come to learn the hammer, or only to watch a Stonehoof swing one?" },
    { id = "g_back", when = { metBefore = true }, text = "There you are again. Show me your hands, and I will know whether you have been practising." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You have a smith's forearm, and a burn on it that I could put a name to. We have all got that one." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior ought to know how a blade is made before trusting a life to it. The Ragetotems send theirs down to me, when they remember." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Thrag Stonehoof, and I teach the first lessons of the forge while Karn teaches the rest. Every great smith on this bluff started with me or with someone like me, and I do not let them forget it." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Blacksmithing") }, text = "Kaga Wildhoof sent you up from Mulgore, did she? Then show me you can strike true, and I will show you what a smith can make to set beside a campfire." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Blacksmithing") }, text = "How is your camp holding up? What a smith makes is meant to be used in the wild, so do not leave it sitting in a pack." },
      },
      again = {
        { id = "h_again", text = "What else? Talk loudly, for the bellows are going." },
        { id = "h_again2", text = "Ask on! The iron needs another moment in the fire in any case." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Teach me what you can of smithing.", next = "BUSINESS" },
        { text = "The Stonehoofs seem to own this corner.", next = "kin" },
        { text = "What is it like to learn under Karn?", next = "karn" },
        { text = "What does a beginner get wrong?", next = "wrong" },
        { text = "What use is a smith at a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Blacksmithing") } },
        { text = "Where should a smith go after you?", next = "after", when = { profession = "Blacksmithing" } },
        { text = "Strike true, Thrag.", next = "END" },
      },
    },
    kin = {
      lines = { { id = "kin_d", text = "We do, and we earned it! Karn has the forge, Taur sells the coal and flux beside us, Brek teaches the mining, Kurm sells the picks, and Jyn sells the blades when we are done. Ore goes in at one end of the family and a sword comes out of the other." } },
      choices = {
        { text = "Do you ever quarrel?", next = "kin_quarrel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin_quarrel = {
      lines = { { id = "kin_quarrel_d", text = "Every supper, and about the same thing, which is whether the miner or the smith does the real work. Brek says the ore is everything, and I say that ore is only a rock until somebody hits it properly." } },
      choices = {
        { text = "The smith does. A rock cuts nothing.", next = "BACK", reply = "Ha! Say that again when Brek is standing here, and I will buy your supper.", fx = { affinity = 1 } },
        { text = "No ore, no sword. Brek has it right.", next = "BACK", reply = "Bah, he has been talking to you already. You will see sense once you have swung a hammer.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    karn = {
      lines = { { id = "karn_d", text = "Like standing beside the fire itself. He says perhaps ten words in a day, and nine of them are 'again', but when he nods at a piece of mine I feel it for a week." } },
      choices = {
        { text = "And the tenth word?", next = "BACK", reply = "'Good.' I have heard it twice, and I can tell you the day and the blade for each." },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "wrong_d", text = "They hit too hard and too seldom. The iron wants many patient blows while it is the colour of a sunset, and a beginner gives it three great ones and then wonders why it cracked." } },
      choices = {
        { text = "Patience, from a tauren with a hammer.", next = "BACK", reply = "It surprises everyone. The Earth Mother made the mountains slowly, and she is the best smith there is.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "camp_d", text = "More than you would think! Out in the wild there is no Karn to mend a split edge, so a smith who can set up a small working fire keeps the whole party's gear sound." } },
      choices = {
        { text = "Then show me how it's done.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "after_d", text = "To Karn, an arm's length to my left, when your hands are ready for him. After Karn there are the orcs in Orgrimmar, and I am told there are goblins in Booty Bay who can teach a thing or two, if you count your fingers afterward." } },
      choices = {
        { text = "What would the orcs teach that Karn won't?", next = "after_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    after_orcs = {
      lines = { { id = "after_orcs_d", text = "Speed, friend! An orc smith can arm a whole warband before a Stonehoof has finished warming the iron. Karn says that what is made quickly is mended often, and I say there are days when the warband cannot wait." } },
      choices = {
        { text = "There's a place for both.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Stonehoof, so I was given a hammer about when I was given a name. I have never wanted to hold anything else." } },
    camping = { { id = "tp_camp", text = "Kaga Wildhoof in Mulgore teaches the campfire, and sends folk on to each craft after. See her first." } },
    advice = { { id = "tp_ad", text = "Keep your eyes on the colour of the iron and not on the hammer. The hammer knows where it is going." } },
    _none = { { id = "tp_none", text = "That is no kind of metal I know! Ask Karn, if you can get a word out of him." } },
  },
}

---------------------------------------------------------------------------
-- Taur Stonehoof: blacksmithing supplies at Karn's Smithy.
---------------------------------------------------------------------------
P:NPC {
  key = "taur_stonehoof", id = TODO_NPC("Taur Stonehoof"), name = "Taur Stonehoof", title = "Blacksmithing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady", "dry" }, values = { "craft", "family" },
  notices = { "craft", "race" },
  impression = {
    first = "Taur Stonehoof sells coal, flux and hammers beside the forge at Karn's Smithy in Thunder Bluff. He is the calm one of a loud family, and he keeps the smiths supplied without ever seeming to hurry.",
    third = "{name} met Taur Stonehoof, who sells smithing supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the smithy. If the forge needs it, I sell it, and if I do not sell it, the forge does not need it." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more flux? You are using it faster than Thrag, and he spills half of his." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "There is coal dust in the creases of your knuckles that no washing will shift. You are one of us, whatever tribe you were born to." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Your people taught mine to build a forge that stays in one place. I do not forget it, and neither does Karn." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Taur Stonehoof. Karn and Thrag make the noise, and I make certain they have coal to make it with. A forge that runs short at the wrong moment ruins a week of work." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "I am Taur Stonehoof. You work iron yourself, so you know that the smith gets the praise and the one who hauled the coal gets a sore back. I have made my peace with it." },
      },
      again = {
        { id = "h_again", text = "Something more? I am in no hurry, as you may have noticed." },
        { id = "h_again2", text = "Ask it. The coal will not burn itself." },
      },
      choices = {
        { text = "Show me your smithing supplies.", next = "BUSINESS" },
        { text = "You seem the quiet Stonehoof.", next = "quiet" },
        { text = "Where does the coal come from?", next = "coal" },
        { text = "What does a new smith need first?", next = "first" },
        { text = "Who else supplies the crafters here?", next = "rise" },
        { text = "What do you make of orcish forges?", next = "orc", when = { race = "Orc" } },
        { text = "Keep the fires fed, Taur.", next = "END" },
      },
    },
    quiet = {
      lines = { { id = "quiet_d", text = "Somebody had to be. With Thrag shouting over the bellows and Brek arguing about ore, the family needed one who would simply count the sacks, and I found I liked the counting." } },
      choices = {
        { text = "Did you never want the hammer yourself?", next = "quiet_hammer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet_hammer = {
      lines = { { id = "quiet_hammer_d", text = "I swung it for some years, and my work was sound and nothing more. Karn's is better than sound, so I chose to be the reason his fire never goes out, and I sleep well on that." } },
      choices = {
        { text = "There is honor in that choice.", next = "BACK", reply = "I think so too. It is kind of you to see it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coal = {
      lines = { { id = "coal_d", text = "It comes from the Barrens by kodo, and the best of it from further still, out of the Stonetalon hills. We burned wood and dung when we wandered, and you cannot weld with a dung fire, whatever my grandfather claimed." } },
      choices = {
        { text = "Is the Barrens road safe for your kodo?", next = "coal_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coal_road = {
      lines = { { id = "coal_road_d", text = "It is safe enough since the Horde raised the Crossroads, though the quilboar will still try for a wagon now and then. They have no use for coal, but they do not find that out until they have stolen it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "first_d", text = "A hammer that suits your arm, which is lighter than the one your pride will choose, and more flux than seems sensible. After that you need copper from Brek's students and a great deal of patience, and I sell all of it but the last." } },
      choices = {
        { text = "The lighter hammer, then.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = { { id = "rise_d", text = "Kurm has the mining picks at Stonehoof Geology, and Shadi Mistrunner sells the small trade goods for every craft. Between the three of us, nobody on the lower rise has an excuse for idle hands." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "orc_d", text = "They burn hotter than ours and they are run harder, and the blades that come out of them are made for war first and everything else after. We learned the fire from you, and we kept our own pace with it." } },
      choices = {
        { text = "Your pace makes fine steel too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Karn's kin, and I have fed his forge since it was first lit on this rise. Before that I fed a smaller one that we carried on a kodo." } },
    advice = { { id = "tp_ad", text = "Buy your coal before you light the fire and not after. You would be surprised how many learn that twice." } },
    karn = { { id = "tp_karn", text = "Karn is the best smith our people have. He has never said thank you for a sack of coal, and he has never let a blade leave the forge that shamed the fire." } },
    brek = { { id = "tp_brek", text = "Brek teaches the mining across the way and takes it all very much to heart. Praise his ore in his hearing, and you will have a friend for life." } },
    _none = { { id = "tp_none", text = "I could not tell you. If it cannot be shovelled, I have likely never thought about it." } },
  },
}

---------------------------------------------------------------------------
-- Kurm Stonehoof: mining supplies at Stonehoof Geology.
---------------------------------------------------------------------------
P:NPC {
  key = "kurm_stonehoof", id = TODO_NPC("Kurm Stonehoof"), name = "Kurm Stonehoof", title = "Mining Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "blunt", "good-humoured" }, values = { "craft", "family" },
  notices = { "craft", "race" },
  impression = {
    first = "Kurm Stonehoof sells mining picks at Stonehoof Geology on the lower rise of Thunder Bluff, alongside the mining trainer. He tested the edge of a pick on his thumb while we talked, and had an opinion about every vein in Mulgore.",
    third = "{name} met Kurm Stonehoof, who sells mining supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Stonehoof Geology. Brek will teach you to find the ore, and I will sell you something to get it out with." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and that pick has seen some stone since I sold it. Good." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "There is rock dust in your fur and a squint in your eye from looking at cliff faces. You have the sickness, and there is no cure but more ore." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Some of the elders still frown at a tauren with a pick. Hold your head up, young one, and take only what the Earth Mother shows you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kurm Stonehoof. I sell picks and hammers, and I will tell you plainly that a cheap pick costs more in the end than a dear one." },
        { id = "h_miner", when = { profession = "Mining" }, text = "I am Kurm Stonehoof. You dig already, so I need not explain why the haft matters more than the head, and that saves us both a good while." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind?" },
        { id = "h_again2", text = "Go on, I am only sharpening." },
        { id = "h_again3", text = "Ask it straight, as a Stonehoof would." },
      },
      choices = {
        { text = "Show me your mining supplies.", next = "BUSINESS" },
        { text = "Why does a cheap pick cost more?", next = "pick" },
        { text = "Brek seems touchy about mining the earth.", next = "brek" },
        { text = "Where would you dig, if you had the day?", next = "dig" },
        { text = "Who buys the ore that comes up here?", next = "ore" },
        { text = "Do the elders truly disapprove of miners?", next = "elders", when = { race = "Tauren" } },
        { text = "May your veins run deep, Kurm.", next = "END" },
      },
    },
    pick = {
      lines = { { id = "pick_d", text = "Because the head flies off it halfway up a cliff in the Barrens, with nobody near but the raptors. Mine are seated on ash hafts and wedged twice, and I have had one come back to me after ten years only to be sharpened." } },
      choices = {
        { text = "How do I keep one sharp?", next = "pick_sharp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pick_sharp = {
      lines = { { id = "pick_sharp_d", text = "A few strokes with a rough stone every evening, and never let it sit wet. You do not need it sharp like a knife, only keen enough to bite, because a dull point skips and a skipping pick finds your shin." } },
      choices = {
        { text = "My shins thank you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brek = {
      lines = { { id = "brek_d", text = "He is, because he has been scolded for it since he was a calf. There are those on Elder Rise who say that breaking stone is wounding the Earth Mother, and Brek has spent his life answering them." } },
      choices = {
        { text = "What is his answer?", next = "brek_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brek_answer = {
      big = true,
      lines = { { id = "brek_answer_d", text = "That she puts the copper near the surface for the same reason she puts berries on a bush. We take what shows and we fill in what we open, and we leave the deep places to themselves." } },
      choices = {
        { text = "That's a fair answer. Take what is offered.", next = "BACK", reply = "So I think, and so we teach. The ones who dig like goblins are no students of ours.", fx = { align = { order = 1 } } },
        { text = "The Horde needs iron. Dig as deep as it takes.", next = "BACK", reply = "The Venture Company says the same in Stonetalon, and you can see the hills from here. I will keep to our way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig = {
      lines = { { id = "dig_d", text = "Along the cliffs on the eastern side of Mulgore, where the copper shows green after rain. When I want tin I go down to the Barrens and work the hills near the Crossroads, with one eye on the quilboar." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = { { id = "ore_d", text = "Karn takes the best of it for the forge next door, and Thrag ruins a little of that learning. The rest goes to Gullem and Stampi at the auction, where orc smiths buy it by the stack." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    elders = {
      lines = { { id = "elders_d", text = "Fewer do each year. Cairne himself carries a weapon shod with metal, and the walkways under your hooves are pegged with our iron, so it is hard to scorn the miner while standing on his work." } },
      choices = {
        { text = "I'll dig with a clear heart, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Stonehoof, and we have always known rock. I made picks for the family before I ever thought to sell one." } },
    venture = { { id = "tp_vc", text = "The Venture Company strips a hill to the bone and moves on. They are the reason some of our elders mistrust every pick, mine included." } },
    advice = { { id = "tp_advice", text = "Never mine alone under an overhang, and never mine at all with your back to the open plain. The stone is patient, and so are the things that hunt miners." } },
    _none = { { id = "tp_none", text = "That is not a thing I can dig up for you. Ask Brek, or try the inn." } },
  },
}

---------------------------------------------------------------------------
-- Second gap pass: the High Rise (Nan, Naal and Sewa Mistrunner, Tand, Halpa, the Ragetotem weapon
-- hall with Kard, Delgo, Etu and Ohanko, Sura Wildmane, Hogor Thunderhoof).
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Nan Mistrunner: fruit vendor on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "nan_mistrunner", id = TODO_NPC("Nan Mistrunner"), name = "Nan Mistrunner", title = "Fruit Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "teasing", "generous" }, values = { "family", "plenty" },
  notices = { "race", "class" },
  impression = {
    first = "Nan Mistrunner sells fruit on the High Rise of Thunder Bluff, and swears that every piece of it is ripe. She pressed a melon into my hands to prove the point before I had said what I wanted.",
    third = "{name} met Nan Mistrunner, the fruit vendor of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Smell that, friend, and tell me it is not the ripest melon on the bluff. You cannot, can you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I knew the apples would bring you, for they always do." },
    { id = "g_eve", when = { timeOfDay = "night" }, text = "You are shopping late. The fruit is cool from the evening air, which is when it is sweetest." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! Tell me truly whether the fruit of your islands is sweeter than mine, and then tell me again once you have tasted this." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You hunters live on dried meat until your teeth ache. Take something that grew in the sun for once." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Nan Mistrunner, and I sell the only fruit on the bluff worth carrying up a lift. Everything on this blanket was on a branch or a vine three days ago at the most." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "I am Nan Mistrunner. I am told your people do not taste as you once did, which grieves me, so smell the melon at least and I shall count that a sale of sorts." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Ask while you eat." },
        { id = "h_again2", text = "Go on. You look as though you have another question and room for another apple." },
      },
      choices = {
        { text = "Let me see your fruit.", next = "BUSINESS" },
        { text = "Sunn Ragetotem says you only swear it's ripe.", next = "ripe" },
        { text = "Where does fruit grow in Mulgore?", next = "grow" },
        { text = "The Mistrunners feed this whole city.", next = "family" },
        { text = "Who are your neighbours on the rise?", next = "rise" },
        { text = "What keeps on a long road?", next = "road", when = { minLevel = 20 } },
        { text = "Sweet days to you, Nan.", next = "END" },
      },
    },
    ripe = {
      lines = { { id = "ripe_d", text = "Sunn bought a melon from me years ago and left it in the sun beside her rainsticks for half a moon, and she has blamed me ever since. I swear it is ripe because it is ripe, and she knows that perfectly well." } },
      choices = {
        { text = "How can I tell for myself?", next = "ripe_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ripe_tell = {
      lines = { { id = "ripe_tell_d", text = "Knock on a melon and listen for a sound like a small drum, and press an apple near the stem with your thumb. And smell everything, always, because your nose was choosing fruit long before anyone thought of shops." } },
      choices = {
        { text = "A small drum. I'll listen for it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow = {
      lines = { { id = "grow_d", text = "Along the streams below Bloodhoof Village, where families have planted since we stopped wandering. The melons come from further off, by caravan from the oases in the Barrens, and I pay more for those than I like to say." } },
      choices = {
        { text = "Planting must be new to the tribes.", next = "grow_new" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow_new = {
      big = true,
      lines = { { id = "grow_new_d", text = "It is new, and my grandmother distrusted it to the end of her days. She said that a people who wait on a tree have forgotten how to walk, and I told her that a people who never wait have never tasted a ripe pear." } },
      choices = {
        { text = "You were right. A home is worth planting for.", next = "BACK", reply = "So I think, each time the trees come into flower. She did eat the pears, in the end.", fx = { align = { order = 1 } } },
        { text = "Your grandmother had a point. Roots can bind.", next = "BACK", reply = "She would have liked you. Some nights when the wind is in the east I half agree with her myself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "family_d", text = "We do, and we argue about which of us does it best. Aska says it is her cooking and Kaga says it is her meat, but nobody ever walked away from a meal remembering the kodo and forgetting the fruit after it." } },
      choices = {
        { text = "And Fyr's bread?", next = "BACK", reply = "Fyr's bread is very good, and you will not hear me say so twice. Take a loaf with your apples and tell Fyr nothing." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = { { id = "rise_d", text = "Kuruk has the general goods, and he eats more of my stock than he sells of his own. Tand weaves the baskets I carry all this in, and the Ragetotems in the weapon hall buy fruit by the sack and pretend it is for their students." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "road_d", text = "Apples will keep for a month if you do not bruise them, and anything dried will outlast your boots. Leave the melons here, friend, for a melon in a pack is a sorrow waiting for a steep hill." } },
      choices = {
        { text = "Apples it is, then.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I picked for my aunts' orchard by the stream until I was tall enough to carry the baskets up here. I have had this blanket ever since." } },
    cairne = { { id = "tp_cairne", text = "The High Chieftain's lodge is just along the rise, and he is fond of pears. I keep the best ones back when I hear he is at home." } },
    advice = { { id = "tp_advice", text = "Eat the bruised fruit first and save the perfect one. It is the opposite of what everyone does, and it means you never throw any away." } },
    _none = { { id = "tp_none", text = "I could not tell you, friend, but have an apple while you think of who could." } },
  },
}

---------------------------------------------------------------------------
-- Naal Mistrunner: cooking supplies at Aska's Kitchen.
---------------------------------------------------------------------------
P:NPC {
  key = "naal", id = TODO_NPC("Naal Mistrunner"), name = "Naal Mistrunner", title = "Cooking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "easygoing", "wry" }, values = { "family", "craft" },
  notices = { "craft", "race" },
  impression = {
    first = "Naal Mistrunner sells spices and cooking supplies at Aska's Kitchen on the High Rise of Thunder Bluff. He is easy company, and he has plainly spent years fetching and carrying for a cook who knows her own mind.",
    third = "{name} met Naal Mistrunner, who sells cooking supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Aska's Kitchen. She does the cooking and I sell the makings, so tell me what you are short of." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, so either the stew worked or you have burned it and need more spice." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook, for I can see it in how you looked at the pots before you looked at me. Aska will want to quarrel with your methods." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc at a tauren kitchen is a brave sight. We use less pepper than your people, and I keep the hot stuff under the counter for you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Naal Mistrunner. Aska teaches the cooking here, and I keep her in spices, salt and flour, which means that I am blamed whenever a dish wants for anything." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "I am Naal Mistrunner. You keep a pot of your own, so you know that a cook is only as good as the one who went out in the rain for the herbs." },
      },
      again = {
        { id = "h_again", text = "Anything else? Speak before Aska finds me a task." },
        { id = "h_again2", text = "Ask on. I am glad of the rest." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Show me your cooking supplies.", next = "BUSINESS" },
        { text = "It sounds as if Aska keeps you running.", next = "aska" },
        { text = "What do tauren season their food with?", next = "season" },
        { text = "Where do your spices come from?", next = "from" },
        { text = "What should a travelling cook always carry?", next = "carry", when = { profession = "Cooking" } },
        { text = "Do orcs really want more pepper?", next = "pepper", when = { race = "Orc" } },
        { text = "Eat well, Naal.", next = "END" },
      },
    },
    aska = {
      lines = { { id = "aska_d", text = "She does, from the first light until the fire is banked. But I have eaten at her pot every day of my life, friend, and I would run twice as far for it." } },
      choices = {
        { text = "What does she cook best?", next = "aska_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aska_best = {
      lines = { { id = "aska_best_d", text = "Kodo ribs from Kaga's stall, roasted slowly over mesquite with sage rubbed into them. When she makes them, half the rise finds some reason to walk past our tent, and Kuruk does not even bother with a reason." } },
      choices = {
        { text = "I'll find a reason myself.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    season = {
      lines = { { id = "season_d", text = "Sage and wild onion, and the smoke of whatever wood we are burning, which is a spice in its own right. Our people cooked over open fires on the move, so we never learned to hide the taste of the meat, and I think we are the better for it." } },
      choices = {
        { text = "Plain food, honestly made.", next = "BACK", reply = "That is the whole of it. Fyr says the same about bread, and it is the only matter on which the two of us agree." },
        { text = "Something else.", next = "BACK" },
      },
    },
    from = {
      lines = { { id = "from_d", text = "I gather the sage myself on the slopes below the bluff, and the salt comes up from the Barrens coast. The stranger things are bought from goblin traders out of Ratchet, who sell me a hot spice that Aska will not allow in her pot." } },
      choices = {
        { text = "Why won't she?", next = "from_hot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    from_hot = {
      lines = { { id = "from_hot_d", text = "She says that if you cannot taste the kodo, you have insulted the kodo. I sell it all the same to the orcs and trolls who come by, and I have learned to do so while her back is turned." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = { { id = "carry_d", text = "Salt, a twist of dried sage, and a small pot you are not too proud to scrub. With those three you can make a decent meal of anything that walks or swims, and the party will forgive you a good deal." } },
      choices = {
        { text = "Salt, sage and a humble pot.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pepper = {
      lines = { { id = "pepper_d", text = "Every one of you asks, and none of you has ever said it was hot enough. I believe your people would season a campfire if they could find a way to chew it." } },
      choices = {
        { text = "Ha! We would, and with pride.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Mistrunner, and I have carried for Aska's fire since we were both calves. It was a smaller fire then, and she was just as certain." } },
    aska = { { id = "tp_aska", text = "Aska Mistrunner teaches cooking right behind me. Be polite about her methods, and she will teach you things no other cook in the Horde knows." } },
    cairne = { { id = "tp_cairne", text = "The High Chieftain's lodge sends down for Aska's ribs on feast days. I carry them up myself, and I walk very carefully." } },
    _none = { { id = "tp_none", text = "That is beyond my shelf, friend. Ask Aska, who has an opinion on everything." } },
  },
}

---------------------------------------------------------------------------
-- Sewa Mistrunner: fishing supplies by the pond on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "sewa", id = TODO_NPC("Sewa Mistrunner"), name = "Sewa Mistrunner", title = "Fishing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "placid", "droll" }, values = { "patience", "family" },
  notices = { "craft", "class" },
  impression = {
    first = "Sewa Mistrunner sells poles, line and bait beside the pond on the High Rise of Thunder Bluff. She speaks as slowly as a float drifts, and seems to find the hurry of adventurers gently funny.",
    third = "{name} met Sewa Mistrunner, who sells fishing supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Hush a moment, there is one nosing the bait. No, it has gone, so now you may tell me what you need." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Did the line hold, or is there a fish somewhere wearing my hook?" },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You have the stillness of someone who fishes. It is rare among your sort, and I am glad to see it." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman at the water's edge. You could ask the pond for its fish, I suppose, but the pole is more courteous." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Sewa Mistrunner. Kah teaches the fishing here, and I sell what you will need to do it, though the most useful thing cannot be bought and that is patience." },
        { id = "h_fish", when = { profession = "Fishing" }, text = "I am Sewa Mistrunner. You fish already, so sit if you like, and we shall watch the float together while we talk." },
      },
      again = {
        { id = "h_again", text = "What else? There is no hurry here." },
        { id = "h_again2", text = "Ask it softly, so as not to trouble the water." },
      },
      choices = {
        { text = "Show me your fishing supplies.", next = "BUSINESS" },
        { text = "A fishing pond on a mountaintop is a marvel.", next = "pond" },
        { text = "What bait works best?", next = "bait" },
        { text = "Tell me about Kah.", next = "kah" },
        { text = "You find adventurers funny, I think.", next = "funny" },
        { text = "Where should a fisher go beyond Mulgore?", next = "beyond", when = { profession = "Fishing" } },
        { text = "Still waters to you, Sewa.", next = "END" },
      },
    },
    pond = {
      lines = { { id = "pond_d", text = "It is the Earth Mother's doing and a little of ours. Rain gathers in the hollow of the rise, and the first families up here carried fish from Stonebull Lake in waterskins, one lift at a time, until the pond had learned to keep itself." } },
      choices = {
        { text = "Do the fish mind the height?", next = "pond_height" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pond_height = {
      lines = { { id = "pond_height_d", text = "They have never said so. I think that a fish knows only water, and to a fish this pond is the whole of the world, which is not so different from how the bluff is for some of our elders." } },
      choices = {
        { text = "A gentle way to tease your elders.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = { { id = "bait_d", text = "The shiny baubles bring them quickly, and the nightcrawlers bring them surely. The young buy baubles and the old buy worms, and I notice that the old carry home more fish." } },
      choices = {
        { text = "Worms, then.", next = "BACK", reply = "Good. You may yet grow old yourself.", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kah = {
      lines = { { id = "kah_d", text = "Kah can tell what swims under a ripple by the shape of it, and has never once boasted of that. We have sat by this pond together for so many seasons that we hardly need to speak, which is the best kind of kin." } },
      choices = {
        { text = "What do you talk about, when you do speak?", next = "kah_talk" },
        { text = "Something else.", next = "BACK" },
      },
    kah_talk = {
      lines = { { id = "kah_talk_d", text = "The weather on the water, and whether the old grey fish under the far bank is still alive. We have each hooked it once and let it go, and neither of us has told the students that it is there." } },
      choices = {
        { text = "Then I never heard of it.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    },
    funny = {
      big = true,
      lines = { { id = "funny_d", text = "A little. You come running up, buy a pole, catch one fish and run off to kill something in another land. I do wonder what would happen if one of you sat down for a whole afternoon." } },
      choices = {
        { text = "The world needs saving. Sitting can wait.", next = "BACK", reply = "It has needed saving since before my grandmother, and it is still here. But go, and come back when you are tired.", fx = { align = { order = 1 } } },
        { text = "Then I'll sit a while and find out.", next = "BACK", reply = "Sit, then. Watch the float and nothing else, and tell me afterward whether the world ended.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beyond = {
      lines = { { id = "beyond_d", text = "The oases of the Barrens hold fish you will not find here, and I am told the coast at Ratchet is good if you can bear the goblins shouting. Wherever you go, fish at dawn, when the water has had the night to forget you." } },
      choices = {
        { text = "At dawn. I'll remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have fished since I could hold a stick with a string on it. The family gave me the tackle to sell because I was at the pond anyway." } },
    advice = { { id = "tp_ad", text = "If nothing is biting, do not change the bait first. Change how still you are sitting." } },
    stonebull = { { id = "tp_stonebull", text = "Stonebull Lake below Bloodhoof Village is where our pond's fish came from. Uthan Stillwater teaches by its shore, and he is nearly as patient as I am." } },
    cairne = { { id = "tp_cairne", text = "The High Chieftain fished here once, at dusk, with nobody near him. I pretended to be mending a net, and he pretended not to see me." } },
    _none = { { id = "tp_none", text = "I do not know, and I am content not to. Sit and fish, and perhaps the answer will come up on the line." } },
  },
}

---------------------------------------------------------------------------
-- Tand: basket weaver on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "tand", id = TODO_NPC("Tand"), name = "Tand", title = "Basket Weaver",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "mild", "absorbed" }, values = { "craft", "tradition" },
  notices = { "craft", "race" },
  impression = {
    first = "Tand weaves baskets on the High Rise of Thunder Bluff, and his fingers never stopped moving the whole time we spoke. He talks about reeds the way other tauren talk about the hunt.",
    third = "{name} met Tand, the basket weaver of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Sit, if you wish, and forgive me if I keep weaving. The reeds are wet, and they will not wait on manners." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. This is the same basket you saw before, and it is nearly a basket now." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You gather herbs, so you know why a basket breathes and a sack does not. Leaves carried in leather are spoiled by evening." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Did your mother carry you in a basket on a kodo's flank, young one? Mine did, and I think that is where all this began." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tand, and I weave baskets. Half of what is carried on this bluff is carried in my work, though nobody looks at a basket unless the bottom falls out of it." },
        { id = "h_troll", when = { race = "Troll" }, text = "I am Tand. I have seen Darkspear weaving from the coast, done in palm, and I would gladly trade you a basket to be shown how the corners are turned." },
      },
      again = {
        { id = "h_again", text = "What else? My hands are busy, but my ears are idle." },
        { id = "h_again2", text = "Ask, friend, and hold that reed down for me." },
        { id = "h_again3", text = "Go on." },
      },
      choices = {
        { text = "Show me what you have to sell.", next = "BUSINESS" },
        { text = "What do you weave them from?", next = "reeds" },
        { text = "Nobody thinks about baskets, you said.", next = "think" },
        { text = "Who buys from you?", next = "buys" },
        { text = "Those patterns look like they mean something.", next = "pattern" },
        { text = "What basket suits a gatherer?", next = "gather", when = { profession = "Herbalism" } },
        { text = "May your reeds stay supple, Tand.", next = "END" },
      },
    },
    reeds = {
      lines = { { id = "reeds_d", text = "River reed from Stonebull Lake for the body, and split willow for the rim where the strength is wanted. I cut them myself at the turn of the season and soak them for three days, and no amount of hurrying makes it two." } },
      choices = {
        { text = "What happens if you hurry?", next = "reeds_hurry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reeds_hurry = {
      lines = { { id = "reeds_hurry_d", text = "The reed cracks at the first tight bend, and you will not see it until the basket is full of someone's apples and halfway across a rope bridge. I hurried once, as an apprentice, and Nan Mistrunner has not let me forget it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    think = {
      big = true,
      lines = { { id = "think_d", text = "They do not, and I have stopped minding. The smiths have their sparks and the hunters their trophies, and I have a thing that holds other things, quietly, for twenty years." } },
      choices = {
        { text = "Quiet work that lasts deserves more honor.", next = "BACK", reply = "It is kind of you to say so. I will take it, and weave it into this one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Glory goes to those who seek it. That's fair.", next = "BACK", reply = "Perhaps it is fair. I have never wanted it enough to stop weaving and go looking.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys = {
      lines = { { id = "buys_d", text = "Nan for her fruit, Komin and Nida Winterhoof for their drying herbs, and Sewa for carrying fish. The wind rider master takes the big ones to pack goods for the flight to the Crossroads, and he is hard on them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pattern = {
      lines = { { id = "pattern_d", text = "They do. This band is the plains, this stepped one is the bluff, and the dark line that wanders through is the road our people walked before we had either. My teacher wove it into every basket, and so do I." } },
      choices = {
        { text = "Who taught you?", next = "pattern_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pattern_teacher = {
      lines = { { id = "pattern_teacher_d", text = "An old weaver of the Bloodhoof who made carrying baskets for the kodo trains, back when being able to pack a camp before dawn meant living through the day. She said that a tight weave had saved more tauren than any spear." } },
      choices = {
        { text = "I believe her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gather = {
      lines = { { id = "gather_d", text = "A shallow one with an open weave, worn at the hip, so that the leaves lie flat and the air moves through them. Line it with damp moss on a hot day, and your peacebloom will reach the bluff as fresh as it left the ground." } },
      choices = {
        { text = "Damp moss. Thank you, Tand.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have woven since I was small enough to sit inside my teacher's baskets. I came up to the bluff with the first families and have not wanted to leave." } },
    advice = { { id = "tp_ad", text = "Carry the weight in two small baskets and not in one great one. Your back will tell you why by evening." } },
    cairne = { { id = "tp_cairne", text = "When the High Chieftain's lodge was raised, they carried the earth for its floor in my baskets. I think of that when the smiths are boasting." } },
    _none = { { id = "tp_none", text = "I am afraid I know reeds and little beyond them. Kuruk at the general goods hears more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Halpa: prairie dog vendor in a hut facing off the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "halpa", id = TODO_NPC("Halpa"), name = "Halpa", title = "Prairie Dog Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "soft-spoken", "fond" }, values = { "nature", "kindness" },
  notices = { "class", "pet" },
  impression = {
    first = "Halpa sells prairie dogs from a small hut on the High Rise of Thunder Bluff, facing out over the plains and away from the city. He knows each of the little creatures by name, and he looked me over as carefully as I looked at them.",
    third = "{name} met Halpa, who sells prairie dogs in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Step softly, friend, for they startle. Once they have had a look at you they will come out again." },
    { id = "g_back", when = { metBefore = true }, text = "They remember you, I think. See how the brown one is standing up to look?" },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You are a hunter, and they can smell it. I will ask you to keep your eyes soft while you are in here." },
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Keep your beast outside the door, if you would be so good. My little ones do not know that it has already eaten." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Halpa, and I find homes for prairie dogs. I do not think of it as selling, though coin does change hands, because I will not let one go with anybody I have doubts about." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Halpa. These are companions and not beasts for the hunt, {class}, and they will never fight for you, so if that is what you want you must look elsewhere." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Speak low." },
        { id = "h_again2", text = "Ask, friend. The grey one is listening too." },
      },
      choices = {
        { text = "I'd like to see your prairie dogs.", next = "BUSINESS" },
        { text = "Your hut has its back to the whole city.", next = "hut" },
        { text = "Why prairie dogs?", next = "why" },
        { text = "How do I care for one on the road?", next = "care" },
        { text = "You said you turn some buyers away.", next = "turn" },
        { text = "Do hunters trouble you?", next = "hunters", when = { class = "HUNTER" } },
        { text = "Be well, Halpa, and your little ones.", next = "END" },
      },
    },
    hut = {
      lines = { { id = "hut_d", text = "I built it so on purpose. The little ones want to see grass and sky, even from up here, and I find that I do as well. Cairne's lodge is behind us and the bridge to Hunter Rise is beside us, and neither troubles us much." } },
      choices = {
        { text = "The hunters' rise, right beside prairie dogs.", next = "BACK", reply = "I know it. The Earth Mother has her own sense of humour, and I have learned to share it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "why_d", text = "Because the plains are riddled with their towns, and our people walked over them for generations and never asked who lived below. I sat by a burrow one summer as a calf, and by autumn they were climbing my horns." } },
      choices = {
        { text = "What did you learn from them?", next = "why_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_learn = {
      lines = { { id = "why_learn_d", text = "That they post a watcher who whistles when a hawk comes over, and that the watcher is the last one into the hole. There is a whole tribe under the grass living as ours does, and I think the Earth Mother made them to remind us." } },
      choices = {
        { text = "A small tribe with its own bluffwatchers.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    care = {
      lines = { { id = "care_d", text = "Give it grass seed and a little fruit, and somewhere dark in your pack to go when the fighting starts. It will follow you through fire if you let it, so the caring is mostly a matter of where you choose to walk." } },
      choices = {
        { text = "I'll mind where I walk.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Will it be afraid in strange lands?", next = "care_afraid" },
        { text = "Something else.", next = "BACK" },
      },
    care_afraid = {
      lines = { { id = "care_afraid_d", text = "For a day or two, and then it will decide that wherever you are is its burrow. I have had word of little ones of mine seen in Orgrimmar and in the Undercity itself, sitting up on a shoulder as if they owned the place." } },
      choices = {
        { text = "They're braver than they look.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    },
    turn = {
      big = true,
      lines = { { id = "turn_d", text = "I have turned away a few. There was an orc who wanted one to feed to his wolf, and a Forsaken who wanted one for some purpose he would not name. They offered a great deal of gold, both of them." } },
      choices = {
        { text = "You were right. Some things aren't for sale.", next = "BACK", reply = "I am glad you think so. The little ones seem to think so too, for they have come out to look at you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Gold is gold. A wolf has to eat.", next = "BACK", reply = "A wolf may hunt for itself on the plains, as the Earth Mother intended. It will not be handed its meal from my hut.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters = {
      lines = { { id = "hunters_d", text = "The good ones do not. A true hunter of our people takes what is needed and honours it, and has no quarrel with a creature the size of a hoof. It is the ones who kill to count that I watch the door for." } },
      choices = {
        { text = "I hunt as our way teaches.", next = "BACK", when = { race = "Tauren" }, fx = { affinity = 1 } },
        { text = "I take only what I need.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a poor hunter and a good watcher. The tribe found a use for me, as it finds a use for everyone." } },
    nature = { { id = "tp_nat", text = "The plains below are full of small lives that we step over. I only try to notice a few of them." } },
    cairne = { { id = "tp_cairne", text = "The High Chieftain's lodge is at my back. He stopped here once, and a little one sat in the palm of his hand as it might sit on a hill." } },
    advice = { { id = "tp_advice", text = "If you find a prairie dog town on your travels, walk around it. It costs you twenty paces, and it costs them nothing." } },
    _none = { { id = "tp_none", text = "I could not say, friend. Very little news comes to a hut that faces the wrong way." } },
  },
}

---------------------------------------------------------------------------
-- Kard Ragetotem: sword and dagger merchant in the weapon hall.
---------------------------------------------------------------------------
P:NPC {
  key = "kard", id = TODO_NPC("Kard Ragetotem"), name = "Kard Ragetotem", title = "Sword & Dagger Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "proud", "exacting" }, values = { "honor", "craft" },
  notices = { "class", "race" },
  impression = {
    first = "Kard Ragetotem sells swords and daggers in the weapon hall on the High Rise of Thunder Bluff. He speaks of each blade as if it had a war record, and he watched how I held one before he would name a price.",
    third = "{name} met Kard Ragetotem, who sells swords and daggers in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the hall of the Ragetotem. Pick up any blade you like, and I will learn more about you from that than from your name." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. Is the blade blooded yet, or has it only been admired?" },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You stand like one of Sark's students, with your weight ready to move. Good, for I dislike selling swords to those who will only wear them." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You went straight to the daggers with your eyes. I sell them, and I ask no questions, but I do notice." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kard Ragetotem, and I sell the swords and the daggers. My tribe has been the spear arm of the tauren since before the centaur, and we do not put a poor edge in anyone's hand." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Kard Ragetotem. Few of our people favour the sword, young one, so if you have come to me and not to Ohanko's great mauls, you have an unusual mind and I would like to hear it." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly, as warriors do." },
        { id = "h_again2", text = "Ask. I can talk and hone at the same time." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Show me your blades.", next = "BUSINESS" },
        { text = "A sword looks small in a tauren's hand.", next = "small" },
        { text = "Who else sells in this hall?", next = "hall" },
        { text = "Jyn Stonehoof says you oversell your blades.", next = "jyn" },
        { text = "What makes a good sword?", next = "good" },
        { text = "Do you think less of dagger work?", next = "dagger", when = { class = "ROGUE" } },
        { text = "Honor to your tribe, Kard.", next = "END" },
      },
    },
    small = {
      lines = { { id = "small_d", text = "It does, and that is why the Ragetotem made our name with totems and axes. But the Horde brought us orcs and trolls and the Forsaken, and I learned the sword so that the hall would have something for every hand that came up the lifts." } },
      choices = {
        { text = "Who taught you?", next = "small_taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    small_taught = {
      lines = { { id = "small_taught_d", text = "An old orc grunt who had carried the same blade through two wars and an internment camp. He taught me that a sword is for the fighter who means to be somewhere else by the time the answer comes, and I have respected it since." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hall = {
      lines = { { id = "hall_d", text = "Delgo has the axes and Etu the maces and staves, and Ohanko sells whatever needs two hands and a strong back. We are kin or near to it, and we argue all day about which weapon wins wars." } },
      choices = {
        { text = "Which one does?", next = "hall_wins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_wins = {
      big = true,
      lines = { { id = "hall_wins_d", text = "Delgo would say the axe and Etu the mace, and they would both be thinking of the arm behind it. I say the weapon matters less than whether the one who holds it will stand when the line bends." } },
      choices = {
        { text = "Standing fast wins wars. Blades only help.", next = "BACK", reply = "Then you understand the Ragetotem, and you may buy from me with my blessing.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Wars are won by whoever strikes first, from behind.", next = "BACK", reply = "Some are, and I sell the daggers for it. I will not pretend that I like to think of where they go.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jyn = {
      lines = { { id = "jyn_d", text = "Jyn sells sound Stonehoof steel on the lower rise, and she sells it like a sack of grain. A weapon is a promise between the smith and the one who carries it, and I will not hand over a promise without saying what it means." } },
      choices = {
        { text = "You respect her, all the same.", next = "BACK", reply = "I buy half my stock from her cousins' forge, so I had better. Do not carry that down the lift to her." },
        { text = "Something else.", next = "BACK" },
      },
    },
    good = {
      lines = { { id = "good_d", text = "Balance, first and last. Hold it out level at arm's length, and if the point wants to drop, put it down and try another, because by the end of a long fight that small pull will have become a weight you cannot lift." } },
      choices = {
        { text = "I'll test the balance before the edge.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dagger = {
      lines = { { id = "dagger_d", text = "I think less of some who carry them, and that is a different matter. A dagger in the hand of a scout who opens the way for the war party has saved more of my kin than I can count." } },
      choices = {
        { text = "That is the work I do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Ragetotem, and I fought the centaur beside my kin before Cairne raised this city. I sell blades now because my knees chose it for me." } },
    centaur = { { id = "tp_cen", text = "The centaur drove us across half of Kalimdor before the Horde came. No Ragetotem sells a weapon without remembering what it was like to need one." } },
    sark = { { id = "tp_sark", text = "Sark and Torm Ragetotem teach the warriors on Hunter Rise, and they are harder than I am. If they have passed you, I will sell you anything on the rack." } },
    _none = { { id = "tp_none", text = "That is no matter of steel, so I am no use to you. Ask the trainers on Hunter Rise." } },
  },
}

---------------------------------------------------------------------------
-- Delgo Ragetotem: axe merchant in the weapon hall.
---------------------------------------------------------------------------
P:NPC {
  key = "delgo", id = TODO_NPC("Delgo Ragetotem"), name = "Delgo Ragetotem", title = "Axe Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "hearty", "boastful" }, values = { "strength", "family" },
  notices = { "class", "race" },
  impression = {
    first = "Delgo Ragetotem sells axes in the weapon hall on the High Rise of Thunder Bluff, and he laughs loudly enough to rattle them on the racks. He believes that the axe is the one honest weapon, and will tell anyone so.",
    third = "{name} met Delgo Ragetotem, the axe merchant of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Ha! Come in, and come to the right side of the hall, where the real weapons are kept." },
    { id = "g_back", when = { metBefore = true }, text = "There you are! Tell me that axe has split something worth the telling." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc! Your people understand the axe as mine do, and I never have to explain myself to you." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman with an axe is as old a sight as our people. The spirits do not mind a good edge, whatever Etu tells you about maces." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Delgo Ragetotem, and I sell axes. An axe fells the tree, builds the lodge, cuts the firewood and defends the door, and I would like to see Kard's little swords do half as much." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Delgo Ragetotem. I have traded axes with smiths of Orgrimmar, and I will say before my own kin that an orc blade bites deeper, though ours will still be whole when your grandchildren swing it." },
      },
      again = {
        { id = "h_again", text = "What else? Out with it!" },
        { id = "h_again2", text = "Ask, friend. I have breath enough for ten questions." },
      },
      choices = {
        { text = "Show me your axes.", next = "BUSINESS" },
        { text = "You don't think much of swords.", next = "swords" },
        { text = "Tell me about the Ragetotem tribe.", next = "tribe" },
        { text = "Which axe would you carry yourself?", next = "carry" },
        { text = "An axe that builds a lodge can't be much in a fight.", next = "build" },
        { text = "One axe, or one in each hand?", next = "two", when = { class = { "WARRIOR", "SHAMAN", "HUNTER" } } },
        { text = "Keep your edges keen, Delgo.", next = "END" },
      },
    },
    swords = {
      lines = { { id = "swords_d", text = "I think they are very pretty! Kard is my kinsman and I would die beside him, but a sword is good for one thing only, and a people who spent a thousand years on the move never carried anything that did only one thing." } },
      choices = {
        { text = "And Etu's maces?", next = "swords_etu" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swords_etu = {
      lines = { { id = "swords_etu_d", text = "A mace is a rock on a stick, and Etu knows that I think so. He answers that an axe is a rock on a stick which somebody has troubled to sharpen, and I have not yet found the reply to that." } },
      choices = {
        { text = "He may have won that one.", next = "BACK", reply = "He may! Do not tell him, for he is quiet enough about it to be unbearable.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe = {
      lines = { { id = "tribe_d", text = "We are the ones who went first when the centaur came, so that the herds and the calves could get away behind us. Sark and Torm teach the young warriors on Hunter Rise now, and Ker stands with them, and the rest of us see that they are armed." } },
      choices = {
        { text = "Did you fight the centaur yourself?", next = "tribe_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe_fight = {
      lines = { { id = "tribe_fight_d", narr = "He stops laughing for the first time and rests a hand on the nearest haft.", text = "I did, in the dry years, and I lost a brother at a river crossing that has no name. When the orcs came and stood with us, I thought the Earth Mother had finally heard the Ragetotem shouting." } },
      choices = {
        { text = "The Horde is stronger for your tribe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = { { id = "carry_d", text = "A broad single blade on a haft as long as my arm, with enough weight in the head that I need not swing it twice. I would not carry one of the fancy two-bladed ones, for the second blade is only there to cut the fool holding it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    build = {
      lines = { { id = "build_d", text = "Ha! Say that to the pines of Stonetalon, which have not won a fight with one yet. The same swing that splits a log will split a shield, friend, and the log gave me more practice." } },
      choices = {
        { text = "I stand corrected, and I'll mind the pines.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    two = {
      lines = { { id = "two_d", text = "Learn one until it is a part of your arm, and only then think about a second. I have watched young ones take up two axes to look fierce, and they spend the whole fight keeping the pair from meeting each other." } },
      choices = {
        { text = "One first. That makes sense.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Ragetotem born, and I have had an axe in my hand since I could lift one. I sell them now, and still swing one every dawn so as not to forget." } },
    centaur = { { id = "tp_cen", text = "We owe the centaur a great many graves. The Horde has helped us pay some of that back." } },
    advice = { { id = "tp_advice", text = "Oil the haft as well as the head. An axe is half wood, and it is always the wood that lets you down." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof made a home for every tribe, the Ragetotem among them. We were the spear arm before that, and now we are a spear arm with a roof." } },
    _none = { { id = "tp_none", text = "Ha! You have found a question an axe cannot answer. Try Kuruk at the general goods, who knows the gossip." } },
  },
}

---------------------------------------------------------------------------
-- Etu Ragetotem: mace and staff merchant in the weapon hall.
---------------------------------------------------------------------------
P:NPC {
  key = "etu", id = TODO_NPC("Etu Ragetotem"), name = "Etu Ragetotem", title = "Mace & Staff Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "thoughtful", "dry" }, values = { "tradition", "spirit" },
  notices = { "class", "race" },
  impression = {
    first = "Etu Ragetotem sells maces and staves in the weapon hall on the High Rise of Thunder Bluff. He is the quiet one among loud kin, and he waits for the others to finish before saying the thing that ends the argument.",
    third = "{name} met Etu Ragetotem, who sells maces and staves in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome. The blunt weapons are with me, and they are a good deal more patient than the sharp ones." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. Sit a moment, for Delgo is in the middle of a story and we shall not be heard until he is done." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You will want a staff, and you will want one that was cut with permission, so let me show you those first." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The spirits walk close to you, shaman. A mace has always been your people's weapon and mine, and I am glad to see it kept." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "MAGE", "WARLOCK" } },
      text = "You lean on your magic and not your arm. A staff will serve you, then, and a stout one may save you when the magic runs dry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Etu Ragetotem, and I sell maces and staves. They were our first weapons, long before any tauren saw a forge, and I think they will be our last." },
        { id = "h_caster", when = { class = { "DRUID", "SHAMAN" } }, text = "I am Etu Ragetotem. Those who speak with the land have always come to my side of the hall, and I keep the old woods and the old shapes for them." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Go on. I have learned to listen in this hall, since nobody else does." },
        { id = "h_again3", text = "Speak, friend." },
      },
      choices = {
        { text = "Show me your maces and staves.", next = "BUSINESS" },
        { text = "Delgo calls a mace a rock on a stick.", next = "rock" },
        { text = "Sunn Ragetotem sells staves too.", next = "sunn" },
        { text = "You're quieter than your kin.", next = "quiet" },
        { text = "Where do your staves come from?", next = "wood" },
        { text = "What makes a staff right for a druid?", next = "druid", when = { class = "DRUID" } },
        { text = "Walk with the Earth Mother, Etu.", next = "END" },
      },
    },
    rock = {
      lines = { { id = "rock_d", text = "He is right, and he thinks it an insult. A rock on a stick is what stood between our calves and the centaur for a thousand years, and it never needed sharpening, never rusted, and never once broke its promise." } },
      choices = {
        { text = "What does a mace do that an axe can't?", next = "rock_does" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rock_does = {
      lines = { { id = "rock_does_d", text = "It does not care what armor is in the way. An edge must find a gap, but a mace sends its word straight through plate to the bone beneath, and it leaves the plate for the next owner." } },
      choices = {
        { text = "A grim sort of thrift.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sunn = {
      lines = { { id = "sunn_d", text = "She does, in her own tent, and hers are finer than mine. Sunn sells staves for those who mean to call rain, and I sell them for those who may also need to hit something, and we send customers to each other without any ill will." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = { { id = "quiet_d", text = "In a family of drums, somebody must be the pause between the beats. Kard lectures and Delgo roars, and I find that if I wait until they are tired, I can win with a single sentence." } },
      choices = {
        { text = "What sentence was the last one?", next = "BACK", reply = "That an axe is only a rock which somebody troubled to sharpen. Delgo has been thinking about it for a season." },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = { { id = "wood_d", text = "From the groves of Mulgore, and each from a limb that the tree had already let fall or that a druid had marked for me. I will not sell a staff cut from living wood without leave, and the druids of Elder Rise know it." } },
      choices = {
        { text = "Does it matter to the wood?", next = "wood_matter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_matter = {
      big = true,
      lines = { { id = "wood_matter_d", text = "I believe it matters to the one who carries it. A staff taken by force remembers, and I have held such staves from goblin traders that felt sullen in the hand, though I cannot prove it to you." } },
      choices = {
        { text = "I believe you. Things remember how they were taken.", next = "BACK", reply = "Then you will carry your weapons well. Not everyone who comes into this hall has thought of it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wood is wood. A staff only needs to be strong.", next = "BACK", reply = "It needs that as well, and mine are. You may come to feel the difference in time, or you may not.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "druid_d", text = "It should be a little taller than you are when you stand on two legs, and of a wood that grows where you were raised. Ask Kym Wildmane or Sheal Runetotem to bless it, and it will answer you sooner than a bought blessing would." } },
      choices = {
        { text = "I'll take it to Elder Rise.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Ragetotem, and I carried a mace against the centaur as my kin did. I found afterward that I liked the weapons better when they were resting." } },
    spirits = { { id = "tp_spirit", text = "I am no shaman, but I have handled enough old wood to think that it listens. Ask on Spirit Rise if you want certainty." } },
    _none = { { id = "tp_none", text = "On that I have nothing to say, and I have learned not to say it at length. Ask Kard, who never learned." } },
  },
}

---------------------------------------------------------------------------
-- Ohanko: two-handed weapons in the weapon hall.
---------------------------------------------------------------------------
P:NPC {
  key = "ohanko", id = TODO_NPC("Ohanko"), name = "Ohanko", title = "Two Handed Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "slow", "immense" }, values = { "strength", "patience" },
  notices = { "class", "race" },
  impression = {
    first = "Ohanko sells two-handed weapons in the weapon hall on the High Rise of Thunder Bluff, and he is large even for a tauren. He handed me a maul I could barely lift, without the least sign that he thought it heavy.",
    third = "{name} met Ohanko, who sells two-handed weapons in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. Bend your knees before you lift anything from my racks, and we will get on well." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and your shoulders are broader. The big weapons do that." },
  },
  notice = {
    { id = "n_small", cat = "race", when = { race = { "Troll", "Scourge" } },
      text = "You are lean, friend. I do not say you cannot swing one of these, only that you should pick it up before you decide." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You have the frame for a great weapon, as our people do. It would be a waste to fill hands like yours with something small." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You will want to try the weight of everything, so take your time, for I am in no hurry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Ohanko. If it takes two hands and a strong back to lift, I sell it. The Ragetotems have the rest of the hall, and they are kind enough to let me keep the heavy corner." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Ohanko. The great totems our warriors carry into battle were whole tree trunks once, young one, and everything on these racks is only a smaller cousin of those." },
      },
      again = {
        { id = "h_again", text = "What else? Take your time." },
        { id = "h_again2", text = "Ask. I move slowly, but I do listen." },
      },
      choices = {
        { text = "Show me your two-handed weapons.", next = "BUSINESS" },
        { text = "You aren't a Ragetotem, yet you share their hall.", next = "hall" },
        { text = "Why give up a shield for one of these?", next = "shield" },
        { text = "That maul looks like a tree trunk.", next = "totem" },
        { text = "How do I swing something this heavy?", next = "swing" },
        { text = "Could a tauren carry something heavier still?", next = "heavier", when = { race = "Tauren" } },
        { text = "Strength to you, Ohanko.", next = "END" },
      },
    },
    hall = {
      lines = { { id = "hall_d", text = "I carried the totem beside Ragetotem warriors in the centaur years, and when they raised this hall they said there was a place in it for me. Kard, Delgo and Etu quarrel like brothers, and they have always quarrelled with me as one of them." } },
      choices = {
        { text = "Which of them is right about weapons?", next = "hall_right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_right = {
      lines = { { id = "hall_right_d", text = "Each of them is right about his own. I let them argue, and when they turn to ask what I think, I pick up the biggest maul in the hall and say nothing, and that generally settles it until morning." } },
      choices = {
        { text = "A strong argument.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shield = {
      big = true,
      lines = { { id = "shield_d", text = "Because a shield only asks the enemy to try again. A great weapon ends the question at the first answer, and a fight that is over quickly is a fight in which fewer of your friends are hurt." } },
      choices = {
        { text = "End it fast. That is the kindest way to fight.", next = "BACK", reply = "So I have always thought. I take no joy in a long fight, only in a finished one.", fx = { align = { order = -1 } } },
        { text = "I'd sooner hold the line and shield my friends.", next = "BACK", reply = "That is a good way too, and Sark on Hunter Rise teaches it well. Somebody must stand still so that I can swing.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    totem = {
      lines = { { id = "totem_d", text = "It very nearly is one. Our warriors fought with carved logs long before we worked iron, and when I first saw an orc's great hammer I thought that here at last was a people who understood." } },
      choices = {
        { text = "Do tauren still fight with totems?", next = "totem_still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    totem_still = {
      lines = { { id = "totem_still_d", text = "The High Chieftain does, and you need only look at what Cairne carries to see it. There are few left who can swing one, and so the rest come to me for iron, which forgives a weaker arm." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    swing = {
      lines = { { id = "swing_d", text = "You do not swing it at all; you start it moving and then you go along with it. Let the weight carry round from your hips, and never try to stop it halfway, because that is how the young ones tear their shoulders." } },
      choices = {
        { text = "Start it, and follow it.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heavier = {
      lines = { { id = "heavier_d", text = "You could, and one day you may. Come back when the heaviest thing on this rack feels like a walking stick, and I will take you to Tah Winterhoof to talk about a totem of your own." } },
      choices = {
        { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    cairne = { { id = "tp_cairne", text = "I have seen the High Chieftain fight, and I have not picked up a totem since. Some things are better admired than imitated." } },
    background = { { id = "tp_bg", text = "I carried a war totem against the centaur beside the Ragetotem. When my back told me to stop, they gave me this corner." } },
    advice = { { id = "tp_advice", text = "Rest before your arms tell you to. A great weapon swung by tired arms is more dangerous to your friends than to your enemy." } },
    _none = { { id = "tp_none", text = "I do not know. I have spent my life lifting things, and it has left little room for anything else." } },
  },
}

---------------------------------------------------------------------------
-- Sura Wildmane: war harness vendor on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "sura", id = TODO_NPC("Sura Wildmane"), name = "Sura Wildmane", title = "War Harness Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "firm", "motherly" }, values = { "tradition", "duty" },
  notices = { "race", "class" },
  impression = {
    first = "Sura Wildmane sells war harnesses on the High Rise of Thunder Bluff, the strapped armor that tauren warriors have worn for generations. She tugged at my own straps with a frown before she had told me her name.",
    third = "{name} met Sura Wildmane, who sells war harnesses in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Stand still a moment. Who buckled that for you? No, do not answer, for I can see that you did it yourself." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and the straps are sitting properly this time. I am pleased with you." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A harness should sit across the hump of your shoulders and not below it, young one. Your mother ought to have shown you that." },
    { id = "n_other", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "I can cut a harness down for one of your size, though there will be enough leather left over for a second." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Sura Wildmane, and I sell war harnesses. A harness is the oldest armor our people have, and every tauren who ever stood against the centaur was wearing one that somebody like me had fitted." },
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Sura Wildmane. My kin Nara and Kym teach your calling on Elder Rise, and they send me the young druids who have split their harness by changing shape in it." },
      },
      again = {
        { id = "h_again", text = "What else, young one?" },
        { id = "h_again2", text = "Ask, and stop slouching while you do." },
        { id = "h_again3", text = "Yes? I am listening." },
      },
      choices = {
        { text = "Show me your harnesses.", next = "BUSINESS" },
        { text = "What makes a harness different from armor?", next = "harness" },
        { text = "You fit these to everyone who comes by.", next = "fit" },
        { text = "The Wildmanes on Elder Rise are your kin?", next = "kin" },
        { text = "Who works near you?", next = "rise" },
        { text = "Does a harness survive a change of shape?", next = "shape", when = { class = "DRUID" } },
        { text = "Earth Mother watch over you, Sura.", next = "END" },
      },
    },
    harness = {
      lines = { { id = "harness_d", text = "Armor is made to keep a blow out, and a harness is made to let you move. Our people fight with their whole bodies, with horn and shoulder and hoof, so we strap the hide where it is needed and leave the rest free." } },
      choices = {
        { text = "And the feathers and beads?", next = "harness_beads" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harness_beads = {
      lines = { { id = "harness_beads_d", text = "Those are earned, and I do not sell them. A feather for a first hunt, a bead for each season of war, and a tooth for something you would prefer not to talk about. I only leave the loops to tie them to." } },
      choices = {
        { text = "Then I have loops to fill.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit = {
      big = true,
      lines = { { id = "fit_d", text = "I do, and I will not sell one unfitted. A strap that slips in a charge can cost a warrior an arm, and I fitted too many young ones in the centaur years who did not come home to be careless about it now." } },
      choices = {
        { text = "Take all the time you need over mine.", next = "BACK", reply = "Good. Lift your arms, then, and breathe out, and do not hold your belly in.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I know my own gear. Just sell it to me.", next = "BACK", reply = "You may know your gear, but you have never seen your own back. Lift your arms.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "kin_d", text = "They are. Nara and Kym went to the druids and the old ways of the wild, and I stayed with leather and buckles. The family teases me that I dress the warriors they will later have to heal." } },
      choices = {
        { text = "Then you all serve the same tribe.", next = "BACK", reply = "That is what I tell them, when they will let me speak." },
        { text = "Do you envy them the druid's path?", next = "kin_envy" },
        { text = "Something else.", next = "BACK" },
      },
    kin_envy = {
      lines = { { id = "kin_envy_d", text = "I did when I was young, for they were called and I was not. Then the war parties began to come home whole in harnesses I had fitted, and I understood that the Earth Mother gives each of us a different way to keep the tribe alive." } },
      choices = {
        { text = "Yours is as worthy as theirs.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    },
    rise = {
      lines = { { id = "rise_d", text = "Sunn Ragetotem with her staves, who is good company on a slow day, and the weapon hall, which is never slow and never quiet. Una's leatherworkers cure my hides, and Mahu sells me buckles when the Stonehoofs are behind on theirs." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shape = {
      lines = { { id = "shape_d", text = "A well-made one goes with you into the shape, as the druids explain it, and comes back when you do. A badly fitted one comes back twisted, and then you come to me red in the face and I say nothing at all." } },
      choices = {
        { text = "I'll have mine fitted properly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fitted harnesses for the Bloodhoof war parties when we still fled the centaur. I do the same now, and I am glad that more of them come back." } },
    centaur = { { id = "tp_cen", text = "Ask any tauren my age about the centaur, and watch their hands. Mine still check straps without my asking them to." } },
    advice = { { id = "tp_advice", text = "Check every buckle before a fight, and then check the one you were certain of. It is always that one." } },
    _none = { { id = "tp_none", text = "That is no business of mine, young one, and I would not guess at it. Ask at Cairne's lodge." } },
  },
}

---------------------------------------------------------------------------
-- Hogor Thunderhoof: guns merchant on the High Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "hogor", id = TODO_NPC("Hogor Thunderhoof"), name = "Hogor Thunderhoof", title = "Guns Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "enthusiastic", "defensive" }, values = { "progress", "craft" },
  notices = { "class", "craft" },
  impression = {
    first = "Hogor Thunderhoof sells guns on the High Rise of Thunder Bluff, which is an odd trade for a tauren and he knows it. He is as eager as a calf about powder and shot, and a little braced for the next elder to scold him.",
    third = "{name} met Hogor Thunderhoof, the guns merchant of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, friend! Do not be alarmed by the smell, for it is only powder, and none of it is lit." },
    { id = "g_back", when = { metBefore = true }, text = "You are back! How does she shoot? Tell me everything, and start with the noise." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Kuna Thunderhorn will have told you that a bow is the only honest weapon, and I ask only that you hear my side." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Are those powder burns on your fingers? At last, here is someone on this bluff I can talk to properly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Hogor Thunderhoof, and I sell guns. Yes, a tauren, and yes, guns, and I have heard everything the elders have to say about it at least twice." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "I am Hogor Thunderhoof. You tinker, so you will understand me when I say that the first time I saw a goblin's rifle taken apart, I did not sleep for two nights." },
      },
      again = {
        { id = "h_again", text = "What else? I could talk about this all day, and I often do." },
        { id = "h_again2", text = "Ask away, friend!" },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "The elders don't approve, I take it.", next = "elders" },
        { text = "Where does a tauren get guns to sell?", next = "from" },
        { text = "Kuna Thunderhorn sells bows nearby.", next = "kuna" },
        { text = "Bow or gun, for a hunter?", next = "choose", when = { class = "HUNTER" } },
        { text = "Do you build any of these yourself?", next = "build", when = { profession = "Engineering" } },
        { text = "Keep your powder dry, Hogor.", next = "END" },
      },
    },
    elders = {
      lines = { { id = "elders_d", text = "They say that a hunter should feel the death he deals in his own arm, and that thunder belongs to the sky. I say that the centaur did not ask our leave before they outnumbered us, and that I would have given a great deal for one rifle on the day my camp was run down." } },
      choices = {
        { text = "What do you say to those who call it dishonorable?", next = "elders_honor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders_honor = {
      big = true,
      lines = { { id = "elders_honor_d", text = "That the honor is in why you shoot and in what you do with the kill. I thank every beast I take, as my father did with his spear, and the Earth Mother has not yet struck my powder wet." } },
      choices = {
        { text = "The old ways must bend, or the tribes will break.", next = "BACK", reply = "That is it exactly! I wish you would say it on Elder Rise, for they are tired of hearing it from me.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The elders are right. Some old ways should hold.", next = "BACK", reply = "Some should, and I keep most of them. I only think that this one was made for a world with fewer enemies in it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    from = {
      lines = { { id = "from_d", text = "From the goblins of Ratchet, for the most part, and now and then from an orc who has taken a dwarven piece as a prize of war. I check every barrel myself, because a goblin's notion of 'tested' is that it has gone off once." } },
      choices = {
        { text = "Have you had one go wrong?", next = "from_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    from_wrong = {
      lines = { { id = "from_wrong_d", text = "Once, on the edge of the rise, and I had no eyebrows for a season. Kuna laughed until she had to sit down, and I have tested them with a long string ever since." } },
      choices = {
        { text = "A long string seems wise.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kuna = {
      lines = { { id = "kuna_d", text = "She does, and she makes the finest bows in the Horde, which I will say to anyone. We have agreed that she sells to those who want quiet and I sell to those who want certainty, and we share the hunters between us without any blood spilled." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    choose = {
      lines = { { id = "choose_d", text = "Take the bow if you stalk, and take the gun if you stand beside warriors, where nobody will hear it over the fighting in any case. And see how your companion bears the noise before you decide, for some beasts never forgive it." } },
      choices = {
        { text = "I'll let my companion have a say.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    build = {
      lines = { { id = "build_d", text = "I mend them and I true the barrels, but I have not built one from nothing yet. There is no engineer on the bluff to learn from, so I take what the goblins will teach for coin and work out the rest with a file." } },
      choices = {
        { text = "You'll get there. The hard part is wanting to.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a hunter with a spear, and not a bad one. Then a goblin in Ratchet let me fire his rifle, and that was the end of the spear." } },
    goblins = { { id = "tp_gob", text = "Goblins are clever and careless in equal measure. Buy what they make, friend, and stand well back from how they make it." } },
    advice = { { id = "tp_advice", text = "Clean the barrel after every hunt, even when you are tired. Powder is forgiving until the one time it is not." } },
    cairne = { { id = "tp_cairne", text = "The High Chieftain has never told me to stop, though some would like him to. He said only that a weapon is judged by the heart behind it." } },
    _none = { { id = "tp_none", text = "That I could not tell you! If it does not go bang, I have probably not looked into it." } },
  },
}

---------------------------------------------------------------------------
-- Second gap pass: the crafters' tents of the middle rise (Fela, Grod, Tagain, Tarn, Mak, Vhan, Mahu,
-- the Dawnstrider enchanters Teg, Mot and Nata, Kray and Mani Winterhoof).
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Fela: heavy armor merchant at the Thunder Bluff Armorers.
---------------------------------------------------------------------------
P:NPC {
  key = "fela", id = TODO_NPC("Fela"), name = "Fela", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "frank", "sturdy" }, values = { "duty", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Fela sells heavy armor on the middle rise of Thunder Bluff, and she rapped her knuckles on my chest to hear what I was wearing. She is frank about what will and will not keep a fighter alive.",
    third = "{name} met Fela, the heavy armor merchant of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Come here and let me knock on you. I can tell more from the sound than from anything you will say about it." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and still in one piece, so something I sold you must have worked." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, and one who has been hit recently, by the way you are favouring that side. Sit down and tell me where the armor failed." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That gear is held together by habit, friend. Take it down to Karn's forge today, and then come and see me about what cannot be saved." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Fela, and I sell the heavy armor. Grod has the leather and Tagain the cloth, so between the three of us there is nobody we send away undressed." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "I am Fela. Sark and Torm Ragetotem send their students to me from Hunter Rise, {class}, and I send them back heavier and harder to kill." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up." },
        { id = "h_again2", text = "Ask it. I have nothing to do but polish until you buy something." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Heavy armor is new to the tauren.", next = "new" },
        { text = "What fails first on a suit of armor?", next = "fails" },
        { text = "Who shares this tent with you?", next = "tent" },
        { text = "Can you fit armor to someone my size?", next = "size", when = { race = { "Orc", "Troll", "Scourge" } } },
        { text = "What should a warrior buy first?", next = "first", when = { class = "WARRIOR" } },
        { text = "Stand strong, Fela.", next = "END" },
      },
    },
    new = {
      lines = { { id = "new_d", text = "It is new within my own lifetime. We had hide and horn and the harness, and those were enough while the enemy carried spears. Then we stood beside orcs against demons, and learned what it costs to meet steel in leather." } },
      choices = {
        { text = "Do the old warriors accept it?", next = "new_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    new_old = {
      big = true,
      lines = { { id = "new_old_d", text = "Some call it hiding in a pot. I ask them how many friends they buried who might have been spared by a hand's width of iron, and after that they generally buy a breastplate for their sons." } },
      choices = {
        { text = "Courage is no reason to die needlessly.", next = "BACK", reply = "That is what I say, in fewer words. A dead warrior defends nobody.", fx = { align = { order = 1 } } },
        { text = "There is honor in meeting a blade unarmored.", next = "BACK", reply = "There is a grave in it, more often. But I will not mock the old ones for what they had to do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fails = {
      lines = { { id = "fails_d", text = "The straps fail, every time, long before the plates. A fighter will spend gold on steel and then hang it from leather that has cracked, so look to your buckles tonight and thank me later." } },
      choices = {
        { text = "I'll check them tonight.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tent = {
      lines = { { id = "tent_d", text = "Grod and Tagain sell beside me, and Una's leatherworkers have the back of the tent, with Tarn and Mak. It smells of tannin and oil all day, and I have come to think that is how honest work ought to smell." } },
      choices = {
        { text = "Do you get along with Grod?", next = "tent_grod" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tent_grod = {
      lines = { { id = "tent_grod_d", text = "Well enough, though he believes a fighter should dodge and I believe a fighter should not need to. We have each sold armor to the other's customers out of spite, and nobody has been the worse for it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    size = {
      lines = { { id = "size_d", text = "I can. The smaller pieces come from Orgrimmar and I adjust them here, and I do it properly. You will not rattle in anything of mine, though I may have to stand you on a stool to see what I am doing." } },
      choices = {
        { text = "I'll bring my own stool.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "first_d", text = "Buy for your chest and your head first, and let the shining shoulders wait. Pand Stonebinder can bandage everything else on you, but there is little to be done for those two." } },
      choices = {
        { text = "Chest and head. Understood.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a shield in the war against the Legion and came home wanting everyone to have a better one. That is the whole of my story." } },
    advice = { { id = "tp_ad", text = "Wear new armor for a day on the bluff before you wear it to a fight. It will tell you where it means to rub." } },
    centaur = { { id = "tp_centaur", text = "The centaur fought with spears and numbers, and hide was enough against them. The Legion taught us that there are worse things than centaur." } },
    _none = { { id = "tp_none", text = "I cannot help you with that. If it will not stop a blade, I have not studied it." } },
  },
}

---------------------------------------------------------------------------
-- Grod: leather armor merchant at the Thunder Bluff Armorers.
---------------------------------------------------------------------------
P:NPC {
  key = "grod", id = TODO_NPC("Grod"), name = "Grod", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "easy", "sly" }, values = { "craft", "freedom" },
  notices = { "class", "craft" },
  impression = {
    first = "Grod sells leather armor on the middle rise of Thunder Bluff, a few steps from the leatherworkers who make it. He moves lightly for a tauren and thinks everyone else should too.",
    third = "{name} met Grod, a leather armor merchant of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. Bend your knees and turn about for me, and I shall see where your armor fights you." },
    { id = "g_back", when = { metBefore = true }, text = "You are moving more easily than last time. That is my leather, and you are welcome." },
  },
  notice = {
    { id = "n_light", cat = "class", when = { class = { "ROGUE", "DRUID", "HUNTER" } },
      text = "You are one who would sooner not be hit at all. Good, for that is the only kind of fighter I know how to dress." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work hide yourself, by the stain on your thumbs. Then you will look at my seams before my prices, and I will not be ashamed of either." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Grod, and I sell leather armor. Fela beside me will sell you a suit of iron to stand still in, and I will sell you something in which you can get out of the way." },
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Grod. Leather is the only armor that was alive once, druid, and I have always thought that is why your kind wear it so well." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Ask on. I am quick at most things, and answers are one of them." },
      },
      choices = {
        { text = "Show me your leather armor.", next = "BUSINESS" },
        { text = "Fela thinks a fighter shouldn't need to dodge.", next = "fela" },
        { text = "Who makes what you sell?", next = "makes" },
        { text = "Ahanu on the lower rise sells leather too.", next = "ahanu" },
        { text = "How do I keep leather from cracking?", next = "keep" },
        { text = "What hides make the best armor?", next = "hides", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "Tread lightly, Grod.", next = "END" },
      },
    },
    fela = {
      lines = { { id = "fela_d", text = "Fela was a shield bearer, and she thinks like a wall. I scouted for the war parties, and a scout who is hit even once has already done the work badly, so we will never agree and I would be sorry if we did." } },
      choices = {
        { text = "What did a scout wear, in those days?", next = "fela_scout" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fela_scout = {
      lines = { { id = "fela_scout_d", text = "Soft kodo hide rubbed with ash and grass, so that the centaur's hounds would smell only the plain. It stopped nothing, but I was never where the spear came down, and I am here to sell you its grandchildren." } },
      choices = {
        { text = "The best armor is not being there.", next = "BACK", reply = "You have it. I ought to hang that over the tent.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    makes = {
      lines = { { id = "makes_d", text = "Una and her students, at the back of this very tent. Tarn does the plainer pieces and does them well, and when Una herself has made something, I put it at the front and raise the price without a blush." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ahanu = {
      lines = { { id = "ahanu_d", text = "He does, and he gives away one piece in five, which is hard on those of us who must eat. I cannot dislike him for it, though I have tried." } },
      choices = {
        { text = "You sound as if you admire him.", next = "ahanu_admire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ahanu_admire = {
      big = true,
      lines = { { id = "ahanu_admire_d", text = "I suppose I do. A young hunter came up to me last season in boots that Ahanu had given away, and bought a full set from me with the first coin earned in them. I have thought about that a good deal since." } },
      choices = {
        { text = "Generosity comes back. Ahanu has it right.", next = "BACK", reply = "It came back to my purse and not to his, which is the part that troubles me. I sent him a hide, and said it was spare.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He was lucky. Most gifts are simply gone.", next = "BACK", reply = "Most are, and that is what I told myself for years. It grows harder to believe each season.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = { { id = "keep_d", text = "Rub fat into it after every soaking, and dry it slowly, well back from the fire. Leather forgives rain and blood and even a little flame, but it never forgives being baked." } },
      choices = {
        { text = "Slowly, away from the fire.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hides_d", text = "Kodo for anything that must turn a blow, and prowler or plainstrider where you want it to bend. Mooranta can tell you how to take a hide without spoiling it, which is where most good armor is lost." } },
      choices = {
        { text = "I'll speak with Mooranta.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I scouted for the tribes when we still ran from the centaur. I sell what I wish I had worn then." } },
    advice = { { id = "tp_ad", text = "If your armor makes a noise when you walk, something is loose. Find it before your enemy hears it." } },
    una = { { id = "tp_una", text = "Una is the finest leatherworker on Kalimdor, and she knows it and says nothing. I would not sell another's work beside hers." } },
    centaur = { { id = "tp_centaur", text = "I spent my youth a hilltop ahead of the centaur, watching their dust. I do not miss the work, though I miss being that light on my hooves." } },
    _none = { { id = "tp_none", text = "I have no notion, friend. I keep my ear to the ground, but that never came along it." } },
  },
}

---------------------------------------------------------------------------
-- Tagain: cloth armor merchant at the Thunder Bluff Armorers.
---------------------------------------------------------------------------
P:NPC {
  key = "tagain", id = TODO_NPC("Tagain"), name = "Tagain", title = "Cloth Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "serene", "observant" }, values = { "spirit", "craft" },
  notices = { "class", "race" },
  impression = {
    first = "Tagain sells cloth armor on the middle rise of Thunder Bluff, among robes hung up to move in the wind. She is serene, and chose what I should try on by watching how I walked.",
    third = "{name} met Tagain, a cloth armor merchant of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome. Walk to the tent pole and back for me, and then I will know which robe is yours." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The robe has learned your shape, I see, as good cloth does." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You are a healer, for you looked at the people in this tent before you looked at the goods. I have something plain and strong for you." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "You carry magic that our people do not practise. Cloth does not mind whose spells pass through it, and neither do I." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tagain, and I sell robes and wraps. Those who fight with their spirit need nothing heavy between themselves and the wind, and I see that they have it." },
        { id = "h_shaman", when = { class = { "SHAMAN", "DRUID" } }, text = "I am Tagain. Before you had the strength for mail or the hide of a beast, you will have worn something like these, and many of the far seers never wear anything else." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of me?" },
        { id = "h_again2", text = "Speak. The cloth and I are both listening." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Show me your cloth armor.", next = "BUSINESS" },
        { text = "You chose a robe by how I walk.", next = "walk" },
        { text = "Who weaves these?", next = "weave" },
        { text = "Hewa sells robes on the lower rise as well.", next = "hewa" },
        { text = "Why hang them in the wind?", next = "wind" },
        { text = "What does a healer's robe need?", next = "healer", when = { class = { "PRIEST", "SHAMAN", "DRUID" } } },
        { text = "May the winds be gentle with you.", next = "END" },
      },
    },
    walk = {
      lines = { { id = "walk_d", text = "I did. One who strides needs a robe split to the knee, and one who drifts will trip on anything but a short hem. You stride, and you look behind you often, so I would give you something that does not rustle." } },
      choices = {
        { text = "You see a great deal.", next = "walk_see" },
        { text = "I look behind me for good reason.", next = "walk_see", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    walk_see = {
      lines = { { id = "walk_see_d", text = "I sat at the edge of the council fires for many years, mending, and nobody minds what they do in front of a mender. Watching is a craft like any other, and it has made me a better seller of robes than of opinions." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    weave = {
      lines = { { id = "weave_d", text = "Tepa and her apprentice Vhan weave the best of them, across the rise. The plainer ones are sewn by families below in Mulgore during the winter, and I buy every one that is honestly made, so that the craft takes root." } },
      choices = {
        { text = "You buy them even if they won't sell?", next = "weave_buy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weave_buy = {
      big = true,
      lines = { { id = "weave_buy_d", text = "I do. A young weaver whose first robe is refused will go back to hides and never try again. So I pay for it, and I sell it cheaply to some calf going out to the Barrens, and both of them are better off." } },
      choices = {
        { text = "That's how a craft is kept alive.", next = "BACK", reply = "It is the only way I know. Tepa does it with thread, and I do it with coin.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Poor work should be refused, or it stays poor.", next = "BACK", reply = "Poor work is unpicked and shown again, and I see to that as well. But I pay for the trying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hewa = {
      lines = { { id = "hewa_d", text = "Hewa is by the lifts and catches the travellers, and I am up here among the crafters and catch those who mean to stay a while. There is cloth enough for two tents, and we have never undercut one another." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wind = {
      lines = { { id = "wind_d", text = "So that you may see how each one moves before you are inside it. And because the wind on this bluff is a blessing, and I like to think a little of it goes with every robe down the lifts and out into the world." } },
      choices = {
        { text = "A good thought to carry with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    healer = {
      lines = { { id = "healer_d", text = "Sleeves that can be pushed above the elbow and will stay there, and a colour that does not show blood to the one you are tending. A frightened patient heals slowly, and your robe should not be what frightens them." } },
      choices = {
        { text = "I hadn't thought of the colour.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I mended for the tribe's elders before I sold anything. I have always been at the edge of things with a needle." } },
    spirits = { { id = "tp_spirit", text = "I am no shaman, but I notice that the wind takes more interest in some robes than in others. I do not ask it why." } },
    advice = { { id = "tp_advice", text = "Hang your robe in the open air when you make camp. The wind will take out the smoke and the worry together." } },
    _none = { { id = "tp_none", text = "I watched for that and saw nothing, so I cannot tell you. Ask on Elder Rise." } },
  },
}

---------------------------------------------------------------------------
-- Tarn: Una's senior student among the leatherworkers.
---------------------------------------------------------------------------
P:NPC {
  key = "tarn_tb", id = TODO_NPC("Tarn"), name = "Tarn", title = "Apprentice Leatherworker",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gentle", "encouraging" }, values = { "craft", "kindness" },
  notices = { "craft", "class" },
  impression = {
    first = "Tarn works leather under Una on the middle rise of Thunder Bluff, and teaches those who are just beginning. He is gentle about a learner's mistakes, and he found something to praise in work that did not deserve it.",
    third = "{name} met Tarn, a leatherworker who teaches in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, friend. Have you brought something to show me, or have you come to begin?" },
    { id = "g_back", when = { metBefore = true }, text = "It is good to see you again. Let me look at your stitching, and do not be nervous about it." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You have brought the smell of the tanning pit with you, and I mean that kindly. Show me the last thing you made." },
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You carry a skinning knife and you keep it clean. Half of good leatherwork is done before the hide ever reaches me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tarn. Una is the master here, and I teach the first cuts and stitches to those who are not yet ready for her eye, which is a frightening thing when you are new." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "I am Tarn. You work leather already, so let us look at what you have made together, and I will tell you where it is good before I tell you anything else." },
      },
      again = {
        { id = "h_again", text = "What else can I help you with?" },
        { id = "h_again2", text = "Ask, friend. There are no foolish questions at this bench." },
      },
      choices = {
        { text = "Teach me what you can of leatherworking.", next = "BUSINESS" },
        { text = "Mooranta says you tell the truth gently.", next = "gently" },
        { text = "What is Una like as a master?", next = "una" },
        { text = "What does a beginner spoil most often?", next = "spoil" },
        { text = "Who else works in this tent?", next = "tent" },
        { text = "When will I be ready for Una?", next = "ready", when = { profession = "Leatherworking" } },
        { text = "Thank you, Tarn.", next = "END" },
      },
    },
    gently = {
      lines = { { id = "gently_d", text = "Mooranta thinks gentleness is a fault, and says so. I only remember being new and being told my first quiver was fit for the fire, and how near I came to never picking up an awl again." } },
      choices = {
        { text = "Who told you that?", next = "gently_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gently_who = {
      big = true,
      lines = { { id = "gently_who_d", text = "Una did, and she was right about the quiver. She taught me everything I know, and I love her for it, but I resolved that the next frightened calf at this bench would hear the truth in a softer voice." } },
      choices = {
        { text = "A kind teacher gets more from a student.", next = "BACK", reply = "I have found it so. They come back, at least, and a student who comes back can still be taught.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Harsh words made you good. Don't spare them.", next = "BACK", reply = "Perhaps they did. I would still sooner be remembered for the mending than for the cut.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    una = {
      lines = { { id = "una_d", text = "She is exacting, and she sees a crooked stitch from across the tent. She is also the first one here before dawn and the last to leave, and she has never asked anything of us that she does not ask of herself twice over." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spoil = {
      lines = { { id = "spoil_d", text = "They cut before they have looked. Every hide has thin places and old scars, and it will show them to you if you hold it up to the light, so I teach that before I teach the knife." } },
      choices = {
        { text = "Look first, then cut.", next = "BACK", reply = "That is the whole first lesson, and you have saved me an afternoon.", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tent = {
      lines = { { id = "tent_d", text = "Mak works beside me, and Mahu in the next tent sells us our thread and salt. Grod sells what we finish, and Veren Tallstrider comes by more often than his own work can explain, mostly to talk." } },
      choices = {
        { text = "And the tailors next door?", next = "tent_tailors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tent_tailors = {
      lines = { { id = "tent_tailors_d", text = "Tepa and Vhan are good neighbours, though they hold that cloth is the finer craft. Our awls go missing into their tent, and their needles turn up in ours, and nobody has ever confessed to anything." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ready = {
      lines = { { id = "ready_d", text = "When you can show me a piece and tell me yourself what is wrong with it. Una does not mind a mistake that the maker has already seen, and she has a great deal to give to those who can see." } },
      choices = {
        { text = "Then I'll learn to see my own faults.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to Una's bench as a calf with clumsy hands. They are less clumsy now, and I have her to thank." } },
    advice = { { id = "tp_ad", text = "Keep your first piece, however poor it is. On a bad day it will show you how far you have come." } },
    una = { { id = "tp_una", text = "Una taught me, and she teaches the ones who are ready for harder truths than mine. Go to her when your stitches are even." } },
    veren = { { id = "tp_veren", text = "Veren Tallstrider tans in his own fashion and argues about ours. He is good company and usually half right." } },
    _none = { { id = "tp_none", text = "I am sorry, I do not know. Una might, if you catch her between hides." } },
  },
}

---------------------------------------------------------------------------
-- Mak: leatherworker in Una's tent.
---------------------------------------------------------------------------
P:NPC {
  key = "mak_tb", id = TODO_NPC("Mak"), name = "Mak", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "practical", "talkative" }, values = { "craft", "thrift" },
  notices = { "craft", "race" },
  impression = {
    first = "Mak keeps the leatherworkers of Thunder Bluff in salt, dye and thread, from a bench at the back of the armorers' tent. He talks while he measures, and wastes nothing, including any chance to give advice.",
    third = "{name} met Mak, who supplies the leatherworkers of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Come round the hides, friend, and mind the dye pot. What does your work want for today?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more thread already? Then either you are working hard or you are wasting it." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "There is a leatherworker's callus on your palm, where the awl sits. You will know what you need, and I shall tell you anyway." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Your people cure hide with something from the mangroves that I cannot get, and I would pay well for the name of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mak. Una and Tarn do the teaching here, and I see to it that the bench never runs dry of salt or thread. I can cut a pattern with the best of them too, though nobody asks." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "I am Mak. You work hide, so I will save us both time and say that you are using too little salt, because everyone does." },
      },
      again = {
        { id = "h_again", text = "What else? I can measure and talk." },
        { id = "h_again2", text = "Go on, I was about to tell you something in any case." },
        { id = "h_again3", text = "Ask it, friend." },
      },
      choices = {
        { text = "Let us get to business.", next = "BUSINESS" },
        { text = "What does curing a hide take?", next = "cure" },
        { text = "You said nobody asks you to cut patterns.", next = "pattern" },
        { text = "Mahu sells leatherworking supplies too.", next = "mahu" },
        { text = "Where do the dyes come from?", next = "dye" },
        { text = "How do I waste less hide?", next = "waste", when = { profession = "Leatherworking" } },
        { text = "Good work to you, Mak.", next = "END" },
      },
    },
    cure = {
      lines = { { id = "cure_d", text = "Salt at once, before the hide has cooled, and then a long soak with bark from the oaks below the bluff. After that comes more patience than most have, for a hide rushed off the frame will stink for as long as you own it." } },
      choices = {
        { text = "How long is long enough?", next = "cure_long" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cure_long = {
      lines = { { id = "cure_long_d", text = "A moon for light leather, and three for anything that must turn a blade. Mooranta says that the beast gives itself twice, once to the hunter and once to the tanner, and the second gift cannot be hurried." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pattern = {
      lines = { { id = "pattern_d", text = "They do not, because I was the one who could count, and so I was given the stores. It is always the way; be good at the dull thing, and you will never be let near the interesting one." } },
      choices = {
        { text = "Without the stores, nobody else could work.", next = "BACK", reply = "That is what Una says, on the days she remembers to. It is true, and I grumble all the same.", fx = { affinity = 1 } },
        { text = "Then cut something and show them.", next = "BACK", reply = "I may yet. There is a pair of bracers under this bench that nobody has seen.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mahu = {
      lines = { { id = "mahu_d", text = "He does, from the tent between us and the tailors, and he serves both crafts. I keep what this bench uses by the sackful, and he keeps the little things in every colour, so we point customers back and forth all day." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dye = {
      lines = { { id = "dye_d", text = "The reds and browns are from Mulgore earth, the same that Tah Winterhoof grinds for his totems. Black comes from oak gall and a rusty nail, and the bright colours I buy from troll traders, who will not tell me how they are made." } },
      choices = {
        { text = "A rusty nail makes black?", next = "dye_nail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dye_nail = {
      lines = { { id = "dye_nail_d", text = "It does, and it was a Stonehoof smith who showed me, by leaving his nails in my gall pot out of carelessness. I thanked him so warmly that he has been uneasy around me ever since." } },
      choices = {
        { text = "The best discoveries are accidents.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    waste = {
      lines = { { id = "waste_d", text = "Lay every piece of the pattern on the hide before you make a single cut, and turn them until they sit together like stones in a wall. The scraps left over make laces, and what is too small for a lace will still mend a strap." } },
      choices = {
        { text = "Nothing wasted. I'll remember.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have worked at Una's bench since the tent went up. I count, I measure, and now and then I am allowed to sew." } },
    advice = { { id = "tp_ad", text = "Buy more salt than you think you need. I have never met a tanner who regretted having too much." } },
    una = { { id = "tp_una", text = "Una can tell the age of a hide by pinching it. I can tell you how much salt it took, which nobody thinks is as clever." } },
    _none = { { id = "tp_none", text = "That I have no measure for, friend. Ask Veren Tallstrider, who knows a little of everything." } },
  },
}

---------------------------------------------------------------------------
-- Vhan: Tepa's talkative apprentice. Forever: Camping 101: Tailoring.
---------------------------------------------------------------------------
P:NPC {
  key = "vhan", id = TODO_NPC("Vhan"), name = "Vhan", title = "Apprentice Tailor",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "talkative", "eager" }, values = { "craft", "stories" },
  notices = { "craft", "travel" },
  impression = {
    first = "Vhan is apprenticed to the tailoring trainer on the middle rise of Thunder Bluff, and teaches beginners their first stitches. He told me three stories while threading one needle, and lost count of his stitches twice.",
    third = "{name} met Vhan, the apprentice tailor of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Oh, welcome! Sit down, only not on that pile, for I have just finished counting it and I do not want to begin again." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I was telling Tepa about you, and now I have lost my row, but never mind that." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew! I can see where you have pricked your thumb, in the same place as mine. Tepa says that it stops after ten years or so." },
    { id = "n_far", cat = "travel", when = { minLevel = 30 },
      text = "You have been to far places, I can tell from your boots. You must tell me what people are wearing there, and I will try not to drop this." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Vhan, Tepa's apprentice, and I teach the first stitches when she is busy at the loom. She says I would be a fine tailor if I could keep quiet for one whole seam, and I am very nearly there." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Tailoring") }, text = "Kaga Wildhoof sent you from Mulgore! She said she might. Show me a little of your sewing, and I will show you what a tailor can make to soften a camp." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Tailoring") }, text = "How is your camp? I hope it is more comfortable for a bit of needlework, and I hope you only set it up out in the wild." },
      },
      again = {
        { id = "h_again", text = "What else? I like the questions better than the counting." },
        { id = "h_again2", text = "Ask! Only softly, for Tepa is looking this way." },
        { id = "h_again3", text = "Yes? I am listening, and almost sewing." },
      },
      choices = {
        { text = "Teach me what you can of tailoring.", next = "BUSINESS" },
        { text = "Tepa says you talk while you count stitches.", next = "talk" },
        { text = "Why did you take up tailoring?", next = "why" },
        { text = "What is Tepa like to learn from?", next = "tepa" },
        { text = "What can a tailor do for a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Tailoring") } },
        { text = "Let me tell you what they wear in the east.", next = "east", when = { minLevel = 30 } },
        { text = "Keep counting, Vhan.", next = "END" },
      },
    },
    talk = {
      lines = { { id = "talk_d", text = "I do, and I know that I do. It is only that the hands are busy and the mouth has nothing to occupy it, and there is always some traveller in the tent who has seen a thing I have not." } },
      choices = {
        { text = "What's the best story you've heard here?", next = "talk_story" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk_story = {
      lines = { { id = "talk_story_d", text = "A troll told me that in Stranglethorn there are spiders whose silk is as strong as bowstring, and that goblins pay gold for it by the spool. I dropped an entire row, and Tepa made me unpick it, and I still think it was worth the hearing." } },
      choices = {
        { text = "It's true. I've seen that silk.", next = "BACK", when = { minLevel = 30 }, reply = "You have? Oh, sit down again, and tell me how it feels between the fingers!", fx = { affinity = 1 } },
        { text = "A story worth a dropped row.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "why_d", text = "I was meant for a hunter, and I was dreadful at it, because I could never keep still or silent. Then I saw Tepa's loom and the cloth coming off it like water, and I asked so many questions that she gave me a needle to make me stop." } },
      choices = {
        { text = "Did it make you stop?", next = "BACK", reply = "Not for a moment. But I can sew now, so she says the bargain was a fair one.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tepa = {
      lines = { { id = "tepa_d", text = "She unpicks everything that is not right, and she does it without one cross word, which is far worse than shouting. But she weaves for Hamuul Runetotem himself, and I would unpick a hundred rows to learn from hands like hers." } },
      choices = {
        { text = "She thinks you'll surpass her one day.", next = "tepa_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tepa_better = {
      lines = { { id = "tepa_better_d", narr = "The needle stops moving for the first time since you sat down.", text = "She said that? To you? She has never said it to me. I shall have to be very quiet for the rest of today, I think, in case she takes it back." } },
      choices = {
        { text = "Earn it, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "camp_d", text = "Oh, a great deal! The ground is hard and the nights are cold, and a tailor is the one who can do something about both. Cloth is what turns a fire in the dirt into somewhere you would want to sit down." } },
      choices = {
        { text = "Then show me the making of it.", next = "BACK" },
      },
    },
    east = {
      lines = { { id = "east_d", text = "Yes, please! Is it true that the Forsaken wear whatever they were buried in, and that goblins sew pockets inside their pockets? Wait, wait, let me finish this seam first, or I shall have to start it again." } },
      choices = {
        { text = "Both are true, more or less.", next = "BACK", reply = "I knew it! Pockets inside pockets. I am going to try that tonight, when Tepa has gone home.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up below in Mulgore and came up the lifts to pester Tepa. She has not sent me back down yet." } },
    camping = { { id = "tp_camp", text = "Kaga Wildhoof teaches the campfire down in Mulgore, and then sends people to the crafters. Speak to her first." } },
    _none = { { id = "tp_none", text = "I do not know! And I dislike not knowing, so if you find out, come back and tell me." } },
  },
}

---------------------------------------------------------------------------
-- Mahu: leatherworking and tailoring supplies, between the two tents.
---------------------------------------------------------------------------
P:NPC {
  key = "mahu", id = TODO_NPC("Mahu"), name = "Mahu", title = "Leatherworking & Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "even", "diplomatic" }, values = { "peace", "craft" },
  notices = { "craft", "race" },
  impression = {
    first = "Mahu sells thread, dye and needles on the middle rise of Thunder Bluff, from a tent pitched between the tailors and the leatherworkers. He serves both, and seems to spend half his day keeping the peace between them.",
    third = "{name} met Mahu, who supplies the tailors and leatherworkers of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. Are you for cloth or for hide? I serve both, and I take neither side." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Tell me the colour, and I will tell you whether there is any left." },
  },
  notice = {
    { id = "n_both", cat = "craft", when = { profession = { "Tailoring", "Leatherworking" } },
      text = "You are a crafter, so I must ask which tent you belong to. I ask only so that I know which of them will come and complain to me about you." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Your people buy black thread, and grey, and nothing else whatever. I keep a great deal of both for the apothecaries on Spirit Rise." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mahu. Tepa's tailors are on one side of me and Una's leatherworkers on the other, and I sell to both, which makes me the best informed tauren on this rise and the most careful." },
        { id = "h_craft", when = { profession = { "Tailoring", "Leatherworking" } }, text = "I am Mahu. Whichever of the two crafts you follow, the other tent will tell you that yours is the lesser, and I advise you to smile and buy your thread." },
      },
      again = {
        { id = "h_again", text = "What else can I find for you?" },
        { id = "h_again2", text = "Ask, friend. I hear everything in this spot, and repeat only half." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Do the two tents truly quarrel?", next = "quarrel" },
        { text = "Tepa says you sell thread and dye.", next = "dye" },
        { text = "Their tools seem to wander between tents.", next = "awls" },
        { text = "Which craft do you favour yourself?", next = "favour" },
        { text = "Why do the Forsaken buy only black?", next = "black", when = { race = "Scourge" } },
        { text = "Peace on your tent, Mahu.", next = "END" },
      },
    },
    quarrel = {
      lines = { { id = "quarrel_d", text = "As kin quarrel, and no worse. The leatherworkers say that hide is the old honest way, and the tailors say that cloth is the future of our people, and both of them come to me for the same needles." } },
      choices = {
        { text = "Who started it?", next = "quarrel_start" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarrel_start = {
      big = true,
      lines = { { id = "quarrel_start_d", text = "Nobody remembers, though both tents would tell you. I have been asked many times to say which craft the bluff needs more, and I have always found that I had a customer to see to." } },
      choices = {
        { text = "Wise. A peacemaker should never pick a side.", next = "BACK", reply = "So I have found. The one in the middle is of use only for as long as both sides trust him.", fx = { align = { honor = -1 } } },
        { text = "You should say what you think, plainly.", next = "BACK", reply = "Perhaps I should. It would be honest, and it would be the last thread either tent ever bought from me.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dye = {
      lines = { { id = "dye_d", text = "Every colour that the plains will give, and a few they will not. Earth reds, bark browns and the yellow of prairie flowers are our own, and the blues come by caravan from goblins, who charge as if they had invented the sky." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    awls = {
      lines = { { id = "awls_d", text = "They wander through my tent, and I see every one of them go by. I could tell you exactly whose awl is on whose bench at this moment, and I never shall, because I sell the replacements." } },
      choices = {
        { text = "A shrewd silence.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    favour = {
      lines = { { id = "favour_d", text = "I wear a hide kilt and a cloth shirt, as you can see, and that is my whole answer. I will add that Vhan is the best company on the rise and that Tarn is the kindest soul, and that says nothing about their crafts." } },
      choices = {
        { text = "Carefully said.", next = "BACK", fx = { affinity = 1 } },
        { text = "And which of the masters do you admire?", next = "favour_masters" },
        { text = "Something else.", next = "BACK" },
      },
    favour_masters = {
      lines = { { id = "favour_masters_d", text = "Tepa and Una both, and I would say it to their faces together. Each of them unpicks a student's work without mercy and then sits up late to show how it should be done, and neither knows how alike they are." } },
      choices = {
        { text = "Perhaps someone should tell them.", next = "BACK", reply = "Not I. I mean to go on selling thread to both of them for many years." },
        { text = "Something else.", next = "BACK" },
      },
    },
    },
    black = {
      lines = { { id = "black_d", text = "I asked one of your apothecaries the same thing, and she said that colour was for those with something to look forward to. I did not know how to answer her, so I sold her the thread and wished her well." } },
      choices = {
        { text = "She spoke for many of us.", next = "BACK", reply = "Then I am sorry for it. If one of you ever asks me for red, I shall count it a good day." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I traded between camps when the tribes still wandered, and learned to be welcome at every fire. It is the same skill here." } },
    advice = { { id = "tp_ad", text = "Buy all the thread for a piece at one time, from one batch. No two dye pots have ever agreed." } },
    veren = { { id = "tp_veren", text = "Veren Tallstrider buys my coarsest thread and tells me that it is too fine. He is the only customer who argues the price upward." } },
    cairne = { { id = "tp_cairne", text = "The High Chieftain keeps the peace among all the tribes, Grimtotem included. Beside that, my two tents are a small matter." } },
    _none = { { id = "tp_none", text = "On that, I have heard nothing from either tent, which is rare. Try Kuruk at the general goods." } },
  },
}

---------------------------------------------------------------------------
-- Teg Dawnstrider: enchanting trainer at Dawnstrider Enchanters.
---------------------------------------------------------------------------
P:NPC {
  key = "teg_dawnstrider", id = TODO_NPC("Teg Dawnstrider"), name = "Teg Dawnstrider", title = "Enchanting Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "grave", "deliberate" }, values = { "spirit", "family" },
  notices = { "craft", "class" },
  impression = {
    first = "Teg Dawnstrider teaches enchanting on the high rise of Thunder Bluff, in a tent hung with rods and faintly glowing dust. He is a grave, deliberate tauren, and he speaks of enchantment as a thing asked for and never taken.",
    third = "{name} met Teg Dawnstrider, the enchanting trainer of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Be welcome at the tent of the Dawnstriders. Touch nothing that glows until I have told you what it is." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Hold out your hands, and I will see what you have been asking of the world." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "You come at An'she's rising, which is the proper hour for this work. Be welcome." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "There is dust under your nails that is not from the road. You have unmade things to learn what was in them, and so we may speak as crafters." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You already know how to ask the elements for their help, shaman. My craft is a smaller asking, made of a smaller spirit, and you will find it familiar." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "Your magic commands, and mine requests. I will teach you gladly, but you may find my way slow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Teg Dawnstrider, and I teach enchanting. My son Mot teaches those who are beginning, and Nata keeps our stores, so you may say that the whole craft on this bluff is one family's fire." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "I am Teg Dawnstrider. You practise the craft, so tell me first what you last unmade, and whether you thanked it. I ask that of every student." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask. A question honestly put is the beginning of this craft." },
        { id = "h_again3", text = "Speak, and I will consider it." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "Enchanting seems an odd craft for a tauren.", next = "odd" },
        { text = "You say an enchantment is asked for.", next = "asked" },
        { text = "Tell me about your family.", next = "family" },
        { text = "Where does a Dawnstrider get the name?", next = "name" },
        { text = "What should an enchanter study next?", next = "next", when = { profession = "Enchanting" } },
        { text = "May the eternal sun shine on you, Teg.", next = "END" },
      },
    },
    odd = {
      lines = { { id = "odd_d", text = "It seems so only to those who think of it as wizardry. Our shamans have always known that a spirit sleeps in each made thing, in the spear and the drum and the totem, and enchanting is only the craft of waking it." } },
      choices = {
        { text = "Did the tauren enchant before the Horde came?", next = "odd_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd_before = {
      lines = { { id = "odd_before_d", text = "We blessed our weapons and painted our totems, and some of those blessings held. The rods and the dusts and the written formulas came to us with our allies, and I took what was useful and kept the reverence that was already ours." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    asked = {
      lines = { { id = "asked_d", text = "It is. To enchant a blade, I must first unmake some other thing that held power, and take what is left of it. That is a small death, and I will not teach a student who cannot see that it is one." } },
      choices = {
        { text = "What do you ask of your students, then?", next = "asked_students" },
        { text = "Something else.", next = "BACK" },
      },
    },
    asked_students = {
      big = true,
      lines = { { id = "asked_students_d", text = "That they unmake nothing idly, and nothing that somebody still has need of. A sword that could arm a young warrior is worth more whole than as a pinch of dust, however brightly the dust may shine." } },
      choices = {
        { text = "I'll unmake only what has no better use.", next = "BACK", reply = "Then you have understood the first lesson, and the last. Everything between them is only practice.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. Dust serves me better than charity.", next = "BACK", reply = "I will still teach you, for that is my duty to the Horde. I will also hope that the craft itself teaches you better than I can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "family_d", text = "Mot is my son, and he has more of the gift than I do and less of the patience, as is right at his age. Nata is of our tribe, and she knows the worth of every shard in the tent. I am proud of them both and tell them so seldom." } },
      choices = {
        { text = "You should tell them more often.", next = "BACK", reply = "You are not the first to say so. I shall think on it, as I think on most things, for too long.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "name_d", text = "From walking toward An'she as he rises. It is told that the first of us would set out before every dawn to greet the sun from the highest ground, and that the light took a liking to the family, so that some of it stays in our hands." } },
      choices = {
        { text = "A good tale for an enchanter's family.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    next = {
      lines = { { id = "next_d", text = "Study what each dust and essence was before it was dust. When you know what a thing has been, you will know what it wishes to become, and your enchantments will hold where another's fade." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    spirits = { { id = "tp_spirit", text = "Every made thing holds a little of its maker and its use. I only coax that out where it can be seen." } },
    background = { { id = "tp_bg", text = "I was raised to be a shaman and had not the calling for the great spirits. The small ones in made things would speak to me, and that became my craft." } },
    advice = { { id = "tp_ad", text = "Before you unmake a thing, ask whether anyone near you could use it whole. You will be a better enchanter and a better neighbour." } },
    _none = { { id = "tp_none", text = "That lies outside my craft, and I do not guess. The elders on Elder Rise may answer you." } },
  },
}

---------------------------------------------------------------------------
-- Mot Dawnstrider: Teg's son, apprentice enchanter. Forever: Camping 101: Enchanting.
---------------------------------------------------------------------------
P:NPC {
  key = "mot_dawnstrider", id = TODO_NPC("Mot Dawnstrider"), name = "Mot Dawnstrider", title = "Apprentice Enchanter",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "bright", "impatient" }, values = { "curiosity", "family" },
  notices = { "craft", "class" },
  impression = {
    first = "Mot Dawnstrider is the son of the enchanting trainer of Thunder Bluff, and teaches the beginners in his father's tent. He is quick and gifted and a little impatient with how slowly his father does everything.",
    third = "{name} met Mot Dawnstrider, the apprentice enchanter of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome! Are you here to learn? Good, because I have something new to show, and my father has seen it already." },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Tell me you have found something strange for me to take apart." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You enchant! I can feel it on your gloves. Whose work is that? No, let me guess from the way it hums." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Is it true that your kind can do with one word what takes me a rod and a morning? My father says I should not ask that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mot Dawnstrider, and I teach the first steps of enchanting. My father Teg teaches the rest, slowly, with a great many pauses for thought." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Enchanting") }, text = "Kaga Wildhoof sent you up from Mulgore, yes? Show me what you know of the craft, and I will show you what an enchanter can make for a camp." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Enchanting") }, text = "Is your camp glowing nicely? Only raise it in the wild, mind, for the bluffwatchers take a dim view of strange lights in town." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, I have something heating." },
        { id = "h_again2", text = "Yes, go on!" },
        { id = "h_again3", text = "Another question? Good, I like those." },
      },
      choices = {
        { text = "Teach me what you can of enchanting.", next = "BUSINESS" },
        { text = "You find your father slow.", next = "father" },
        { text = "What have you got heating?", next = "new" },
        { text = "What was the first thing you enchanted?", next = "first" },
        { text = "What does an enchanter add to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Enchanting") } },
        { text = "I can tell you how a mage does it.", next = "mage", when = { class = "MAGE" } },
        { text = "Don't burn the tent down, Mot.", next = "END" },
      },
    },
    father = {
      lines = { { id = "father_d", text = "He thanks every sword before he unmakes it, and I mean aloud, and at length. I love him, and he is the best on the bluff, but I could have enchanted three bracers in the time it takes him to apologise to one." } },
      choices = {
        { text = "Does the thanking change the result?", next = "father_result" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_result = {
      big = true,
      lines = { { id = "father_result_d", narr = "He glances across the tent at his father's back, and scratches the base of one horn.", text = "That is the vexing part. His enchantments last longer than mine do, and I have measured it. I cannot find the reason in the formula, and he only says that I am looking in the wrong place." } },
      choices = {
        { text = "Then he's right. Slow down and thank the sword.", next = "BACK", reply = "You sound exactly like him. I may try it once, when nobody is watching me.", fx = { align = { order = 1 } } },
        { text = "Keep measuring. You'll find your own answer.", next = "BACK", reply = "That is what I think! There is a reason, and reasons can be found. Do not tell him that I said so.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    new = {
      lines = { { id = "new_d", text = "A copper rod that I am trying to wake without the usual shard, using only what is left over from other work. It has cracked twice, and Nata says I may not have a third rod until I have paid for the first two." } },
      choices = {
        { text = "What happens if it works?", next = "BACK", reply = "Then we waste less, and my father will have to say 'good' out loud. I am not certain which I want more." },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "first_d", text = "My own hoof wraps, when I was very small, with dust I had taken from my father's bench without asking. They glowed for a whole night, and I could not sleep for it, and he made me sweep the tent for a season." } },
      choices = {
        { text = "Was it worth the sweeping?", next = "BACK", reply = "Every day of it. I still have one of the wraps, and it has not quite gone dark.", fx = { affinity = 1 } },
        { text = "What did your father say when he found out?", next = "first_father" },
        { text = "Something else.", next = "BACK" },
      },
    first_father = {
      lines = { { id = "first_father_d", text = "He said that taking without asking was the one sin in our craft. Then, when he thought I was asleep, he came and looked at the wraps for a long time, and I heard him laugh under his breath." } },
      choices = {
        { text = "He was proud of you.", next = "BACK", reply = "I think he was. He would sooner be unmade himself than say it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    },
    camp = {
      lines = { { id = "camp_d", text = "Light and warmth that need no wood, to begin with. A fire tells every beast for a league where you are sleeping, and an enchanter can give a camp a gentler glow that keeps its own counsel." } },
      choices = {
        { text = "Show me how it's made.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "mage_d", text = "Tell me! Do you truly only say the word and shape it in your head? Then where does the power come from, if nothing is unmade? Wait, my father is looking over. Tell me quietly." } },
      choices = {
        { text = "It's drawn from elsewhere, and it has a cost.", next = "BACK", reply = "So there is always a cost, then. He will be unbearable when I tell him that.", fx = { trait = { honest = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up under my father's bench, breathing the dust. I do not think I was ever going to be anything else." } },
    camping = { { id = "tp_camp", text = "Kaga Wildhoof in Mulgore teaches camping first, and sends folk on to each craft. You will want her before me." } },
    _none = { { id = "tp_none", text = "I do not know that, and it bothers me. Ask my father, and bring something to sit on while he answers." } },
  },
}

---------------------------------------------------------------------------
-- Nata Dawnstrider: enchanting supplies at Dawnstrider Enchanters.
---------------------------------------------------------------------------
P:NPC {
  key = "nata_dawnstrider", id = TODO_NPC("Nata Dawnstrider"), name = "Nata Dawnstrider", title = "Enchanting Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "shrewd", "warm" }, values = { "family", "thrift" },
  notices = { "craft", "race" },
  impression = {
    first = "Nata Dawnstrider keeps the stores at the enchanters' tent in Thunder Bluff, and sells rods, vials and dust. She is shrewd and warm together, and it is plain that she is the one who keeps two dreamers fed.",
    third = "{name} met Nata Dawnstrider, who sells enchanting supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. If you want teaching, Teg and Mot are behind me, and if you want something that actually exists, you want me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good. You pay on time, which is more than I can say for my own kin." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You are an enchanter, so you are short of dust. I have never met one who was not." },
    { id = "n_goblin", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "You will have seen the enchanters of Orgrimmar. Ours are fewer and slower, and I would put our work beside theirs on any day." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Nata Dawnstrider. Teg teaches and Mot experiments, and I count the rods, which is how the tent has stayed standing." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "I am Nata Dawnstrider. You know the craft, so I will not explain to you why a good rod matters, only tell you that Mot has broken two of mine this moon." },
      },
      again = {
        { id = "h_again", text = "What else do you need?" },
        { id = "h_again2", text = "Ask, friend. I have a moment while they argue." },
      },
      choices = {
        { text = "Show me your enchanting supplies.", next = "BUSINESS" },
        { text = "You keep the two of them fed, I think.", next = "fed" },
        { text = "Mot owes you for some rods.", next = "rods" },
        { text = "Where do the dusts and shards come from?", next = "dust" },
        { text = "Is there a living in enchanting, here?", next = "living" },
        { text = "What sells best to enchanters?", next = "sells", when = { profession = "Enchanting" } },
        { text = "Good trading, Nata.", next = "END" },
      },
    },
    fed = {
      lines = { { id = "fed_d", text = "Somebody must. Teg would give lessons for nothing to any calf with a serious face, and Mot would turn the supper pot into dust to see what was in it. I love them dearly, and I hide the coin." } },
      choices = {
        { text = "Where do you hide it?", next = "BACK", reply = "In the one place neither of them ever looks, which is the ledger.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rods = {
      lines = { { id = "rods_d", text = "He does, and he will pay, for he is honest. He is trying to wake a rod without a shard, which his father says cannot be done and which I privately think he may manage." } },
      choices = {
        { text = "You believe in him.", next = "rods_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rods_believe = {
      lines = { { id = "rods_believe_d", text = "I do, and so does Teg, though he would sooner swallow a shard than say so. That boy will carry the craft further than either of us, if he does not set fire to himself first." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dust = {
      lines = { { id = "dust_d", text = "From things unmade, and I buy from any adventurer who brings them honestly. Much of it comes up from the Barrens and Stonetalon in small pouches, and I weigh every one, because dust is easily cut with sand." } },
      choices = {
        { text = "Do people try to cheat you?", next = "dust_cheat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dust_cheat = {
      big = true,
      lines = { { id = "dust_cheat_d", text = "A goblin tried last season, with a pouch that was half river sand. I held it up to the light where he could see me do it, and then I told every trader on the lifts his name." } },
      choices = {
        { text = "Good. A cheat should be known as one.", next = "BACK", reply = "So I think. He trades in Ratchet now, I hear, and weighs honestly, because word travelled ahead of him.", fx = { align = { honor = 1 } } },
        { text = "Harsh. You could have just refused the pouch.", next = "BACK", reply = "And let him sell it to someone less careful? No, friend, I sleep well enough on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "living_d", text = "There is a thin one. Our own people are slow to pay for a thing they cannot see, so most of our trade is with orcs and trolls passing through. It grows a little each season, as more of the young come home with enchanted blades." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = { { id = "sells_d", text = "Strange dust, always, and the lesser essences after it. If you have more than you need, the auctioneers on the lower rise will get you a better price than I can afford to give, and I say that as a friend and a poor merchant." } },
      choices = {
        { text = "Honest of you to say so.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Dawnstrider, and the family has the gift. Mine turned out to be for sums, which the family needed more." } },
    advice = { { id = "tp_ad", text = "Weigh what you buy and weigh what you sell. Trust is a fine thing, and scales are finer." } },
    teg = { { id = "tp_teg", text = "Teg is the best enchanter our people have, and the worst at asking to be paid. That is why he has me." } },
    goblins = { { id = "tp_goblins", text = "I trade with goblins every moon, and I like them better than I trust them. They respect anyone who checks their sums." } },
    _none = { { id = "tp_none", text = "I cannot say, friend. Ask Teg, if you have the afternoon free." } },
  },
}

---------------------------------------------------------------------------
-- Kray: apprentice alchemist at Bena's Alchemy. Forever: Camping 101: Alchemy.
---------------------------------------------------------------------------
P:NPC {
  key = "kray", id = TODO_NPC("Kray"), name = "Kray", title = "Apprentice Alchemist",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "careful", "earnest" }, values = { "craft", "healing" },
  notices = { "craft", "class" },
  impression = {
    first = "Kray is the apprentice at the alchemists' tent on the middle rise of Thunder Bluff, and teaches beginners their first potions. He is careful to the point of worry, and he labelled a vial twice while I watched.",
    third = "{name} met Kray, the apprentice alchemist of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. Please stand a little to the left, for that flask is at a delicate stage and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it is you again, and I am glad. Did the last draught sit well? I worried about it afterward." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Your fingertips are stained three colours, so you brew. Tell me that you label your vials, please, for my own peace of mind." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You gather herbs. Komin Winterhoof will have taught you to thank them, and I would only add that you should also write down where they grew." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kray, and I teach the simple draughts while Bena Winterhoof teaches the difficult ones. A healing potion is the first thing I show anyone, because it is the one they will need soonest." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Alchemy") }, text = "Kaga Wildhoof sent you, I think, for you smell of woodsmoke. Show me that you can brew a little, and I will show you what an alchemist can make for a camp." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Alchemy") }, text = "How is your camp? I hope nothing has boiled over. Remember that it is for the wild, and not for the middle of the rise." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I am watching the flask, but I can hear you." },
        { id = "h_again2", text = "Ask, please. Only do not lean on the bench." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Teach me what you can of alchemy.", next = "BUSINESS" },
        { text = "You seem a worrier, Kray.", next = "worry" },
        { text = "What is it like to learn from Bena?", next = "bena" },
        { text = "What goes wrong for a new alchemist?", next = "wrong" },
        { text = "What can an alchemist bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Alchemy") } },
        { text = "Do you sell to the apothecaries on Spirit Rise?", next = "apoth", when = { race = "Scourge" } },
        { text = "Steady hands to you, Kray.", next = "END" },
      },
    },
    worry = {
      lines = { { id = "worry_d", text = "I am, and in this craft I count it a virtue. A smith's mistake is a bent blade, but mine is drunk by somebody who trusted me, so I measure everything twice and then lie awake over the third time." } },
      choices = {
        { text = "Has one of yours ever gone wrong?", next = "worry_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry_wrong = {
      big = true,
      lines = { { id = "worry_wrong_d", text = "Once, early on. I gave a hunter a draught for swiftness that had steeped too long, and he ran halfway to Camp Narache before he could stop. He laughed about it afterward, and I have never laughed about it at all." } },
      choices = {
        { text = "Keep worrying. Care like that saves lives.", next = "BACK", reply = "Thank you. Most people tell me to stop, and I never know how to explain that I must not.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nobody was hurt. You must learn to let it go.", next = "BACK", reply = "Bena says the same, and she is wiser than I am. I am trying, a little at a time.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bena = {
      lines = { { id = "bena_d", text = "She can tell what is in a flask by the smell alone, and she lets me make my mistakes when they are small ones. Mani keeps us in vials, and has never once complained of how many I break by washing them too hard." } },
      choices = {
        { text = "What small mistakes has she let you make?", next = "bena_mistakes" },
        { text = "Something else.", next = "BACK" },
      },
    bena_mistakes = {
      lines = { { id = "bena_mistakes_d", text = "She once watched me put twice the briarthorn into a draught and said nothing whatever. It set like river clay, and I spent the evening chipping it out of the flask, and I have never misread that measure since." } },
      choices = {
        { text = "A lesson that sticks.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    },
    wrong = {
      lines = { { id = "wrong_d", text = "They hurry the heat. Peacebloom and silverleaf want a slow fire and a covered pot, and a beginner will boil them hard and then wonder why the potion tastes of grass and does nothing whatever." } },
      choices = {
        { text = "A slow fire and a covered pot.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "camp_d", text = "A proper place to brew, which is worth more than it sounds. Potions made in a hurry by the roadside are where most of the accidents come from, and a camp gives an alchemist level ground and a steady flame." } },
      choices = {
        { text = "Then show me how to set it up.", next = "BACK" },
      },
    },
    apoth = {
      lines = { { id = "apoth_d", text = "Your apothecaries make their own, and they have been courteous enough to look at mine and say nothing. Apothecary Zamah did once tell me that my labels were admirable, and I have decided to take that kindly." } },
      choices = {
        { text = "From Zamah, that is high praise.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried water for the healers as a calf and wanted to do more than carry. Bena took me on, and I have tried to deserve it." } },
    camping = { { id = "tp_camp", text = "Kaga Wildhoof teaches the fire, down in Mulgore, and then each craft adds its part. She is where to begin." } },
    _none = { { id = "tp_none", text = "I am not sure, and I would not like to tell you wrong. Bena may know." } },
  },
}

---------------------------------------------------------------------------
-- Mani Winterhoof: alchemy supplies at Bena's Alchemy.
---------------------------------------------------------------------------
P:NPC {
  key = "mani_winterhoof", id = TODO_NPC("Mani Winterhoof"), name = "Mani Winterhoof", title = "Alchemy Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "unflappable", "kind" }, values = { "family", "healing" },
  notices = { "craft", "race" },
  impression = {
    first = "Mani Winterhoof sells vials and alchemy supplies on the middle rise of Thunder Bluff, beside the alchemy trainer. Nothing seems to fluster her, including the small bang from the bench behind her as we spoke.",
    third = "{name} met Mani Winterhoof, who sells alchemy supplies in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. Pay no mind to the smoke, for it is the blue kind, and the blue kind is harmless." },
    { id = "g_back", when = { metBefore = true }, text = "Back for vials? Of course you are. Nobody ever comes back for anything else." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist. I can tell by the way you did not flinch at that noise just now." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Your apothecaries buy my vials by the crate and never return an empty one. I have stopped wondering where they go." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Mani Winterhoof. Bena brews and teaches, Kray worries, and I sell the vials and see that the tent does not burn. We Winterhoofs have always been the tribe's healers, and healers need bottles." },
        { id = "h_alch", when = { profession = "Alchemy" }, text = "I am Mani Winterhoof. You brew, so I will say only this, that you should buy twice the vials you think you want, for the first batch always makes more than you planned." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Ask on. That bubbling is nothing to concern us." },
      },
      choices = {
        { text = "Show me your alchemy supplies.", next = "BUSINESS" },
        { text = "Nothing seems to startle you.", next = "calm" },
        { text = "The Winterhoofs seem to run this rise.", next = "tribe" },
        { text = "Where do you get vials on a mountaintop?", next = "vials" },
        { text = "Kray worries a great deal.", next = "kray" },
        { text = "Which potions should I always carry?", next = "carry", when = { minLevel = 10 } },
        { text = "Good health to you, Mani.", next = "END" },
      },
    },
    calm = {
      lines = { { id = "calm_d", text = "I have stood beside an alchemist's bench for most of my life, friend. One learns the colours of the smoke, and after that there is nothing left to be startled by except the green, and we have not had the green in years." } },
      choices = {
        { text = "What does the green mean?", next = "calm_green" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calm_green = {
      lines = { { id = "calm_green_d", text = "It means that everyone walks briskly to the far side of the rise and stays there until Bena says otherwise. The tent was a different shape before the last time, and I liked the old shape better." } },
      choices = {
        { text = "I'll watch for green, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe = {
      lines = { { id = "tribe_d", text = "The healing part of it, yes. Komin teaches the herbs and Nida sorts them, Bena brews them and I bottle them, and old Tah carves the totems across the way. Put an ailing tauren in at one end of the family, and a well one walks out of the other." } },
      choices = {
        { text = "Has it always been your tribe's work?", next = "tribe_always" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe_always = {
      lines = { { id = "tribe_always_d", text = "For as long as the stories go back. When the tribes wandered, it was a Winterhoof who walked at the rear of the column with the herb bundles, picking up those who fell behind. We are still at the rear, in a way, and content to be." } },
      choices = {
        { text = "The rear guard matters as much as the front.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vials = {
      lines = { { id = "vials_d", text = "They come from Orgrimmar and Ratchet, packed in straw on a kodo's back, and one in every ten arrives as splinters. Our people never made glass, having no use for a thing that breaks when the camp moves." } },
      choices = {
        { text = "What held your potions before glass?", next = "BACK", reply = "Gourds, horn and stoppered bone. They kept a draught well enough, though you could never see how much was left until it was gone." },
        { text = "Something else.", next = "BACK" },
      },
    },
    kray = {
      big = true,
      lines = { { id = "kray_d", text = "He does, and I would not change him. An alchemist who is not a little afraid of his own work has no business handing it to the sick, though I do wish he would sleep." } },
      choices = {
        { text = "Fear keeps a healer honest.", next = "BACK", reply = "So Bena says. She was the same at his age, and she has made no more than two mistakes that I know of.", fx = { align = { order = 1 } } },
        { text = "He should trust his hands and take more chances.", next = "BACK", reply = "In time, perhaps. For now I would sooner he took them with something other than medicine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = { { id = "carry_d", text = "A healing draught where your hand will find it without your eyes, and a second one where it will not, for the day the first is gone. Everything else is a comfort, friend, but those two are the difference." } },
      choices = {
        { text = "One to find, and one to forget.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Winterhoof, so I was sorting herbs before I could count them. I came to the bottles because someone had to." } },
    forsaken = { { id = "tp_fors", text = "The Forsaken apothecaries are good customers and poor talkers. I sell them glass, and what goes into it is between them and the Earth Mother." } },
    advice = { { id = "tp_advice", text = "Never put a new draught into an old vial without scalding it first. What was in it before has opinions." } },
    cairne = { { id = "tp_cairne", text = "When the High Chieftain's joints trouble him in the cold, it is a Winterhoof salve that he sends for. We do not speak of it outside the tent." } },
    _none = { { id = "tp_none", text = "I cannot tell you that, friend, and I shall not lose sleep over it. Ask Bena when the smoke clears." } },
  },
}

---------------------------------------------------------------------------
-- Second gap pass: visitors to the bluff (Birgitte Cranston at the Pools of Vision, and the
-- battlemasters Kergul Bloodaxe and Martin Lindsey on Hunter Rise).
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Birgitte Cranston: Forsaken portal trainer in the Pools of Vision.
---------------------------------------------------------------------------
P:NPC {
  key = "birgitte", id = TODO_NPC("Birgitte Cranston"), name = "Birgitte Cranston", title = "Portal Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "dry", "exact" }, values = { "knowledge", "order" },
  notices = { "class", "race" },
  impression = {
    first = "Birgitte Cranston teaches the magic of portals in the Pools of Vision beneath Spirit Rise in Thunder Bluff. She is Forsaken, exact and dry, and she seems faintly amused to be practising her art in a cave under a city of tauren.",
    third = "{name} met Birgitte Cranston, the portal trainer in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the pool, if you please. It is damp enough down here without visitors falling in." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You arrived on foot, I notice, which tells me how your studies are going." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and one who took the lifts like everybody else. We shall have to do something about that." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of our hosts. Your people have been patient with us, and I am aware that we are not easy guests." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Another of the Dark Lady's own, this far from Tirisfal. The air here is offensively fresh, is it not?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Birgitte Cranston, and I teach mages to step from one city to another without the tedium of the road between. If you are not a mage, I can offer you only conversation, and I ration that." },
        { id = "h_mage", when = { class = "MAGE" }, text = "I am Birgitte Cranston. You have the training, so I can teach you to open a way to this bluff from anywhere, provided that you can hold a place exactly in your mind." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "I am Birgitte Cranston, late of Lordaeron, as you are. We keep to the Pools because the tauren find us easier to bear in the dark, and I cannot say that I blame them." },
      },
      again = {
        { id = "h_again", text = "Was there something further?" },
        { id = "h_again2", text = "Go on. I have a great deal of time, as you may imagine." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Teach me the way to Thunder Bluff.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "How does a portal work?", next = "portal" },
        { text = "A Forsaken mage in a tauren cave is a strange sight.", next = "cave" },
        { text = "Who else keeps to the Pools?", next = "pools" },
        { text = "What do the tauren make of arcane magic?", next = "tauren" },
        { text = "What is the hardest part of teleporting?", next = "hard", when = { class = "MAGE" } },
        { text = "Do you miss Lordaeron?", next = "home", when = { race = "Scourge" } },
        { text = "I'll leave you to the damp.", next = "END" },
      },
    },
    portal = {
      lines = { { id = "portal_d", text = "One persuades two places that they are the same place for a moment, and then one steps through before they notice the mistake. It needs a rune to anchor it and a mind that knows the far end precisely, down to the smell." } },
      choices = {
        { text = "And if the mind is imprecise?", next = "portal_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    portal_wrong = {
      lines = { { id = "portal_wrong_d", text = "Then one arrives somewhere near the place, which on a bluff this high is a serious matter. I teach the lodge at the top of Spirit Rise as the anchor, and I insist that my students learn it with their eyes shut." } },
      choices = {
        { text = "Has a student ever missed?", next = "BACK", reply = "One of them arrived in the pond on the high rise. The tauren were very kind about it, and the fishing vendor has not forgiven me." },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave = {
      lines = { { id = "cave_d", text = "It is, and I am well aware of it. Their Arch Druid spoke for us when the Horde debated whether to take us in, and so a few of us are posted here, as a courtesy and I suspect as a reminder." } },
      choices = {
        { text = "A reminder of what?", next = "cave_remind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave_remind = {
      big = true,
      lines = { { id = "cave_remind_d", text = "That we are allies because somebody vouched for us, and that the vouching can be withdrawn. The tauren hope to see us cured of our condition one day. Most of my people find that insulting, and I have not made up my mind." } },
      choices = {
        { text = "They mean it kindly. Let them hope.", next = "BACK", reply = "I believe that they do. It is a long while since anyone meant anything kindly toward us, and one forgets how to receive it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You owe them nothing. Undeath needs no cure.", next = "BACK", reply = "That is the Undercity's answer, and it is spoken there with more certainty than I can manage in this cave.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pools = {
      lines = { { id = "pools_d", text = "Archmage Shymm, Thurston Xane and Ursyn Ghull teach the rest of the mage's art beside me. Our priests keep to the far wall, Clarice Foster among them, and Apothecary Zamah has the back of the cave and all of the worst smells." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "tauren_d", text = "They regard it as one regards a guest's ill-mannered dog, with courtesy and from a distance. Their shamans ask the world for favours, and we take without asking, and they are too polite to tell us which they think the better way." } },
      choices = {
        { text = "Which do you think is better?", next = "BACK", reply = "Ours is quicker, and theirs has never yet blown up a city. I leave the judgment to you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      lines = { { id = "hard_d", text = "Trusting it. The spell asks you to believe entirely that you are already somewhere else, and the living mind clings to where it stands. I find it easier now than I once did, being less attached to places in general." } },
      choices = {
        { text = "A grim advantage.", next = "BACK", reply = "I have learned to collect those. One has so few of the other kind.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "home_d", text = "I miss the libraries of the capital, and I do not think about the rest. What stands there now is the Dark Lady's city, and it is ours, and I would open a way to it from here with my eyes shut." } },
      choices = {
        { text = "So would I.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied the arcane in Lordaeron while it stood, and I died there with everyone else. The Dark Lady's will freed me, and the Horde found a use for what I knew." } },
    hamuul = { { id = "tp_ham", text = "Arch Druid Runetotem argued for our place in the Horde. I have never spoken to him, and I should not know how to thank someone for that." } },
    _none = { { id = "tp_none", text = "That is not my field, and I do not speculate. Ask one of the archmagi, who are paid to." } },
  },
}

---------------------------------------------------------------------------
-- Kergul Bloodaxe: Warsong Gulch battlemaster on Hunter Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "kergul", id = TODO_NPC("Kergul Bloodaxe"), name = "Kergul Bloodaxe", title = "Warsong Gulch Battlemaster",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "thunder_bluff" }, temper = { "fierce", "direct" }, values = { "honor", "horde" },
  notices = { "pvp", "race" },
  impression = {
    first = "Kergul Bloodaxe musters fighters on Hunter Rise in Thunder Bluff for the Warsong clan's battle in Ashenvale. He is an orc among tauren, blunt and fierce, and he measured me as a recruit before I had opened my mouth.",
    third = "{name} met Kergul Bloodaxe, who musters for Warsong Gulch in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Throm-ka, {class}. The Warsong need fighters in Ashenvale, and you look as though you can run." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Did you carry the elves' flag home, or did you only watch someone else do it?" },
  },
  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 3 },
      text = "You have earned rank in the Horde's battles, {rank}, and it shows in the way you stand. The Outriders will be glad of you." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc on the bluff! It is good to hear our tongue up here, where everything is said slowly and gently." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Your people fight like an avalanche once they are moving. I am here to get more of you moving." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kergul Bloodaxe, and I speak for the Warsong Outriders. The night elves want to drive our clan out of the forest we cut to build Orgrimmar, and we will not be driven." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Kergul Bloodaxe. You know what the Warsong gave at Hyjal, and what Grom gave before that. The clan asks now for a few hours of your axe, and it has earned them." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Kergul Bloodaxe. The lodges you stand in are braced with Warsong timber, tauren, and elves are killing the orcs who cut it. I ask you to remember that." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, for the gulch does not wait." },
        { id = "h_again2", text = "Speak, {class}." },
      },
      choices = {
        { text = "I want to fight in Warsong Gulch.", next = "BUSINESS" },
        { text = "What is the fight about?", next = "fight" },
        { text = "An orc must find Thunder Bluff quiet.", next = "bluff" },
        { text = "How is the battle won?", next = "won" },
        { text = "Who else musters on this rise?", next = "rise" },
        { text = "The tauren don't like the logging, do they?", next = "logging", when = { race = "Tauren" } },
        { text = "Lok'tar, Kergul.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "fight_d", text = "It is about lumber, and then it is about pride. The Horde needs wood for its walls and its siege engines, and Ashenvale has more than the elves could use in ten thousand years. Their Silverwing Sentinels would sooner we starved than felled one tree." } },
      choices = {
        { text = "The elves say the forest is sacred.", next = "fight_sacred" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight_sacred = {
      big = true,
      lines = { { id = "fight_sacred_d", text = "They say so, and they said nothing when Grom's axes helped save their world tree from the Legion. We bled for that forest, and I say that blood gives a claim to it." } },
      choices = {
        { text = "The Horde bled there. The claim is earned.", next = "BACK", reply = "Then you understand. Bring that to the gulch and the clan will know you as one of its own.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Take the wood. Who has the claim hardly matters.", next = "BACK", reply = "Hm. You will fight well enough, I expect, but do not say that in front of the Outriders. It matters to them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bluff = {
      lines = { { id = "bluff_d", text = "It is quiet, and it is high, and the food has no pepper in it. But these are the warriors who stood with us against the centaur and at Hyjal, and I would sooner recruit here than in a hall full of orcs who only talk about fighting." } },
      choices = {
        { text = "The tauren have earned your respect.", next = "BACK", reply = "They earned it before I was grown. A tauren does not boast and does not run, and I can use a hundred of those." },
        { text = "Something else.", next = "BACK" },
      },
    },
    won = {
      lines = { { id = "won_d", text = "You take their banner out of their hold and carry it to ours, while keeping our own at home, and you do that three times. It sounds like a game for whelps until you are halfway across the field with ten elves behind you." } },
      choices = {
        { text = "What wins it most often?", next = "won_most" },
        { text = "Something else.", next = "BACK" },
      },
    },
    won_most = {
      lines = { { id = "won_most_d", text = "Staying together. The fastest runner in the Horde will die alone in the middle of the field, and I have seen slow, stubborn groups walk the flag home through everything the Sentinels had. Guard your carrier before you chase glory." } },
      choices = {
        { text = "Guard the carrier. Understood.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rise = {
      lines = { { id = "rise_d", text = "Taim Ragetotem calls fighters to Alterac for the Frostwolves, and the dead man, Martin Lindsey, recruits for the Defilers in Arathi. We share the rise and compete for the same warriors, and Taim gets most of the tauren, since he is one." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    logging = {
      lines = { { id = "logging_d", text = "Some do not, and their druids have told me so to my face, which I respect. I tell them that the Warsong plant nothing and I cannot pretend otherwise, but that Orgrimmar's walls shelter tauren as well." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    grom = { { id = "tp_grom", text = "Grom Hellscream died freeing our people from the demon's blood. Every Warsong fights in his name, and so do I." } },
    background = { { id = "tp_bg", text = "I was at Hyjal with the Warsong. The clan sent me here afterward, because I get on with tauren and because I am loud enough for the work." } },
    _none = { { id = "tp_none", text = "I know war and lumber, {class}. Ask someone else about that." } },
  },
}

---------------------------------------------------------------------------
-- Martin Lindsey: Arathi Basin battlemaster on Hunter Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "martin_lindsey", id = TODO_NPC("Martin Lindsey"), name = "Martin Lindsey", title = "Arathi Basin Battlemaster",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cold", "sardonic" }, values = { "forsaken", "victory" },
  notices = { "pvp", "race" },
  impression = {
    first = "Martin Lindsey recruits on Hunter Rise in Thunder Bluff for the Forsaken's fight in the Arathi Highlands. He is a dead man standing in bright sunlight among tauren hunters, and he seems to dislike all of it except the prospect of killing humans.",
    third = "{name} met Martin Lindsey, who musters for Arathi Basin in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "You have the look of someone who wants to hit the Alliance. How fortunate, for I have a basin full of them." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? The Defilers will be pleased, in so far as they are pleased by anything." },
  },
  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 3 },
      text = "You carry rank, {rank}. Good. I am weary of explaining to recruits which end of the flag to hold." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of our own, in all this sunshine. You have my sympathy, and you will have a place in the basin whenever you want it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people keep offering me water and shade, as if I were in a condition to need either." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Martin Lindsey, and I recruit for the Defilers. The humans of the League of Arathor would like to have their highlands back, and the Dark Lady would prefer that they did not." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "I am Martin Lindsey. You need no speech from me, since you know what the living did to us when we came home. The basin is where we return the favour, a farm and a mine at a time." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Martin Lindsey. I am told your people fight for the land itself, so think of Arathi as land that a human king means to fence. That generally persuades a tauren." },
      },
      again = {
        { id = "h_again", text = "Was there something else, or shall we get on?" },
        { id = "h_again2", text = "Ask. I am not growing any older." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "I want to fight in Arathi Basin.", next = "BUSINESS" },
        { text = "What is worth fighting over in Arathi?", next = "worth" },
        { text = "You don't seem to enjoy Thunder Bluff.", next = "bluff" },
        { text = "How is the basin won?", next = "won" },
        { text = "Who are the League of Arathor?", next = "league" },
        { text = "What did the living do to you?", next = "living", when = { race = "Scourge" } },
        { text = "I'll take my leave.", next = "END" },
      },
    },
    worth = {
      lines = { { id = "worth_d", text = "There is a farm, a mine, a lumber mill, a smithy and a stable, and whoever holds the most of them feeds an army. The Undercity has many mouths that do not eat and many forges that do, so we want the mine and the smithy rather badly." } },
      choices = {
        { text = "And the land itself?", next = "worth_land" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worth_land = {
      big = true,
      lines = { { id = "worth_land_d", text = "The land was the kingdom of Stromgarde, and it has been dying since the Second War. The humans think that entitles them to it for ever. I was a subject of Lordaeron, and I learned what a human kingdom's protection is worth." } },
      choices = {
        { text = "Their time is over. The land goes to the strong.", next = "BACK", reply = "Quite so. You would do well in the Undercity, where that passes for philosophy.", fx = { align = { honor = -1 } } },
        { text = "I fight for the Horde, not for your grudge.", next = "BACK", reply = "Fight for whatever you please, so long as you hold the smithy. My grudge will manage on its own.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bluff = {
      lines = { { id = "bluff_d", text = "It is bright, it is windy, and everybody wishes me well. A tauren hunter asked this morning whether I was comfortable. I have been dead for some years, and nobody in the Undercity has ever asked me that." } },
      choices = {
        { text = "It bothers you that they're kind.", next = "bluff_kind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bluff_kind = {
      lines = { { id = "bluff_kind_d", narr = "He looks out across the rise at the hunters stringing their bows, and is quiet for a moment.", text = "It bothers me that I had forgotten what it was like. That is all I intend to say about it, and I will thank you not to mention it to Bloodaxe, who would laugh." } },
      choices = {
        { text = "Not a word.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    won = {
      lines = { { id = "won_d", text = "By holding three of the five places and not being greedy for a fourth. Every fool rushes to take ground, and nobody wishes to stand at the farm and guard it, which is why the farm is lost twice an hour." } },
      choices = {
        { text = "I'll stand guard where it's needed.", next = "BACK", reply = "Then you are worth five of the usual sort. I may even learn your name.", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    league = {
      lines = { { id = "league_d", text = "They are what is left of Stromgarde's pride, camped at Refuge Pointe with a banner and a long memory. They fight well, I will grant them, as people do who have nowhere else to go, and we know something about that ourselves." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "living_d", text = "I walked back to my own village after the Dark Lady freed us, and my neighbours met me on the road with torches. I hold nothing against the torches, which were sensible. It was that they called me by name while they did it." } },
      choices = {
        { text = "We all have a road like that.", next = "BACK", reply = "We do, and it leads to the basin. I shall see you there.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    sylvanas = { { id = "tp_syl", text = "The Dark Lady gave us back our will. Everything I do in Arathi is a small payment on that account." } },
    background = { { id = "tp_bg", text = "I was a clerk in Lordaeron and then I was a corpse. The Defilers found the second trade suited me better." } },
    _none = { { id = "tp_none", text = "I neither know nor care. Ask one of the tauren, who will at least be pleasant about not knowing." } },
  },
}
