-- More inn talk across Kalimdor: Orgrimmar and Durotar, Darkshore, Stonetalon, Desolace,
-- the Needles, Feralas, the marsh, Tanaris and the far north and south. Hearsay. Year 1 only.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "orgrimmar_inns", roles = { "innkeeper" }, zones = { "Orgrimmar", "Durotar" },
  lines = {
    { id = "thrall", text = "The Warchief sat in the Valley of Wisdom half the night again, just listening to the old shaman. Some say he's soft for it. Nobody says it to him." },
    { id = "cleft", text = "There's talk the Cleft of Shadow has more warlocks in it than it admits to, and that some of them answer to no one in this city." },
    { id = "kultiras", when = { minLevel = 8 }, text = "Kul Tiran marines were seen on the coast south of Sen'jin again. Admiral Proudmoore's people never stopped thinking this land was theirs to take." },
    { id = "zalazane", when = { questBefore = TODO_QUEST("Zalazane") },
      text = "Zalazane still holds the Echo Isles with his witch doctors and his hexed trolls. Vol'jin's patience is long, but it isn't endless." },
    { id = "scorpids", text = "A peon came in from Razor Hill with a scorpid sting the size of my fist. He finished his shift first, of course." },
    { id = "goblins", text = "The goblins at the zeppelin tower swear the new one's safer than the last. Nobody asked them what happened to the last one." },
  },
}

P:Rumors {
  id = "darkshore_inns", roles = { "innkeeper" }, zones = { "Darkshore" },
  lines = {
    { id = "sea", text = "The sea's been taking the shore a little more each season, and old ruins come up out of the sand. The Sentinels look at them and don't say what they were." },
    { id = "furbolgs", when = { minLevel = 12 }, text = "The Blackwood furbolgs used to trade with us. Now they're wild-eyed and won't stop shouting. Something in their food, some say; something worse, say others." },
    { id = "ship", text = "A ship's run aground near the Mist's Edge, and the crabs have made it their home. The sailors have not been asked their opinion." },
    { id = "remtravel", text = "That gnome from the Explorers' League has dug half the coast up looking for relics. The night elves let him, mostly to see what he digs up next." },
  },
}

P:Rumors {
  id = "stonetalon_inns", roles = { "innkeeper" }, zones = { "Stonetalon Mountains" },
  lines = {
    { id = "venture", text = "The Venture Company is cutting down Stonetalon's trees as fast as their machines can chew. The sky above Windshear has been grey for months." },
    { id = "harpies", when = { minLevel = 18 }, text = "The harpies on the high crags have started raiding the goblins' lumber camps. For the first time in my life, I'm cheering for harpies." },
    { id = "peak", text = "The druids at Stonetalon Peak say the mountain's spirits are angry, and the mountain's been rumbling to agree with them." },
    { id = "kaldorei", when = { faction = "Horde" }, text = "The night elves say we cut their forest, and we say it was the goblins. Both are true, so both sides go on shouting past each other." },
  },
}

P:Rumors {
  id = "desolace_inns", roles = { "innkeeper" }, zones = { "Desolace" },
  lines = {
    { id = "centaurs", text = "The centaur clans are at each other's throats again, Gelkis against Magram. Whoever wins, the losers move closer to us." },
    { id = "maraudon", when = { minLevel = 40 }, text = "The Maraudon caves have started to bloom, they say, with flowers that bite and stone that walks. The centaur won't go near the place." },
    { id = "burning", when = { minLevel = 35 }, text = "There are demons in the south of Desolace, at Mannoroc Coven. They've been there since the old war, but lately they've been busier." },
    { id = "kodo", text = "Old kodos come to the graveyard in the north to die, and the bones are taller than a tower. The young ones go to look at it, and they come back quiet." },
  },
}

