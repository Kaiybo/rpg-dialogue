local P = RPGDialogueAPI:Pack("rpgd.world")

-- Named overheard exchanges (0.116.0): specific people who stand close together in game.
-- Each plays once; NPCs may greet you about it afterwards with `overheard = "<id>"`.

-- ===== Orgrimmar =====
P:Exchange { id = "ex_thrall_eitrigg_council", a = { npc = "thrall" }, b = { npc = "eitrigg" }, lines = {
  { who = "a", text = "The Kor'kron report more humans on the coast of Durotar, Eitrigg. Theramore swears they are not Proudmoore's men, and I want to believe it." },
  { who = "b", text = "Believe it if you must, Warchief, but post the grunts anyway. I trusted Blackhand's word once, and I have the scars to remind me what trust costs." },
  { who = "a", text = "That is why I keep you close, old friend. Somebody in this hall has to remember the bad years for the rest of us." },
} }
P:Exchange { id = "ex_thrall_nazgrel_watch", a = { npc = "thrall" }, b = { npc = "nazgrel" }, lines = {
  { who = "b", text = "The Burning Blade were seen in the Cleft of Shadow again, Warchief. My Kor'kron can root them out by morning if you give the word." },
  { who = "a", text = "Do it quietly, Nazgrel. I will not have the young ones thinking the old darkness walks openly in my city." },
} }
P:Exchange { id = "ex_eitrigg_nazgrel_old", a = { npc = "eitrigg" }, b = { npc = "nazgrel" }, lines = {
  { who = "b", text = "You stand like a man still expecting an ambush, Eitrigg. This is the Warchief's own hall." },
  { who = "a", text = "I stood in Blackrock Spire like this too, and the ambush came from my own clan. Old habits keep old warriors breathing, Nazgrel." },
} }
P:Exchange { id = "ex_gryshka_gamon", a = { npc = "gryshka" }, b = { npc = "gamon" }, lines = {
  { who = "a", text = "Gamon, if you put your boots on my table one more time, I will feed them to the wolves in the Valley of Honor." },
  { who = "b", text = "Gamon is only resting. Gamon has had a very hard day of sitting here." },
  { who = "a", text = "Every day is a hard day of sitting here for you, and every day I still have to wipe the table after." },
} }
P:Exchange { id = "ex_korghan_zevrost", a = { npc = "korghan" }, b = { npc = "zevrost" }, lines = {
  { who = "a", text = "Your students leave the Cleft smelling of brimstone, Zevrost, and the guards are starting to talk about it." },
  { who = "b", text = "Let them talk. Power has a smell, Kor'ghan, and the ones who complain loudest are always the ones who could never hold it." },
} }

-- ===== Durotar =====
P:Exchange { id = "ex_garthok_orgnil", a = { npc = "garthok" }, b = { npc = "orgnil" }, lines = {
  { who = "a", text = "Kul Tiras is landing more soldiers at Tiragarde Keep, Orgnil. If they march on Razor Hill, my grunts will be ready for them." },
  { who = "b", text = "Ready is not enough, Gar'Thok. The spirits tell me the Burning Blade are stirring in the Skull Rock, and that is the closer knife." },
  { who = "a", text = "Then send me the young ones with sharp eyes, and I will put them to work on both." },
} }
P:Exchange { id = "ex_grosk_garthok", a = { npc = "grosk" }, b = { npc = "garthok" }, lines = {
  { who = "a", text = "Your grunts drink like the Bleeding Hollow, Gar'Thok, and they pay like peons." },
  { who = "b", text = "They spill blood for this village, Grosk. A little grog on the house is the least Razor Hill owes them." },
  { who = "a", text = "The least Razor Hill owes them is coming out of my cellar, and my cellar is not bottomless." },
} }

