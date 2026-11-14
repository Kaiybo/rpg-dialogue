-- Common knowledge: what anyone at all says when asked about a topic and has no better answer
-- of their own, their trade's or their town's. Morrowind's shared topic text, in our voices.
-- Faction matters for the wider world: an Alliance farmer and a Horde grunt don't tell the
-- same story about Thrall. Lore for every line: LORE_NOTES.md, "Ask about: common knowledge".
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Everyone
---------------------------------------------------------------------------
P:Generic {
  id = "common",
  topics = {
    background = {
      { id = "bg_plain", text = "Born, raised, put to work. Not much of a story. I'd rather hear yours." },
      { id = "bg_creak", text = "I've been here long enough to know which boards creak. Before that, somewhere quieter." },
      { id = "bg_again", when = { timesTalked = 3 }, text = "You keep asking. Fine: I wanted to see the world once. Then I saw a bit of it and came back." },
    },
    my_trade = {
      { id = "tr_plain", text = "I do what's in front of me and get paid for some of it." },
      { id = "tr_ask", text = "Ask me about my work when I'm not in the middle of it." },
    },
    little_secret = {
      { id = "ls_no", text = "Secrets are for friends. Come round a few more times and we'll see." },
      { id = "ls_lost", when = { timesTalked = 4 }, text = "Here's one: half the folk you meet are as lost as you are. They just walk faster." },
      { id = "ls_rumor", when = { timesTalked = 4 }, text = "Most rumors start with somebody bored. I've started a few. Don't believe the one about the mayor's goat." },
    },
    latest_rumors = {
      { id = "lr_inn", text = "Nothing worth repeating. Try an innkeeper. They hear everything twice." },
      { id = "lr_cheap", text = "Talk's cheap and mostly wrong. The inn has more of both." },
    },
    someplace_nearby = {
      { id = "sn_guard", text = "I don't wander far. A guard will point you right, or the flight master, if you've the coin." },
      { id = "sn_road", text = "Depends what you're after. The road goes both ways, and so does trouble." },
    },
    booty_bay = {
      { id = "bb_jaws", text = "Goblin port at the bottom of Stranglethorn. You walk in through a shark's jaws. Anyone can trade there, which means anyone can rob you there." },
      { id = "bb_neutral", text = "Neutral ground, the goblins call it. Alliance and Horde drink in the same tavern. The Bruisers make sure that's all they do." },
    },
    gadgetzan = {
      { id = "gz_desert", text = "Goblin town in the Tanaris desert. The Cartel keeps it neutral, and the water costs more than the ale." },
    },
    ratchet = {
      { id = "ra_port", text = "A goblin port on the Barrens coast. Ships come and go if you've the fare, and the goblins don't ask whose side you're on." },
    },
    gurubashi = {
      { id = "gu_empire", text = "The trolls of Stranglethorn. They had an empire once, the Gurubashi, and the jungle's still full of its ruins. Now it's tribes, Bloodscalp and Skullsplitter and worse, and none of them want visitors." },
      { id = "gu_capital", text = "Zul'Gurub was their capital, somewhere in the east of the jungle. Nobody I know has been inside and come back to talk about it." },
    },
    blackwater = {
      { id = "bw_pirates", text = "The pirates who keep Booty Bay for the goblins. Respectable, as pirates go. They don't kill unless they must." },
    },
    nesingwary = {
      { id = "ne_hunter", text = "A famous big-game hunter with a camp in northern Stranglethorn. Wrote a book about the jungle, I hear. Bit full of himself, I also hear." },
    },
  },
}