P:Rumors {
  id = "needles_inns", roles = { "innkeeper" }, zones = { "Thousand Needles", "Feralas" },
  lines = {
    { id = "racing", text = "The goblins and the gnomes are racing on the salt flats again, and both lost a car into the dust. They say it's fine; neither of them is sure who was in it." },
    { id = "grimtotem", when = { minLevel = 25 }, text = "The Grimtotem took another tauren camp in the Needles. They say they're tauren too, but they've got no tauren hearts left in them." },
    { id = "feralas", when = { minLevel = 40 }, text = "There's an old elven city in Feralas, Dire Maul, and ogres living in its halls now. The ogres are the polite ones; the things below them aren't." },
    { id = "ogres", when = { minLevel = 40 }, text = "The Gordunni ogres in Feralas have a new chief with a talent for magic. Ogres with magic: that's a sentence I never wanted to say." },
  },
}

P:Rumors {
  id = "dustwallow_inns", roles = { "innkeeper" }, zones = { "Dustwallow Marsh" },
  lines = {
    { id = "jaina", when = { faction = "Alliance" }, text = "Lady Proudmoore keeps Theramore together with one hand and her father's memory away with the other. The sailors miss the Admiral, some of them, and say so when they've drunk too much." },
    { id = "onyxia", when = { minLevel = 50 }, text = "There's a cave in the south of the marsh where a black dragon sleeps on a pile of gold. Some brave fool goes in every week. None of them come out rich." },
    { id = "deserters", text = "Some of the Admiral's old men have gone out into the marsh, deserters who never forgave Lady Jaina. They talk of revenge, but mostly they talk." },
    { id = "brackenwall", when = { faction = "Horde" }, text = "Brackenwall's had its own trouble, with ogres in the swamp and a black dragon that hates everyone with legs. We're glad of the rain, though." },
  },
}

P:Rumors {
  id = "tanaris_inns", roles = { "innkeeper" }, zones = { "Tanaris", "Un'Goro Crater" },
  lines = {
    { id = "gadgetzan", text = "The Gadgetzan water's getting scarcer, and the price is going the other way. Noggenfogger says it's supply and demand; everybody else says it's Noggenfogger." },
    { id = "wastewander", text = "The Wastewander bandits hit another caravan, and the goblins sent the bill to the Steamwheedle cartel. The cartel sent it back with interest." },
    { id = "zulfarrak", when = { minLevel = 42 }, text = "The Sandfury trolls are getting bold out at Zul'Farrak. Somebody caught a glimpse of a hydra in the temple pool, and nobody went back for a better look." },
    { id = "ungoro", when = { minLevel = 48 }, text = "A gnome came up out of the crater with his hair standing on end, saying the dinosaurs were the least of it. Something about crystals and singing." },
    { id = "caverns", when = { minLevel = 50 }, text = "There are dragons in the dunes to the east, bronze ones, and they don't like visitors near their caves. They're very polite about killing you." },
  },
}

P:Rumors {
  id = "farnorth_inns", roles = { "innkeeper" }, zones = { "Felwood", "Winterspring", "Azshara", "Moonglade" },
  lines = {
    { id = "felwood", when = { minLevel = 48 }, text = "Felwood was Ashenvale once, they say, as green as anywhere. Now the streams run poison and the furbolgs scream at night. The Cenarion Circle sends people to clean it up, and fewer come back." },
    { id = "everlook", text = "Everlook's goblins will sell you a fur coat and a snowball, and they've the nerve to charge for the snowball." },
    { id = "yeti", when = { minLevel = 52 }, text = "The yetis in Winterspring have come down from the caves early. When the yetis come down, something worse is up there." },
    { id = "azshara", when = { minLevel = 45 }, text = "The old elven ruins in Azshara are full of ghosts that still think it's the old empire. They don't take kindly to visitors who don't bow." },
  },
}

P:Rumors {
  id = "silithus_word", roles = { "innkeeper" }, zones = { "Silithus", "Tanaris", "Un'Goro Crater", "Feralas" },
  lines = {
    { id = "hives", when = { minLevel = 50 }, text = "The Cenarion Circle has a camp out in the Silithus desert, watching the insect hives. They say the hives are getting bigger, and nobody likes that." },
    { id = "twilight", when = { minLevel = 52 }, text = "There are cultists in Silithus in purple robes, the Twilight's Hammer, chanting at the rocks. Whatever they're calling, I hope it's busy." },
  },
}