-- ===== The Barrens =====
P:Exchange { id = "ex_sergra_thork", a = { npc = "sergra" }, b = { npc = "thork" }, lines = {
  { who = "a", text = "The plainstriders are thinning near the Crossroads, Thork. The quilboar have been hunting the same ground as us." },
  { who = "b", text = "Then the quilboar will learn whose ground it is. Send word to the hunters that the Razormane are fair game this season." },
} }
P:Exchange { id = "ex_helbrim_zargh", a = { npc = "helbrim" }, b = { npc = "zargh" }, lines = {
  { who = "b", text = "Apothecary, what do you put in those vials? My boar ribs never smell that foul, and they are three days old." },
  { who = "a", text = "Venom, Zargh, from the Barrens' own spiders, and I would thank you not to sniff my work over your cooking fire." },
} }
P:Exchange { id = "ex_boorand_thork", a = { npc = "boorand" }, b = { npc = "thork" }, lines = {
  { who = "a", text = "The beds upstairs are full again, Thork. Every traveller from Ratchet to Camp Taurajo seems to stop here." },
  { who = "b", text = "That is what a crossroads is for, innkeeper. Keep them fed and rested, and the grunts will keep them safe." },
  { who = "a", text = "Then may the Earth Mother send me more blankets, because the grunts certainly won't." },
} }
P:Exchange { id = "ex_gazlowe_dizzywig", a = { npc = "gazlowe" }, b = { npc = "dizzywig" }, lines = {
  { who = "a", text = "Dizzywig, the Booty Bay boat came in light again, and somebody's skimming off my docking fees. Tell me it ain't you." },
  { who = "b", text = "Boss, boss, I swear on my mother's ledger, the pirates off the coast took half the crates, and they don't pay tariffs, believe me." },
  { who = "a", text = "Then bill the pirates, pal, because somebody's payin' for that cargo and it sure ain't gonna be me." },
} }
P:Exchange { id = "ex_sputtervalve_gazlowe", a = { npc = "sputtervalve" }, b = { npc = "gazlowe" }, lines = {
  { who = "a", text = "The new crane on pier two blew a gasket again, Gazlowe, and it only took off a little of Grimble's eyebrows this time." },
  { who = "b", text = "A little's an improvement, so log it as progress and put the gasket on the Venture Company's tab, since they sold it to us." },
} }

-- ===== Mulgore and Thunder Bluff =====
P:Exchange { id = "ex_hamuul_magatha", a = { npc = "hamuul" }, b = { npc = "magatha" }, lines = {
  { who = "b", text = "Your druids walk too often in the dreams of the night elves, Hamuul. The tauren should seek their own wisdom, not borrow it." },
  { who = "a", text = "Malfurion taught me to hear the land more clearly, Magatha, and the land belongs to no single tribe. I take what helps our people." },
  { who = "b", text = "We will see whom it helps, Arch Druid, when the winds change." },
} }
P:Exchange { id = "ex_baine_harken", a = { npc = "baine" }, b = { npc = "harken" }, lines = {
  { who = "b", text = "The Venture Company has cut down more trees beyond the village, Baine. The earth groans where their machines walk." },
  { who = "a", text = "My father will hear of it, Harken, and I will send our young hunters to watch them until he decides." },
} }
P:Exchange { id = "ex_baine_zarlman", a = { npc = "baine" }, b = { npc = "zarlman" }, lines = {
  { who = "a", text = "You have been reading the omens late into the night, Zarlman. Do the spirits trouble you?" },
  { who = "b", text = "They are restless, young Bloodhoof. The Palemane have turned to dark ways, and the spirits mourn what they have lost." },
  { who = "a", text = "Then we will mourn with them, and then we will do something about it." },
} }

