-- Durotar folk with no conversation yet: Yelnagi Blackarm of Razor Hill, a Sen'jin Watcher on the
-- village palisade, and a Steamwheedle Bruiser keeping the Cartel's peace on the road.
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC = P.TODO_NPC

-- Yelnagi Blackarm: an old Razor Hill hand who minds the town's stores and gossip.
P:NPC {
  key = "dur_yelnagi_blackarm", id = TODO_NPC("Yelnagi Blackarm"), name = "Yelnagi Blackarm", gender = "male",
  role = "townsfolk", tier = "service",
  communities = { "razor_hill" }, temper = { "gruff", "steady" }, values = { "practical", "loyal" },
  notices = { "race", "level" },
  impression = {
    first = "Yelnagi Blackarm leans on a barrel outside the Razor Hill inn with one arm black to the elbow from years of tar and forge soot. He watches the road as if he expects it to owe him money.",
    third = "{name} met Yelnagi Blackarm, an old orc who keeps an eye on Razor Hill's stores.",
  },
  greetings = {
    { id = "g_default", text = "Another face on the road from the Valley of Trials. Stay out of the way of the wagons and we will get along fine, {class}." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. Razor Hill has seen plenty who could not say the same." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, text = "Darkspear, eh? Your people at Sen'jin trade us fish for iron, and it is the best bargain this town ever made." },
    { id = "n_low", cat = "level", when = { maxLevel = 10 }, text = "You still have the dust of the Valley on your boots. Do not go picking fights at Tiragarde Keep yet, young one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Yelnagi, and I count what comes into Razor Hill and what goes out of it again. Most of it goes to Orgrimmar, and most of what comes back is complaints." } },
      again = {
        { id = "h_again", text = "What else? Make it quick, the wagon from the city is due." },
        { id = "h_again2", text = "Speak up, {class}. My ears are not what they were before the camps." },
      },
      choices = {
        { text = "What does Razor Hill need most?", next = "need" },
        { text = "Your arm is black as a smith's anvil.", next = "arm" },
        { text = "Who causes trouble around here?", next = "trouble" },
        { text = "Farewell, Yelnagi.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Timber, mostly, and there is none of it in this red dirt. Every plank in this town came down from Ashenvale or over the sea, and the night elves are not glad to see either road used." } },
      choices = {
        { text = "Then take the wood. Ashenvale has plenty.", next = "BACK", reply = "Spoken like a Warsong grunt. Plenty of them have said that, and plenty of them are buried under it.", fx = { align = { honor = -1 } } },
        { text = "Better to trade fairly than start another war.", next = "BACK", reply = "Thrall would agree with you, and so do I most days. The elves do not seem to, though.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arm = {
      lines = { { id = "a_default", text = "Tar from the internment camp at Durnholde, where the humans had me caulking their barges for nine years. It never washed off, so now I call it a badge." } },
      choices = {
        { text = "Do you hate the humans for it?", next = "hate" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    hate = {
      lines = { { id = "ht_default", text = "I hated them for a long time, and it did nothing but keep me awake. The Warchief taught us to save our anger for the battle and our strength for the building, and I am too old now to argue with him." } },
      choices = { { text = "Wise words. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trouble = {
      lines = { { id = "t_default", text = "The Burning Blade cultists in the Skull Rock caves, and the humans at Tiragarde Keep along the coast. Gar'Thok in the bunker will give you work against both if you have the stomach for it." } },
      choices = { { text = "I'll speak to Gar'Thok. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was nine years behind human walls and three years building this town. I like the building better." } },
    _none = { { id = "tp_none", text = "I count crates, {class}. Ask somebody who has time to wonder about things." } },
  },
}

-- Sen'jin Watcher: a Darkspear guard on the palisade of Sen'jin Village.
P:NPC {
  key = "dur_senjin_watcher", id = TODO_NPC("Sen'jin Watcher"), name = "Sen'jin Watcher",
  role = "guard", tier = "service",
  communities = { "senjin" }, temper = { "watchful", "easy" }, values = { "loyal" },
  notices = { "race" },
  impression = {
    first = "A Darkspear watcher leans on a spear at the edge of Sen'jin Village, eyes on the water and the Echo Isles beyond it. He grins easily, but the grin never quite reaches the islands.",
    third = "{name} spoke with one of the Sen'jin Watchers who guard the Darkspear village.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Sen'jin, mon. Keep your weapons sheathed in de village and you be fine." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, text = "Ah, one of de tribe come home. De loa be watchin' you, cousin, so do us proud out dere." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be watchin' de water, {class}, because de Echo Isles still belong to Zalazane and his mad witch doctors. One day we take dem back, but today we just watch." } },
      again = { { id = "h_again", text = "Somethin' else, mon? I still got eyes on de islands." } },
      choices = {
        { text = "Who is Zalazane?", next = "zalazane" },
        { text = "Why did your people leave the isles?", next = "left" },
        { text = "Keep watching, then.", next = "END" },
      },
    },
    zalazane = {
      lines = { { id = "z_default", text = "He was one of our own witch doctors before he went bad, and now he puts his hex on our people and makes dem his slaves. Master Gadrin in de village can tell you more, if you want to help." } },
      choices = {
        { text = "He should be killed before he spreads further.", next = "BACK", reply = "Dat be de plan, mon, as soon as we got de spears for it.", fx = { align = { order = 1 } } },
        { text = "Maybe his thralls can still be saved.", next = "BACK", reply = "Some can, maybe, but dat be a job for de witch doctors and not for me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    left = {
      lines = { { id = "l_default", text = "Zalazane's madness drove us off, and Thrall gave us dis shore when we had nowhere else. Vol'jin say we owe de Warchief, and de Darkspear always pay what dey owe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know nothin' about dat, mon. I just watch de water." } },
  },
}

-- Steamwheedle Bruiser: Cartel muscle keeping goblin trade safe along the coast.
P:NPC {
  key = "dur_steamwheedle_bruiser", id = TODO_NPC("Steamwheedle Bruiser"), name = "Steamwheedle Bruiser",
  role = "guard", tier = "service",
  communities = { "razor_hill" }, temper = { "brusque", "wry" }, values = { "practical" },
  impression = {
    first = "The Steamwheedle Bruiser is a goblin built like a barrel, with a club on his belt and a Cartel badge polished brighter than anything else he owns.",
    third = "{name} spoke with a Steamwheedle Bruiser, one of the Cartel's hired guards.",
  },
  greetings = {
    { id = "g_default", text = "Easy there, pal. Whatever you're thinkin' about startin', the Cartel already billed somebody to finish it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the peace for the Steamwheedle Cartel, friend, which means nobody breaks nothin' that belongs to a paying customer. Horde, Alliance, it's all the same coin to me." } },
      again = { { id = "h_again", text = "Still here? Talkin' to me don't cost you nothin', so go on." } },
      choices = {
        { text = "You'd guard an Alliance merchant too?", next = "neutral" },
        { text = "What happens if someone breaks the peace?", next = "peace" },
        { text = "I'll be going.", next = "END" },
      },
    },
    neutral = {
      lines = { { id = "n_default", text = "Sure I would, and I'd charge him the same rate as you. The Cartel don't take sides, because sides are bad for business and business is the only side worth bein' on." } },
      choices = {
        { text = "Neutral gold still funds our enemies.", next = "BACK", reply = "And your gold funds theirs too, pal, so I guess we're all even.", fx = { align = { honor = 1 } } },
        { text = "Smart. War is better as a customer than a cause.", next = "BACK", reply = "Now you're talkin' like a goblin. I might even like you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = { { id = "p_default", text = "Then me and the boys bust some heads, and the bill for the busting goes to whoever started it. It's a real tidy system, and I recommend nobody test it." } },
      choices = { { text = "Understood. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't get paid to know that, friend. I get paid to stand here and look scary." } },
  },
}