---------------------------------------------------------------------------
-- Alliance folk
---------------------------------------------------------------------------
P:Generic {
  id = "common_alliance", faction = "Alliance",
  topics = {
    alliance = {
      { id = "al_promise", text = "An old promise between kingdoms, still mostly kept. Stormwind leads it now that Lordaeron's gone." },
      { id = "al_turn", text = "Humans, dwarves, gnomes, night elves. We argue like a family and turn up like one when it counts." },
      { id = "al_skyborne", when = { race = "Skyborne" }, text = "It's a big table with a lot of chairs. You'll find someone saving yours, sooner or later." },
    },
    horde = {
      { id = "ho_camps", text = "My grandfather fought orcs. My father guarded the camps they were kept in. Now they've a warchief and a city of their own. Strange times." },
      { id = "ho_list", text = "Orcs, trolls, tauren, and now Lordaeron's walking dead. They keep to Kalimdor and the ruins in the north. Mostly." },
    },
    scourge = {
      { id = "sc_lordaeron", text = "The plague that ate Lordaeron in a season. The Plaguelands are what's left, and the dead still walk there." },
      { id = "sc_pray", text = "If you've never seen a dead man get up, don't go looking. Pray it stays in the north." },
      { id = "sc_paladin", when = { class = "PALADIN" }, text = "That's your work, isn't it? Holy hammers and all. Good. Somebody has to." },
    },
    third_war = {
      { id = "tw_prince", text = "The dead rose in Lordaeron, the prince killed his own father, and the kingdom fell. The refugees came south with nothing but what they wore." },
      { id = "tw_hyjal", text = "It ended on a mountain in Kalimdor, they say, with men and elves and orcs fighting the same enemy. I'd have paid to see that." },
    },
    forsaken = {
      { id = "fo_free", text = "Lordaeron's dead, walking about and calling themselves free. They've joined the Horde. I don't know which part bothers me most." },
    },
    silver_hand = {
      { id = "sh_order", text = "Paladins. The order was born in Lordaeron and near enough died there. What's left of it serves from the Cathedral, and in Ironforge." },
      { id = "sh_split", when = { class = "PALADIN" }, text = "You'd know better than me. After Lordaeron, some of your lot joined the Crusade and some the Argent Dawn. The rest came home and kept the old name." },
    },
    holy_light = {
      { id = "li_candle", text = "The Light's in the Cathedral and in every candle someone lights for the dead. I'm not pious, but I light mine." },
      { id = "li_paladin", when = { class = "PALADIN" }, text = "You carry it about with you, don't you? I can tell. You stand like someone's watching, and you don't mind." },
    },
    elune = {
      { id = "el_moon", text = "The night elves' goddess, of the moon. Her priestesses fight like soldiers, which tells you something about the goddess." },
      { id = "el_kaldorei", when = { race = "NightElf" }, text = "You'd know her better than I would. I only know your people go quiet when the moon comes up." },
    },
    earth_mother = {
      { id = "em_tauren", text = "Something the tauren pray to. The land itself, I've heard. Can't say I've ever stood still long enough with a tauren to ask." },
      { id = "em_druid", when = { class = "DRUID" }, text = "You're a druid. You'd hear her better than me, whatever she is." },
    },
    stormwind = {
      { id = "sw_rebuilt", text = "The orcs burned it in the First War and we built it back taller. The stonemasons who built it are still waiting to be paid. That's a story in itself." },
      { id = "sw_loud", text = "Biggest city we've got, and the loudest. Everyone's selling something and everyone's late." },
    },
    ironforge = {
      { id = "if_forge", text = "Dwarf city inside a mountain, with a great forge at its heart. Warm as a bakery. A tram runs there from Stormwind, under the ground." },
      { id = "if_dwarf", when = { race = "Dwarf" }, text = "Home for you, I'd guess. You've that look of someone who misses a proper ceiling." },
    },
    darnassus = {
      { id = "dn_tree", text = "The night elves' city, high up in a tree they grew on purpose after the war. Quiet place. They don't say much to outsiders." },
    },
    orgrimmar = {
      { id = "og_name", text = "The orcs' city in Kalimdor, named for one of their old warchiefs. I've no wish to see it." },
    },
    thunder_bluff = {
      { id = "tb_mesas", text = "Tauren city on top of the mesas. They ride lifts up and down. It sounds almost pleasant, which is more than you can say for most Horde places." },
    },
    undercity = {
      { id = "uc_cellars", text = "They built it under the ruins of Lordaeron's capital. The dead keep house in the king's cellars. Think about that before you sleep." },
    },
    theramore = {
      { id = "th_jaina", text = "Lady Jaina's island off Kalimdor. Lordaeron's survivors went there. She talks peace with the orcs, and some folk here can't forgive her for it." },
    },
    goldshire = {
      { id = "gs_inn", text = "Village on the road south of Stormwind. The Lion's Pride is the best reason to stop there, and Hogger's the best reason not to linger." },
    },
    gromgol = {
      { id = "gg_fort", text = "Horde camp on the Stranglethorn coast. Orcs and trolls guarding their road. Not a place for the likes of us." },
    },
    bolvar = {
      { id = "bo_regent", text = "Highlord Bolvar Fordragon. He rules for the boy king until the boy's grown. Honest man, people say. Tired man, by the look of him." },
    },
    king_anduin = {
      { id = "an_ten", text = "Ten years old and wearing his father's crown. Bolvar rules for him, but the boy listens, I'm told. That's more than most kings manage." },
    },
    varian = {
      { id = "va_gone", text = "He sailed for a meeting at Theramore and never got there. Some say drowned, some say taken. Nobody who knows is saying." },
    },
    magni = {
      { id = "ma_king", text = "King of Ironforge. Loud, generous, fond of his history. He lost a brother in the north, and his daughter to the Dark Iron clan. He carries it well." },
    },
    tyrande = {
      { id = "ty_priestess", text = "High Priestess of the night elves. She leads them alone while the archdruid Malfurion sleeps in some dream. I wouldn't cross her." },
    },
    jaina = {
      { id = "ja_mage", text = "A mage of Dalaran who brought Lordaeron's survivors west. She keeps Theramore, and she keeps the peace with Thrall. Brave or mad. Possibly both." },
    },
    thrall = {
      { id = "tl_slave", text = "The orcs' warchief. Raised a slave by one of our own lords, broke free, then broke the camps open. Can't say I blame him. Can't say I trust him." },
    },
    cairne = {
      { id = "ca_wise", text = "The tauren's chieftain. Old and wise, people say, and big as a barn door. If the Horde must have leaders, I'd rather they were like him." },
    },
    sylvanas = {
      { id = "sy_ranger", text = "She was Quel'Thalas's ranger-general before the Scourge killed her. Now she rules the Undercity. Death changes people." },
    },
  },
}