-- ===== Undercity and Tirisfal =====
P:Exchange { id = "ex_sylvanas_varimathras", a = { npc = "sylvanas" }, b = { npc = "varimathras" }, lines = {
  { who = "b", text = "The Scourge test the walls of Brill again, my lady. I could send my own servants to deal with them, if it pleases you." },
  { who = "a", text = "What pleases me, Varimathras, is a servant who does as he is told and nothing more. Keep your creatures leashed." },
  { who = "b", text = "Of course, my queen. I live only to obey." },
} }
P:Exchange { id = "ex_sylvanas_faranell", a = { npc = "sylvanas" }, b = { npc = "faranell" }, lines = {
  { who = "b", text = "The new tinctures are showing promise, my lady. The test subjects from Hillsbrad lasted nearly a day longer than the last batch." },
  { who = "a", text = "Promise does not interest me, Faranell, only results. Bring me something that kills the Scourge, and the Society will want for nothing." },
} }
P:Exchange { id = "ex_faranell_zinge", a = { npc = "faranell" }, b = { npc = "zinge" }, lines = {
  { who = "a", text = "Zinge, your notes on the last sample are smudged again. I cannot read your sevens from your ones." },
  { who = "b", text = "My fingers are not what they were, Master Faranell. I lost two of them in the last experiment, if you remember." },
  { who = "a", text = "I remember, and I also remember that the experiment was a success, so do try harder with the eight you have left." },
} }
P:Exchange { id = "ex_cuely_fuely", a = { npc = "uc_cuely" }, b = { npc = "uc_fuely" }, lines = {
  { who = "a", text = "You've stirred the vat the wrong way again, Fuely. Widdershins, always widdershins, or it curdles." },
  { who = "b", text = "It curdles either way, Cuely. I simply prefer to watch it curdle from the left." },
} }
P:Exchange { id = "ex_zygand_sevren", a = { npc = "zygand" }, b = { npc = "sevren" }, lines = {
  { who = "a", text = "The Scarlet Crusade burned another of our outposts near the Monastery, Sevren. Brill's defences are thinner than I would like." },
  { who = "b", text = "Then we raise more Deathguard from the fresh graves, Executor. Tirisfal has never been short of the dead." },
} }
P:Exchange { id = "ex_renee_johaan", a = { npc = "renee" }, b = { npc = "johaan" }, lines = {
  { who = "a", text = "Johaan, the guests upstairs say something is bubbling in your corner again, and it smells like a drowned dog." },
  { who = "b", text = "It is meant to smell like a drowned dog, Renee. That is how I know the formula has taken." },
  { who = "a", text = "Well, the guests would prefer it took somewhere else, and so would I." },
} }
P:Exchange { id = "ex_darthalia_lydon", a = { npc = "darthalia" }, b = { npc = "lydon" }, lines = {
  { who = "a", text = "Southshore grows bolder, Lydon. Their patrols reached the bridge last night, and I lost two Deathguard to them." },
  { who = "b", text = "Then let me send them a gift, High Executor. A few barrels of my new mixture in their well would end their boldness." },
  { who = "a", text = "Patience. The Dark Lady will decide when Southshore drinks, and she has not decided yet." },
} }

-- ===== Stormwind and Elwynn =====
P:Exchange { id = "ex_bolvar_katrana", a = { npc = "bolvar" }, b = { npc = "katrana" }, lines = {
  { who = "a", text = "The Westfall farmers have sent another petition, Lady Prestor. They want soldiers against the Defias, and I am inclined to give them some." },
  { who = "b", text = "The treasury is not bottomless, Highlord, and the nobles will not pay for every peasant's complaint. Let the People's Militia earn its name." },
  { who = "a", text = "I will think on it, my lady, but I will not leave them to fend for themselves forever." },
} }
P:Exchange { id = "ex_bolvar_afrasiabi", a = { npc = "bolvar" }, b = { npc = "field_marshal_afrasiabi" }, lines = {
  { who = "b", text = "The garrisons in Redridge are stretched thin, Highlord. The orcs of the Blackrock are pushing harder at Lakeshire every week." },
  { who = "a", text = "Send what you can spare, Marshal, and tell Marris that Stormwind has not forgotten him." },
} }
P:Exchange { id = "ex_anduin_bolvar", a = { npc = "anduin" }, b = { npc = "bolvar" }, lines = {
  { who = "a", text = "Highlord Bolvar, is there any word of my father today? Anything at all?" },
  { who = "b", text = "Not yet, Your Majesty, but every ship and every rider carries his description. We will find him, I promise you." },
  { who = "a", text = "You said that last week, too, but I know you mean it, so I'll keep believing." },
} }
P:Exchange { id = "ex_dughan_remy", a = { npc = "dughan" }, b = { npc = "remy" }, lines = {
  { who = "b", text = "Marshal, I've heard the kobolds in the Fargodeep Mine are wearing candles on their heads now, which seems a fire hazard to me." },
  { who = "a", text = "They have always worn candles, Remy, and I would thank you not to spread news that is twenty years old." },
  { who = "b", text = "Well, it was new to me, and that's the best kind of news there is." },
} }
P:Exchange { id = "ex_farley_dughan", a = { npc = "farley" }, b = { npc = "dughan" }, lines = {
  { who = "a", text = "Marshal, another of your recruits fell asleep in my common room after one ale. You might teach them to hold their drink." },
  { who = "b", text = "I'd rather teach them to hold a sword, Farley, but I'll mention it. Goldshire has enough trouble with the Defias without drunk guards." },
} }

