-- What everyone in Stranglethorn's towns says about topics (0.26.0): the town's shared take,
-- below a person's own answer and their trade's, above common knowledge. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")

-- Booty Bay: goblin commerce, pirates who pay their dues, and a long memory for trolls.
P:Voice {
  id = "booty_bay", community = "booty_bay",
  topics = {
    background = {
      { id = "v_bg_ship", text = "Came in on a ship and never left. Nobody comes to Booty Bay meaning to stay. Everybody stays anyway." },
      { id = "v_bg_debt", text = "I owed a goblin money, so I came to work it off. That was a while ago. The interest is very well organized." },
    },
    someplace_nearby = {
      { id = "v_near_coast", text = "Down the coast to the south, the Bloodsail have ships at anchor. Don't go swimming that way. Don't go anything that way." },
      { id = "v_near_arena", text = "Up the road through the jungle there's an old troll stadium, the Gurubashi Arena. People fight there for sport now. The trolls would hate that." },
      { id = "v_near_jaws", text = "Out through the shark's jaws is the jungle, and the jungle wants you dead. Stay on the road and you'll get further than most." },
    },
    latest_rumors = {
      { id = "v_lr_sails", text = "Bloodsail ships off the point again, scouting. They're always scouting. One of these days they'll stop scouting." },
      { id = "v_lr_mackinley", text = "MacKinley's collecting again. If you owe him, pay. If you know someone who owes him, warn them. If you're dead, he'll find you anyway." },
    },
    alliance = {
      { id = "v_al_gold", text = "Alliance gold spends the same as Horde gold. The Baron checked. Twice." },
    },
    horde = {
      { id = "v_ho_chairs", text = "Horde drink, Alliance drink, both of them break chairs. We charge both of them for chairs. That's neutrality." },
    },
    booty_bay = {
      { id = "v_bb_here", text = "You're standing in it! Best port on the southern sea, if you don't count the smell, and the pirates, and the sharks." },
    },
    blackwater = {
      { id = "v_bw_dues", text = "Our pirates. They pay their dues, keep the harbor, and drink in the Salty Sailor. You could do a lot worse for neighbors." },
    },
    steamwheedle = {
      { id = "v_sw_owns", text = "The Cartel owns the town, the Baron runs it, and the coin runs everybody." },
    },
    gurubashi = {
      { id = "v_gu_cove", text = "The trolls had this cove before the goblins took it off them. They haven't forgotten. Neither have the Bruisers." },
    },
  },
}

-- Grom'gol: an orc camp at the end of a long supply road, with trolls and ogres on all sides.
P:Voice {
  id = "gromgol", community = "gromgol",
  topics = {
    background = {
      { id = "v_bg_road", text = "They sent me to keep the road open to Stonard. I'm still keeping it. The road doesn't stay kept." },
    },
    someplace_nearby = {
      { id = "v_near_reef", text = "There's a reef off the coast called the Vile Reef, and it earns the name. Kin'weelay sends people diving there. I'd rather not." },
      { id = "v_near_ruins", text = "The jungle's full of old troll ruins, and the Bloodscalp and Skullsplitter live in them. Pick a direction. You'll find one." },
      { id = "v_near_ogres", text = "The Mosh'Ogg ogres have a mound in the hills. They raid the caravans when they're bored, and ogres are always bored." },
    },
    latest_rumors = {
      { id = "v_lr_caravan", text = "Another caravan came in short a wagon. Trolls, or ogres. The commander doesn't care which. He wants heads." },
      { id = "v_lr_yenniku", text = "Nimboya's still hunting for Vol'jin's son. Talks of nothing else. I hope he finds the boy. I hope it's not too late." },
    },
    alliance = {
      { id = "v_al_rebels", text = "There are humans in the north of the jungle, a rebel camp. They fight their own colonel. We let them, for now." },
    },
    gurubashi = {
      { id = "v_gu_cousins", text = "The Darkspear here call the Bloodscalp cousins, and then they spit. That's all you need to know about trolls and family." },
    },
    gromgol = {
      { id = "v_gg_here", text = "You're in it. Palisade, tents, and a lot of tired grunts. It's ugly, and it's ours." },
    },
  },
}

-- The Rebel Camp: Stormwind soldiers who walked out of Kurzen's compound and won't go back.
P:Voice {
  id = "rebel_camp", community = "rebel_camp",
  topics = {
    background = {
      { id = "v_bg_kurzen", text = "I came south with Colonel Kurzen's expedition. When he went wrong, some of us walked west instead of following him. We're still out here." },
    },
    someplace_nearby = {
      { id = "v_near_compound", text = "Kurzen's Compound is east of here. That's where we came from. Don't go in alone, and don't trust anyone in our colors you meet there." },
      { id = "v_near_venture", text = "The Venture Company's cutting down trees by a lake out in the jungle. Goblins with saws. The whole vale's noisier for it." },
    },
    latest_rumors = {
      { id = "v_lr_spy", text = "Someone told Kurzen's men about Thorsen. The lieutenant wants to know who. So do I." },
      { id = "v_lr_medicine", text = "Kurzen's medicine men brew something for his soldiers. Brother Nimetz wants to know what's in it. I'd rather never find out." },
    },
    alliance = {
      { id = "v_al_forgot", text = "Stormwind sent us here and then forgot us. We're still the Alliance. Someone ought to tell Stormwind." },
    },
    horde = {
      { id = "v_ho_gromgol", text = "There's an orc fort on the coast at Grom'gol. They leave us be. We leave them be. Out here, that passes for peace." },
    },
    kurzen = {
      { id = "v_ku_colonel", text = "He was a good officer, once. Something got into his head out here, and too many of his men followed him in." },
    },
  },
}

-- Nesingwary's Expedition: hunters, a writer of a book, and trophies everywhere.
P:Voice {
  id = "nesingwary_camp", community = "nesingwary_camp",
  topics = {
    background = {
      { id = "v_bg_hunt", text = "I came to hunt and stayed to hunt. Out here that's the only story anyone has." },
    },
    someplace_nearby = {
      { id = "v_near_game", text = "Tigers, panthers, raptors. Pick your quarry and walk in any direction. It'll find you before you find it." },
      { id = "v_near_trolls", text = "Hunt the beasts all you like. Don't wander into the troll ruins. The trolls hunt too, and they're better at it." },
    },
    latest_rumors = {
      { id = "v_lr_pages", text = "The book's pages got loose and scattered all over the jungle. Barnil's beside himself. Bring back any you find." },
      { id = "v_lr_beast", text = "There's a great old tiger out there called Sin'Dall. Ajeck means to be the one who brings it down. Talk is cheap. Trophies aren't." },
    },
    nesingwary = {
      { id = "v_ne_boss", text = "The old man himself. Up before dawn, rifle in his lap, waiting for something worth shooting. Don't interrupt." },
    },
  },
}

-- Anywhere else in the vale.
P:Voice {
  id = "stranglethorn", zone = "Stranglethorn Vale",
  topics = {
    someplace_nearby = {
      { id = "v_near_jungle", text = "Jungle. More jungle. Some ruins. Then the sea. If you find somewhere safe in between, tell me." },
    },
    latest_rumors = {
      { id = "v_lr_fever", text = "Somebody's always got the fever in this jungle. Boil your water. Or drink rum. That's what everyone else does." },
    },
  },
}