---------------------------------------------------------------------------
-- Horde folk
---------------------------------------------------------------------------
P:Generic {
  id = "common_horde", faction = "Horde",
  topics = {
    alliance = {
      { id = "al_camps", text = "Humans, dwarves, gnomes, and the night elves who bleed us in Ashenvale. They built camps for our people once. We remember." },
      { id = "al_trade", text = "Some of them trade fair in Booty Bay. Some of them shoot first. You learn to tell which by the boots." },
    },
    horde = {
      { id = "ho_chose", text = "Thrall's Horde. Not the old one that burned the world for demons. This one we chose." },
      { id = "ho_company", text = "Orc, troll, tauren, Forsaken. Strange company. Strong company." },
      { id = "ho_skyborne", when = { race = "Skyborne" }, text = "Now there's you as well, whatever you are. The Horde takes in anyone who'll stand in the line. Stand in it." },
    },
    scourge = {
      { id = "sc_lich", text = "Undead that answer to the Lich King. The Forsaken hate them more than anyone does, and that's saying something." },
      { id = "sc_north", text = "They hold the human lands in the north. Let the humans weep for them. Just don't let the plague come south." },
    },
    third_war = {
      { id = "tw_sea", text = "Thrall brought us across the sea, and we found the elves and the humans already fighting what the old Horde once served. At Hyjal, we fought beside them. Nobody likes to say it aloud." },
    },
    forsaken = {
      { id = "fo_cairne", text = "The Dark Lady's people. Dead, free of the Lich King, angry at everything. Cairne vouched for them. That's enough for most of us." },
    },
    silver_hand = {
      { id = "sh_eitrigg", text = "There was a paladin in the north who stood up for an orc once and lost everything for it. The rest of them we know from the wrong end of a hammer." },
    },
    holy_light = {
      { id = "li_humans", text = "The humans' faith. The trolls laugh at it, the tauren respect it, and the orcs don't think about it much at all." },
    },
    elune = {
      { id = "el_mosha", text = "The night elves' moon goddess. The tauren call the moon Mu'sha, the White Lady, one of the Earth Mother's eyes. Same moon. Different story." },
    },
    earth_mother = {
      { id = "em_eyes", text = "The tauren's goddess. The land, and everything on it, and the sun and moon are her eyes. Ask a tauren. They'll talk till An'she goes down." },
      { id = "em_tauren", when = { race = "Tauren" }, text = "You're asking me? She's yours, friend. She's listening, too. Mind your manners." },
      { id = "em_druid", when = { class = "DRUID" }, text = "You're a druid. You'd hear her better than me. Walk softly and she might answer." },
    },
    stormwind = {
      { id = "sw_burned", text = "The human capital. We burned it once, in the First War. They built it back taller. Humans are stubborn that way." },
    },
    ironforge = {
      { id = "if_mountain", text = "A mountain hollowed out for dwarves. Nobody's taken it by force. Nobody's been fool enough to try lately." },
    },
    darnassus = {
      { id = "dn_north", text = "The elves' tree city, far north across the water. They planted it after the war, and they come out of it to hunt our woodcutters." },
    },
    orgrimmar = {
      { id = "og_drag", text = "Our city, named for Orgrim Doomhammer. Wood, stone and stubbornness. If you've not walked the Drag at dusk, go." },
      { id = "og_orc", when = { race = "Orc" }, text = "Home. Dust, smoke, and every voice you know shouting at once. You miss it already, I can see." },
    },
    thunder_bluff = {
      { id = "tb_wind", text = "Cairne's city, up on the mesas. Lifts carry you up from the plains. The wind never stops up there." },
    },
    undercity = {
      { id = "uc_apoth", text = "The Forsaken city, under the ruins of Lordaeron. It smells of the Apothecarium. Don't eat anything they offer you." },
      { id = "uc_scourge", when = { race = "Scourge" }, text = "You'd know more than me. All I know is the lift down's quicker than the lift up, and that worries me." },
    },
    theramore = {
      { id = "th_father", text = "Jaina Proudmoore's harbor in Dustwallow. Her father came to make war on us, and she let him fall. Thrall respects her for that." },
    },
    goldshire = {
      { id = "gs_human", text = "A human village near their capital. Why would I know more than that?" },
    },
    gromgol = {
      { id = "gg_base", text = "Our base on the Stranglethorn coast. It guards the road to Stonard, and the trolls and ogres never let it rest." },
    },
    bolvar = {
      { id = "bo_soldier", text = "The human who rules for their boy king. A soldier, they say. Soldiers are easier to understand than kings." },
    },
    king_anduin = {
      { id = "an_child", text = "The humans crowned a child. Their real king went missing and nobody can say where." },
    },
    varian = {
      { id = "va_songs", text = "The human king who vanished. Some of the humans blame us. If we'd done it, there'd be songs." },
    },
    magni = {
      { id = "ma_grieve", text = "The dwarf king. They say he grieves a brother lost in the north. Even dwarves grieve, it seems." },
    },
    tyrande = {
      { id = "ty_wolf", text = "The night elves' priestess-queen. Her Sentinels hunt our woodcutters in Ashenvale. I respect her the way you respect a wolf." },
    },
    jaina = {
      { id = "ja_word", text = "The human mage who made peace with Thrall. A rare human. Rarer still, she's kept her word." },
    },
    thrall = {
      { id = "tl_freed", text = "Warchief. Raised a slave, freed us all, led us across the sea. Lok'tar." },
      { id = "tl_young", text = "Young for a warchief, and wiser than most. When he speaks of the old Horde, he doesn't make excuses for it." },
    },
    cairne = {
      { id = "ca_centaur", text = "High Chieftain of the tauren. He fought beside Thrall against the centaur, and the tauren have had a home ever since." },
    },
    sylvanas = {
      { id = "sy_banshee", text = "The Banshee Queen. She broke free of the Lich King and took her people with her. She'd die for them again, if she could still die." },
    },
  },
}