-- ===== Westfall =====
P:Exchange { id = "ex_gryan_danuvin", a = { npc = "gryan" }, b = { npc = "danuvin" }, lines = {
  { who = "b", text = "The Defias raided the Molsen farm again last night, Gryan. We found red bandanas in the furrows by dawn." },
  { who = "a", text = "Then we'll double the patrol on the north road, Danuvin. Stormwind won't send help, so the People's Militia must be enough." },
} }
P:Exchange { id = "ex_galiaan_lewis", a = { npc = "galiaan" }, b = { npc = "lewis" }, lines = {
  { who = "b", text = "If your scouts keep tearing their boots on the Westfall rocks, Galiaan, I'll run out of leather before the harvest." },
  { who = "a", text = "Tell the Defias to keep to the soft fields, then, Lewis. I go where the trail goes." },
} }

-- ===== Redridge =====
P:Exchange { id = "ex_solomon_marris", a = { npc = "solomon" }, b = { npc = "marris" }, lines = {
  { who = "a", text = "I have written to Stormwind four times now, Marris, and not one letter has been answered. The Blackrock are at our very door." },
  { who = "b", text = "Then we stop waiting for the king's men, Magistrate. Lakeshire has its own militia and its own heroes passing through, so we use them." },
} }
P:Exchange { id = "ex_marris_feldon", a = { npc = "marris" }, b = { npc = "feldon" }, lines = {
  { who = "b", text = "Marshal, the gnolls came within sight of the bridge again. I counted at least a dozen Redridge mongrels on the hill." },
  { who = "a", text = "A dozen is a nuisance, Feldon, not a siege. Keep your eyes on Stonewatch, because that is where the real trouble lives." },
} }
P:Exchange { id = "ex_verner_solomon", a = { npc = "verner" }, b = { npc = "solomon" }, lines = {
  { who = "a", text = "Magistrate, the bridge workers want their wages, and the bridge isn't half finished on account of the gnolls." },
  { who = "b", text = "Then they'll have half their wages, Verner, and the rest when Lakeshire can cross the lake without a guard." },
} }

-- ===== Ironforge =====
P:Exchange { id = "ex_magni_archesonus", a = { npc = "magni" }, b = { npc = "archesonus" }, lines = {
  { who = "a", text = "Archesonus, read me that last report from Uldaman again. I want tae hear the bit about the titans' tablets twice." },
  { who = "b", text = "Gladly, Your Majesty, though I must warn you that Brann's handwriting grows worse with every dig he finishes." },
  { who = "a", text = "Aye, my brother writes like he digs, all at once and nae tidying after. Read on, lad." },
} }
P:Exchange { id = "ex_magni_mekkatorque", a = { npc = "magni" }, b = { npc = "mekkatorque" }, lines = {
  { who = "b", text = "Your Majesty, my engineers estimate a seventy-three percent chance that the radiation in Gnomeregan will fall within a decade, give or take." },
  { who = "a", text = "And the other twenty-seven percent, Gelbin? Never mind, ye'll stay in Ironforge as long as ye need, and welcome." },
} }

