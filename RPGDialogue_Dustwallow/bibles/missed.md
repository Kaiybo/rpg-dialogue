# Dustwallow, the missed folk  (keys: mikal_pierce, amie_pierce, sara_pierce, dahne_pierce, bartender_lillian, smiling_jim, ingo_woolybush, brant_jasperbloom, jensen_farran, decedra_willham, dwane_wertle, clerk_lendry, brother_karman, combat_master_criton, combat_master_szigeti, captain_andrews, captain_thomas, guard_jarad, guard_lana, guard_tark, guard_edward, guard_kahil, guard_narrisha, guard_lasiter, guard_byron, pained, captain_wymor, ghokkah, zanara, krak_armorer, oggmarr, kagoro, paval_reethe)

## Sources
- warcraft.wiki.gg zone roster for Dustwallow Marsh; each page read through `tools/npc.py` (infobox, location, title, relatives). Wiki "Unknown/Deceased" statuses are the later Attack on Theramore; everyone here is alive in Classic.
- Pierce family (Mikal husband, Amie wife, Sara daughter "unnaturally small", Dahne son), Bartender_Lillian (drinks, Theramore inn), Smiling_Jim (James Hyal: ran the Shady Rest Inn, wife Lynn and son Jimmy died in the fire, "not the same", sits by the Theramore inn, brother Vincent in Menethil), Ingo_Woolybush (dwarf upstairs in the inn; Explorers' League before the later Jewelcrafting title), Brant_Jasperbloom (herbalism trainer), Jensen_Farran (bowyer; hunter training is later), Decedra_Willham (docks; directions to the Menethil Harbor ship), Dwane_Wertle (female chef, Foothold Citadel), Paymaster_Lendry (Classic name **Clerk Lendry**, Foothold Citadel; ends "James Hyal").
- Brother_Karman (paladin trainer outside Foothold Citadel near the dummies; with the Lordaeron forces in Stonetalon in the Third War), Combat_Master_Criton, Combat_Master_Szigeti, Captain_Andrews (Red Team Captain), Captain_Thomas (Blue Team Captain), Guard_Jarad / Guard_Lana / Guard_Tark (Red Team), Guard_Edward / Guard_Kahil / Guard_Narrisha (Blue Team), Guard_Lasiter (archer, always practising), Guard_Byron (guard in the town; his quests are the later 2.3 ones and are not used), Pained (night elf beside Jaina), Captain_Wymor (Sentry Point; his quests are the later 2.3 ones and are not used).
- Ghok'kah (tailoring supplies), Zanara (bowyer), Krak (ogre armorer), Ogg'marr (ogre butcher, meat and drink), Kagoro (orc; appears after Suspicious Hoofprints is turned in to Krog), Paval_Reethe (lieutenant, Kul Tiras marine at sixteen, deserter).
- Existing pack: theramore.lua (Vimes and the Shady Rest inquiry, "James Hyal hasn't said a word since"), more_folk.lua (Balos Jacken threw Reethe out for raiding the ogres' stores), brackenwall.lua (Krog sends Kagoro after the hoofprints), brackenwall_folk.md (Ogg'marr's "goose"; ogres speak in the third person), tharg.md; Wetlands menethil_more (Vincent Hyal).

## Their quests
- Clerk Lendry: `TODO_QUEST("James Hyal")` (from Vincent Hyal in Menethil; lines for active and done).
- Paval Reethe: reacts to `TODO_QUEST("Lieutenant Paval Reethe")` (his badge in the ashes). He does not solve the fire.
- Everyone else: none of their own.

## Identity / voice
- Mikal Pierce · human man · steady father; came with the fleet; "keep it standing for them".
- Amie Pierce · human woman · warm, watchful; counts children without looking; "dear".
- Sara Pierce · human girl · tiny and fearless; going to be a guard; salutes.
- Dahne Pierce · human boy · shy, follows Sara; wooden sword; shell in a sock.
- Bartender Lillian · human woman · brisk, kind, discreet; "love".
- Smiling Jim · human man · broken; still greets guests of an inn that burned; speaks of Lynn and Jimmy as only stepped out. Never mocked.
- Ingo Woolybush · dwarf man · hearty burr; maps everywhere; Explorers' League.
- Brant Jasperbloom · human man · mild, keen; the one man who likes the marsh.
- Jensen Farran · human man · plain bowyer; "the marsh eats arrows".
- Decedra Willham · human woman · brisk, cheerful dock hand; knows every sailing.
- Dwane Wertle · human woman · bossy, generous garrison chef; rivalry with Morgan Stern.
- Clerk Lendry · human man · precise, decent; everything is an entry in a ledger.
- Brother Karman · human man · grave paladin; prays the recruits never need their training.
- Combat Master Criton · human man · loud drillmaster; corrects your stance.
- Combat Master Szigeti · human man · quiet duellist; "watch the shoulder, not the sword".
- Captain Andrews · human man · bluff, competitive; Red Team; "the mud doesn't count".
- Captain Thomas · human man · dry, methodical; Blue Team; keeps the tally on a slate.
- Guard Jarad (Red) · cocky strong arm. Guard Lana (Red) · level-headed; the mud. Guard Tark (Red) · thinker who over-thinks.
- Guard Edward (Blue) · steady shield, earnest. Guard Kahil (Blue) · quick, grinning. Guard Narrisha (Blue) · cool planner.
- Guard Lasiter · human man · modest archer who never stops shooting.
- Guard Byron · human man · kindly, tired town guard; grieves for James Hyal.
- Pained · night elf woman · terse, watchful; gives away nothing about herself.
- Captain Wymor · human man · weathered road-watch captain at Sentry Point.
- Ghok'kah · orc man · gruff; thread keeps an army an army.
- Zanara · orc woman · sharp, proud hunter-bowyer.
- Krak · ogre man · slow, proud; third person; tests armor with a club.
- Ogg'marr · ogre man · jolly, evasive; third person; never quite sure what the meat is.
- Kagoro · orc man · quiet tracker, already leaving; "I do not guess".
- Paval Reethe · human man · jumpy, bitter deserter with nowhere left to go.

## Authored, not canon
- The Pierces came with Jaina's fleet from Lordaeron and both children were born in Theramore; Sara told Captain Thomas she is joining the Guard and he saluted her; Dahne's shell.
- Lillian brings James Hyal his supper; the dwarves' corner; Vimes drinking silently at the bar.
- Smiling Jim was away the night of the fire and walked to Theramore (how he survived is not in the source); his father was an innkeeper. None of his lines copy the in-game rhyme.
- Ingo's errand (what lies under the marsh: the Wyrmbog bones, the old ogre ruins) and his digs in Loch Modan and the Badlands.
- Brant gathered for Lordaeron's apothecaries; supplies Alchemist Narett and Doctor VanHowzen. Jensen learned bow-making in Kul Tiras.
- Decedra carries the mail sack; the monthly letter from Menethil (Vincent Hyal, unnamed).
- Dwane's name ("my father wanted a boy"), her ship's-cook past, the feud with Morgan Stern.
- Lendry was a harbour clerk and kept the fleet's manifest; his column for deserters.
- Karman "marched through Stonetalon" with the expedition and fought beside orcs at the end of the war.
- Criton/Szigeti's division of labour and pasts; every Red/Blue personality, the tally (Blue ahead by four or five), Lana's slip in the mud, Lana and Narrisha sharing a bunk room, Kahil the former runner, Edward's father, Tark the shipwright's apprentice, Jarad the net-hauler.
- Lasiter shot murlocs off the sea wall; buys all Farran's arrows. Byron had his first ale at the Shady Rest and talks angry townsmen down.
- Pained's reason for serving (a debt for Hyjal) is authored and kept vague; her later-novel role (bodyguard, spymaster) is only implied by where she stands. She refuses to explain her name.
- Wymor asked for the Sentry Point post; he leaves the burned inn to Vimes. (The wiki's "close friend of Jaina" is from later sources and unused.)
- Ghok'kah learned to sew in the internment camps and sews for the ogres; Zanara's raptor scar and Barrens past.
- Krak's stump-and-club test and the one armor that broke the club; Ogg'marr saving soft pieces for Tharg.
- Kagoro tracked for the Warchief's scouts; he states no conclusion about the prints.
- Reethe drank at the Shady Rest (his explanation for the badge); took meal from Brackenwall's stores; liked the Hyals. Who burned the inn stays open.

## Never
- The 2.3 Dustwallow revamp (Mudsprocket, Tabetha's Farm quest, "They Call Him Smiling Jim", the Defias/Grimtotem reveal chain, Captain Wymor's quests) and anything about the later destruction of Theramore.
- Naming who burned the Shady Rest. Jewelcrafting. Pained's novel storylines.
