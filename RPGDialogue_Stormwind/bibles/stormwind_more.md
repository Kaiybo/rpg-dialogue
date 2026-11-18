# More Stormwind people  (npcs/stormwind_more.lua)

Fourteen named Stormwind City NPCs the pack lacked. Keys: demisette_cloyce, sandahl, jalane_ayrole, jarel_moor (Slaughtered Lamb, Mage Quarter); katherine_the_pure, brother_cassius (Cathedral of Light); tony_romano, bryan_cross, lieutenant_karter (Old Town); lina_stover (Trade District); kathrum_axehand (Dwarven District); darian_singh (Mage Quarter); major_mattingly, field_marshal_afrasiabi (Valley of Heroes).

## Sources (warcraft.wiki.gg via tools/npc.py, read)
- Demisette Cloyce: human warlock trainer in the Slaughtered Lamb's cellar, "an elder and one of the oldest and most respected members of the Slaughtered Lamb coven". Warlock gossip: "The arcane only corrupts those who are weak. Keep up on your training..."; non-warlock gossip: "The darkness does not embrace you... Be gone!" Her listed quests are later-era or class-chain items; none used.
- Sandahl: human warlock trainer, same cellar, same warlock gossip. Cataclysm quiz text and the Black Harvest quests are later and left out.
- Jalane Ayrole: human tailoring trainer in the Lamb's cellar; pre-Cataclysm a master Shadoweave trainer (pants 210, robe 215, gloves 225, shoulders 235, boots 240). Gossip: "Between the light and the dark, there is shadow... and those shadows have powers you have yet to see."
- Jarel Moor: human bartender of the Slaughtered Lamb; advises patrons to "stay away from the shadows". Hearthstone flavour left out.
- Katherine the Pure: human paladin trainer, east wing of the Cathedral, beside Lord Grayson Shadowbreaker and Arthur the Faithful; Knights of the Silver Hand. Her listed quests are later (Legion/SoD); none used. Uses the human paladin chain The Tome of Divinity (Duthorian Rall) only as a reaction.
- Brother Cassius: human reagent vendor in the Cathedral's east wing, Church of the Holy Light. Wares named are Classic reagents (holy/sacred candles, Symbol of Divinity, Light Feather, Arcane Powder, runes, flash powder, wild berries/thornroot).
- Lord Tony Romano: human senior rogue trainer, Old Town / SI:7. TCG line "Nobody ever won a war by playing fair" used as a motto (paraphrased, it suits him). Uncrowned/Legion material left out. His listed quests are Cataclysm; none used.
- Lina Stover: human bow & gun merchant just inside The Empty Quiver, Trade District; relative Frederick Stover (key `stover`, city_trades.lua).
- Kathrum Axehand: Wildhammer dwarf axe merchant, Dwarven District.
- Bryan Cross: human shield merchant, Old Town.
- Darian Singh: human fireworks vendor, Pyrotechnics shop, Mage Quarter. Gossip: since the fall of Dalaran and destruction of Quel'Thalas wares are hard to come by; Lucan Cordell and other tradesmen fill his orders; "finest arcane gear, made by the crafters and mages here in the city". Probably related to Lillian Singh (festival fireworks vendor).
- Major Mattingly: veteran of the Stormwind Army in the Valley of Heroes, lined face, longsword. Classic Onyxia head: Victory for the Alliance (to Bolvar) then Celebrating Good Times; he announces it from the gate. Later Stormrage novel material left out.
- Field Marshal Afrasiabi: Valley of Heroes; ends The Lord of Blackrock (Alliance, Nefarian's head) and announces it. Trivia: dislikes plans going off track; loves the (boring) history of steam-engine siege tactics.
- Lieutenant Karter: female human PvP war mount quartermaster outside the Champions' Hall, near Sergeant Major Clate, Lieutenant Jackspring and Captain O'Neal.
- Topics used: silver_hand, scarlet_crusade, stonemasons, the_stockade, valley_of_heroes, blackrock, grim_batol, dark_iron, defias (all existing in RPGDialogue_World/topics.lua).

## Their quests
- Victory for the Alliance / Celebrating Good Times (Mattingly, `TODO_QUEST`): pride, the city's morale, the question of trophies.
- The Lord of Blackrock (Afrasiabi, `TODO_QUEST`): a plan he'd rehearsed for years finally used; worry about wasting the victory.
- The Great Masquerade (both soldiers, reaction only): Lady Prestor unmasked; Afrasiabi rereads years of rejected army budgets.
- The Tome of Divinity (Katherine, reaction only).
- none for the other eleven: trainers and vendors built from role, shop, neighbours and stock gossip.

## Identity and voice
- Demisette: cold, proud, unsentimental elder; brushes off non-warlocks; respects survival above talent. Never warm.
- Sandahl: soft-spoken, exact, likes slow curses and soul shards; a friendly rivalry of method with Demisette (fear vs understanding).
- Jalane: calm, dry, philosophical about "shadow" as neither Light nor fel; refuses felcloth; discreet about priest customers.
- Jarel: steady, see-nothing barman; "stay away from the shadows"; poured for the stonemasons during the rebuilding.
- Katherine: stern, corrects posture, grieves the Silver Hand's losses to Arthas and the Scarlet Crusade's turn; respects dwarf paladins.
- Cassius: gentle, fussy, apologetic; every copper goes back to the Cathedral and the orphans; admires Benedictus.
- Tony Romano: smooth, ironic younger son of a minor house; hints (never names) a corrupt lord in the Keep's gardens; Osborne thinks him a fop.
- Lina: brisk, cheerful, pro-gun; ribs her brother Frederick; lost a crate of Ironforge rifles to the Defias road.
- Kathrum: Wildhammer burr (ye, nae, cousin, wee), gryphons, Aerie Peak, tattoos as stories, War of the Three Hammers, Grim Batol, hates Dark Irons.
- Bryan: plain, rim-rapping craftsman; shield-boy at the Burning of Stormwind; Crown pays "eventually".
- Darian: chatty, cheerful pyrotechnist; lost his Dalaran supplier; works with Lucan Cordell.
- Mattingly: gruff, loyal, two-war veteran; open gate for refugees; careful not to speak against Prestor until she's unmasked.
- Afrasiabi: precise, plan-proud, comically devoted to steam-engine siege history and boilers.
- Karter: brisk ex-cavalry; judges by rank; the battlegrounds (Stormpike Guard, Silverwing Sentinels, League of Arathor).

## Authored, not canon
- Demisette: a student killed by his own voidwalker; Gakin's numb hand; the coven borrowing the Lamb's furnace key.
- Sandahl: once nearly hanged at Nethergarde; his "understanding" method opposed to Demisette's.
- Jalane: handled felcloth twice and won't again; a young warlock who tried an imp on her for a discount.
- Jarel: Moonberry Juice for the cellar, a Thunderbrew keg by an Ironforge carter, poured for the masons.
- Katherine: "the Pure" began as a jest among her brothers in Lordaeron.
- Cassius: a candle-seller's son who delivered a box to the Cathedral at twelve; refugees in the side chapels.
- Tony Romano: younger son of a house "with more history than money"; leverage over his family; plays cards with Shaw.
- Lina: Frederick is her older brother; their father named the shop and died in the First War; the lost rifle crate.
- Kathrum: his gryphon Stormclaw; left Aerie Peak three winters ago over trolls and a quarrel.
- Bryan: shield-boy in the old garrison at the Burning; the Watch's crooked lion stencil.
- Darian: twenty years at the trade; a Dalaran rocket-maker friend lost; Lillian as his daughter (wiki: "probably related").
- Mattingly: served under Danath Trollbane as a corporal; a boy at the Burning of Stormwind.
- Afrasiabi: the backwards-copied map at Grim Batol in the Second War; four memoranda on putting adventurers under army command.
- Karter: former cavalry; the tiger's Sentinel groom.

## To confirm for Forever
- All NPC IDs (`TODO_NPC`) and the three quest titles. Whether Lord Tony Romano, Darian Singh and the PvP quartermasters (Karter) exist in Forever's Stormwind. Karter's war mounts are gated on `pvpRank = 11` (Commander, the Classic rank for war mounts).

## What they notice
- Demisette: paladins/priests (light), shaky low-level warlocks (weakness), strong high-level warlocks (fel).
- Sandahl: shard-laden warlocks, gnome warlocks. Jalane: skilled tailors, priests. Jarel: drunk players, Lamb-cellar origin.
- Katherine: warlocks, squires, dwarf paladins. Cassius: druids, former novices. Tony: stealthed players, minor nobles.
- Lina: named hunter pets, engineers. Kathrum: Wildhammer kin, worn axes. Bryan: broken gear, ex-Watch.
- Darian: mages, engineers. Mattingly: ex-Watch/military wards, Onyxia slayers. Afrasiabi: Nefarian slayers, engineers, knights of rank. Karter: rising rank, non-war mounts.