-- ===== Darnassus =====
P:Exchange { id = "ex_tyrande_alathea", a = { npc = "tyrande" }, b = { npc = "alathea" }, lines = {
  { who = "b", text = "The novices ask why Elune lets the Burning Legion's taint linger in Felwood, High Priestess. I have no good answer for them." },
  { who = "a", text = "Tell them the goddess grieves as we do, Alathea, and that she has given us hands so that we may heal what she cannot." },
} }
P:Exchange { id = "ex_tyrande_amoora", a = { npc = "tyrande" }, b = { npc = "amoora" }, lines = {
  { who = "a", text = "The moonwells of the temple shine brightly tonight, A'moora. Elune smiles on us, even here so far from Hyjal." },
  { who = "b", text = "She does, my lady, and the Sentinels at Auberdine say the same light falls on the shore. Ishnu-alah." },
} }
P:Exchange { id = "ex_fandral_rellian", a = { npc = "fandral" }, b = { npc = "rellian" }, lines = {
  { who = "b", text = "Arch Druid, the pilgrims ask why Teldrassil was planted without the Dragonflight's blessing. I told them to ask you." },
  { who = "a", text = "Tell them, Rellian, that the kaldorei needed a home and that I gave them one. The dragons may bless it when they care to." },
} }
P:Exchange { id = "ex_jandria_alathea", a = { npc = "jandria" }, b = { npc = "alathea" }, lines = {
  { who = "a", text = "Your students light their candles before the moon has even risen, Alathea. Patience used to be the first lesson of the temple." },
  { who = "b", text = "It still is, Jandria, but the young have never known a world without the Legion's shadow, so they are eager for light." },
} }

-- ===== Dustwallow =====
P:Exchange { id = "ex_jaina_tervosh", a = { npc = "jaina" }, b = { npc = "tervosh" }, lines = {
  { who = "b", text = "Lady Jaina, the scouts report Horde riders near the Barrens border again. The garrison is uneasy." },
  { who = "a", text = "Remind the garrison that Thrall is our ally, Tervosh. A few riders on the road are not a war, and I'll not let fear turn them into one." },
} }

-- ===== Stranglethorn =====
P:Exchange { id = "ex_revilgaz_seahorn", a = { npc = "revilgaz" }, b = { npc = "seahorn" }, lines = {
  { who = "a", text = "Seahorn, the Bloodsail Buccaneers sank another merchant off the cape, and that merchant owed me money, so this is personal now." },
  { who = "b", text = "Aye, Baron, and they'll keep sinkin' 'em until someone puts a cannonball through their flagship. I've a few volunteers in mind." },
  { who = "a", text = "Then hire them, and send me the invoice, because a dead debtor's still cheaper than a dead harbour." },
} }
P:Exchange { id = "ex_krazek_kebok", a = { npc = "krazek" }, b = { npc = "kebok" }, lines = {
  { who = "a", text = "Kebok, you sold that adventurer a map to the gurubashi treasure, and he came back with half a leg. Bad for repeat business, pal." },
  { who = "b", text = "The map was real, Krazek, and the leg's his own fault, so I'd call that a fair transaction with a happy ending." },
} }

-- ===== Tanaris =====
P:Exchange { id = "ex_marin_bilgewhizzle", a = { npc = "marin" }, b = { npc = "bilgewhizzle" }, lines = {
  { who = "b", text = "Marin, the water tower pressure is down again, and the Wastewander bandits are drinkin' from our pipes for free." },
  { who = "a", text = "Free? Nobody drinks free in Gadgetzan, Bilgewhizzle. Put a lock on the valve and a bill on every bandit you can find." },
  { who = "b", text = "They're bandits, boss, they don't exactly open their mail." },
} }
