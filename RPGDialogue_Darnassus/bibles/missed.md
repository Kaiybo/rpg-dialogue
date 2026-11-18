# Darnassus, the roster's missed folk  (keys: dar_golothas, dar_tolon, dar_cazarez, dar_silvalas, dar_anadyia, dar_andrus, dar_caynrus, dar_cyridan, dar_ealyshia, dar_glorandiir, dar_kieran, dar_melea, dar_merelyssa, dar_mythidan, dar_turian, dar_vinasia, dar_yldan, dar_ellaercia, dar_elynna, dar_faldron, dar_lalina, dar_milla, dar_saenorion, dar_sylvanna, dar_taladan, dar_trianna, dar_ulthir, dar_vaean, dar_alaindia, dar_anishar, dar_corand, dar_crildor, dar_cyroen, dar_faelyssa, dar_fyrenna, dar_huntress_ravenoak, dar_huntress_skymane, dar_jareth_wildwoods, dar_sarin_starlight, dar_dalia_sunblade, dar_voloren)

Files: npcs/missed.lua (Tradesmen's Terrace), npcs/missed2.lua (Craftsmen's Terrace), npcs/missed3.lua (Enclave, Temple, gardens, Warrior's Terrace, the walkways).

## Sources
- warcraft.wiki.gg, one page per NPC (infobox: title, gender, location), read through `tools/npc.py`. All are Classic-range ids; "status unknown" on the wiki refers to the Burning of Teldrassil, which is not used.
- Wiki facts used: Anadyia and Andrus share a shop; Faldron and Telonis teach Darianna; Vaean stands beside Taladan; Milla is the journeyman and Sylvanna the expert alchemy trainer in Classic; Alaindia wanders between the Temple of the Moon and the Temple Gardens; Crildor walks slowly between the Cenarion Enclave and the Temple Gardens and sits by a lake; Ravenoak and Skymane patrol the walkways; Sarin Starlight wears a breastplate over a robe; Corand and Faelyssa were a tracking and a lockpicking trainer in the original beta (used only as a hint of what they are good at).
- Existing pack: terraces.lua (Darianna on Faldron and Telonis), unsung.lua (Ainethil, Sildanair, Lysheana, Shalumon), more_folk.lua (Talaelar fishing the Temple lake), enclave.lua and prejudices.lua (Syurna, Erion Shadewhisper), darnassus_folk.lua (Landria).
- Not used: Aladrel Whitespire and the Shen'dralar in Darnassus (Cataclysm); anything from the Burning of Teldrassil.

## Their quests (TODO_QUEST by title)
- Trianna: Camping 101: Tailoring (a Forever quest; the wiki has no page for the tailoring one, so it is written from its Cooking sibling: learn the craft's basics from the trainer to furnish a camp, more as skill grows).
- Sentinel Dalia Sunblade: Eyes of the Sentinels (a Forever quest with no wiki text; written only as "travellers serve as the Sentinels' eyes and report what they see", with no objectives named).
- Everyone else: service only.

## Identity / voice
**Tradesmen's Terrace**
- Auctioneer Golothas · senior, measured, dry; treats bidding as a rite and a strange new habit.
- Auctioneer Tolon · brisk, cheerful; bidding is a hunt.
- Auctioneer Cazarez · precise, reserved; keeps the ledgers, prefers ink to memory.
- Auctioneer Silva'las · youngest, curious about outlanders; learns the world from its goods.
- Anadyia · gracious, exacting robe seller; plain cuts; wary but courteous about arcane casters.
- Andrus · gentle, wry staff merchant; fallen wood only; long friendly quarrel with Anadyia.
- Caynrus · steady, blunt shield merchant; somebody has to stand in front.
- Cyridan · quiet leather seller; judges customers by how loudly they walk.
- Ealyshia Dewwhisper · confident, teasing; big weapons, gentle family name.
- Glorandiir · solemn axe merchant; axes for war, never for trees.
- Kieran · affable generalist who knows every neighbour's stock.
- Melea · forthright, protective mail seller; fusses over fittings.
- Merelyssa · poised, sharp blade merchant; care of the edge.
- Mythidan · mild mace and staff seller; blunt weapons for those uneasy with blood.
- Turian · playful thrower; tests every knife on a post.
- Vinasia · serene cloth seller; the mender is guarded by those she mends.
- Yldan · amused bag merchant who owns one small satchel.

**Craftsmen's Terrace**
- Ellaercia · artistic, particular tabard designer; asks what a guild stands for.
- Elynna · kindly, talkative thread seller; calls people "dear".
- Faldron · patient, dry; sighs, then corrects kindly; fond of Darianna and hides it.
- Lalina Summermoon · earnest, careful apprentice enchanter; accepts being watched.
- Milla Fairancora · cheerful, eager junior alchemy apprentice; spills things.
- Saenorion · gruff, fair supplies seller; hard on waste.
- Sylvanna Forestmoon · composed, wry senior apprentice; keeps an eye on Milla.
- Taladan · quiet, exact enchanting trainer; every enchantment is paid for with something unmade; works in the open.
- Trianna · bright, encouraging apprentice tailor; camp craft for adventurers.
- Ulthir · fussy, kindly glass-and-herb seller; winces at clinking.
- Vaean · soft-spoken, watchful; counts his dust.

**Elsewhere in the city**
- Alaindia · serene walking reagent seller, once a Temple novice.
- Anishar · wry, guarded rogue trainer; the talkative one of the three in the hollow.
- Corand · quiet tracker in the Enclave.
- Crildor · gentle, content walker who rests by the lake and thinks well of strangers.
- Cyroen · earthy gardener selling druids' reagents in the Enclave.
- Faelyssa · sly, amused opener of locks who takes nothing.
- Fyrenna · warm, firm; feeds the Warrior's Terrace.
- Huntress Ravenoak · brisk, stern mounted patrol.
- Huntress Skymane · brisk, proud mounted patrol; gentle with her saber.
- Jareth Wildwoods · restless young city elf who wants a real forest.
- Sarin Starlight · courtly star-watcher, robe and breastplate.
- Sentinel Dalia Sunblade · disciplined, direct Temple guard who gathers reports.
- Voloren · placid, wry fishing-supplies seller; speaks softly for the fish.

## Authored, not canon
- The division of labour among the four auctioneers (Golothas senior, Cazarez on ledgers, Cazarez and Silva'las joining later); Tolon once a Darkshore trader; the ticking gnomish device.
- Which merchants are neighbours beyond Anadyia and Andrus is left as "down the terrace"; Andrus gathers only fallen wood and notes Teldrassil sheds a lot; Caynrus fought on Hyjal; Cyridan was a scout; Ealyshia's gentle family; Glorandiir asks buyers their purpose; Turian's testing post; Vinasia once served in the Temple; Yldan's daughter's river stone.
- Me'lynn as Trianna's teacher (Classic tailoring trainer); Elynna's dyes; Milla's green hair; Ainethil's rule of tasting each batch; Saenorion once ran the curing sheds; a Sister checking Vaean's tally; Ulthir's padded basket.
- Alaindia's walking prayers; Anishar's account of rogues watching the Ashenvale logging camps; Corand's gnome prints; Faelyssa's friendship with the rogue trainers; Fyrenna sending bread to the walkways.
- The huntresses ride nightsabers and split the round between them; Skymane raised hers from a cub.
- Jareth's mother and his training; Sarin's nightly star-watching and his reason for the breastplate.
- Crildor is an in-game memorial to a fansite moderator; nothing of the real person is used. His lines about small companies of strangers and shared fires are a quiet nod only.
- Dalia's reasons for wanting travellers' reports; the Sunblade family is mentioned by name only.
- Voloren's teasing of Talaelar (matches Talaelar's own entry) and his Lake Al'Ameth advice.

## Never
- The Burning of Teldrassil, the Shen'dralar or mages in Darnassus, night elf mages, Cataclysm changes to the terraces.
- Promises of discounts, gifts or rewards.
- Named objectives or rewards for the two Forever quests until their text is captured.
