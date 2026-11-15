# Changes: neutral depth pass

Every existing line id, condition and fact is kept, except where noted as a fix. Greetings, notices and reactions are untouched; each NPC's `nodes` and `topics` were rewritten. All listed NPCs now read "yes" in the coverage report's Depth table. Pack versions not bumped.

## RPGDialogue_Moonglade
- Keeper Remulos: hub with nine branches (the Circle and his quarrel with Staghelm; the Dream and its sleepers, Malfurion; his family: Ordanus, Celebras in Maraudon, Zaetar and the centaur; the glade and its wardens, Tajarri; Seed of Life turn-in; druid, priest, human and tauren replies). New lines for Seed of Life (active and done) and for non-druid visitors. Topics: background, advice, malfurion. The druid thread `the_circle` (b2/b5 beats) is untouched.
- Rabine Saturna: ledger, chance → Eldre'Thalas → Millicent Serene and the Felvine, Silithus → Layo Starstrike, Umber (human reply), a Skyborne reply (Eldre'Thalas), an echo of Remulos's Dream line. **Fix:** `h_locket`/`h_locket_done` were tied to Cataclysm quests (Unlocking the Secrets Within): now A Reliquary of Purity / Shards of the Felvine, rewritten to match. New Felvine and Wasteland lines.
- Dendrite Starblaze: trials → bear (strength of body and heart), the water trials (bauble, pendant halves), the poison lesson (Auberdine and the Crossroads, Cliffspring Falls and Dreadmist Peak), non-druid, pendant clues, Skyborne druid. **Fix:** `h_sealion` said the flight masters carry you to the trial; in the quest they give clues to the pendant halves. The druid thread beat b1 is untouched.
- Great Bear Spirit: teach → body / heart → ready, what it represents, a druid's blessing, a priest praying beside it, sitting still.
- Silva Fil'naveth, Bunthen Plainswind: why druids only (non-druid "exception" reply for Silva; Bunthen on Silva), and the Trial of the Sea Lion clues, by faction, from the quest.
- Bible: Classic quests, sources, Rabine and Dendrite are male, the Cataclysm-locket note, authored touches.

## RPGDialogue_Stonetalon
- Maggran Earthbinder: hardness → the wind; troubles → Bloodfury Ripper / the Venture Company; Besseleth → the bounty; Sun Rock's work → Braelyn; after the Ripper (questDone); Cairne (tauren). **Fixes:** `h_harpies` (the Bloodfuries are the source of Kalimdor's harpies, not "diving on scouts"), `h_spiders` (Webwinder Path, two-foot fang; no "bigger than a kodo"), `h_reserves` (a relief letter so Grish can see his family, not "we need more hands"), `h_bloodfury` named. New `h_ripper_dead`.
- Tammra Windfield: why → blessing; land → Venture Company; seeds → planting; Kaya (questDone), druid reply, the future (New Life done). **Fixes:** `h_kaya` (the quest is good news, Kaya is already safe), `l_default` (the Charred Vale is west of Sun Rock, not south).
- Braelyn Firehand: hate → grudge → the temple of Azshara; magic → the bucket full of holes; her master and Jaedenar; mage, warlock, druid and Ordanus replies; new `h_den` for The Den, `o_done` after Ordanus.
- Witch Doctor Jin'Zil: cages → the caged night elves → the brew; Darsok → Rokhan and Rexxar; spirits; after Forest Magic; Darkspear reply.
- Innkeeper Jayka: why the rock, news → Braelyn and her stew, a battle-story exchange (straight or tall).
- Keeper Albagorm: vale → Venture Company → Falfindel; age → temple → Horde raiders; the Talon Den; Faldreas (Journey); human reply (Jaina's expedition and Thrall at the peak in the Third War); priest reply. New `h_falfindel`.
- Innkeeper Faralia: visitors → the Keeper; roads → after dark (Teloren's flights); priest reply on Elune.
- Bible: detailed quest notes, sources, a faction note (Albagorm and Faralia are Alliance; Sun Rock is Horde-only), authored touches.

## RPGDialogue_ThousandNeedles
- Cliffwatcher Longhorn: high → lifts; Grimtotem → the three agents; the Galak → Splithoof Crag; Nataka; Highperch; Arnak dead and the secret notes (questDone). **Fixes:** `h_family` and `h_nataka` (a year since *Longhorn* last wrote, per Family Tree). Still no hint of his later betrayal.
- Rau Cliffrunner: hoof → its age and Splithoof Hold; moonwell → Zangen and the dryads' phials; listening; study (after the chain); druid reply. **Fix:** `h_flame` (the three-part chain shares one title: the line now fits all of it, moonwell water breaching the flame through the dryads' and centaurs' shared ancestry). New `h_hoof_done`.
- Hagar Lightninghoof: egg → serpent dens; why come; Arikara → Motega (after Alien Egg); a reply for players with a beast pet.
- Thalia Amberhide: bitter → the Grimtotem; Lakota → where she is; her brother, Arnak dead, tauren reply. **Fixes:** `h_default` (Lakota Windsong, not unnamed missing people), `h_free` (Thalia doesn't give Free at Last; she receives it), `h_names` (one knot for Lakota). New `h_home`. Quest title respelled "Free at Last".
- Innkeeper Abeqwa: news → Thalia; the mesa → harpies; guests (Highperch).
- Bible: detailed quest notes and the fixes.

## RPGDialogue_Zephras
- High Elder Talaanis Shadowsong: Skywall → the patrons → nobody knows where; the Windlord → Ansirem Runeweaver and Muln Earthfury; who are the Skyborne → Eldre'narr and Skywall; the orders → their leaders; the Shal'nan; the Council → Peacekeepers and Empyrean Blades; druid, mage and shaman replies. All from brief §10. Topics: background, advice.
- Bible: depth-pass note.

## Repo root
- `LORE_ADDITIONS_neutral_depth.md` (sourced facts and assumptions), this file.
