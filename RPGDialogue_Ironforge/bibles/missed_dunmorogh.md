# Dun Morogh, missed folk  (keys: adlin_pridedrift, alamar_grimm, branstock_khalder, grundel_harkin, rybrad_coldbank, mortar_angus, mortar_shorty, spotter_klemmy, rifleman_middlecamp, rifleman_wheeler, bronk_guzzlegear, loslor_rudge, yarr_hammerstone, burdrak_harglhelm, keeg_gibn, tristane_shadowstone, gretta_ganter, paxton_ganter, turuk_amberstill, ultham_ironhorn, narm_faulk, yori_crackhelm, wagner_hammerstrike)

Files: npcs/missed_dunmorogh.lua (Anvilmar, the mountaineers' camp), missed_dunmorogh2.lua (Steelgrill's Depot, Brewnall, Iceflow Lake), missed_dunmorogh3.lua (Amberstill Ranch, Narm Faulk, Yori, Wagner).

## Sources
- warcraft.wiki.gg pages of the same names, via `tools/npc.py` (infobox, location, quest lists). Classic ids 829, 460, 10610, 837, 1702, 3162, 8508, 1104, 1697, 1694, 6177, 1700, 10804, 10803, 945, 10611, 10805, 11807, 3177, 4772, 15011, 5392, 11941.
- Alamar_Grimm (read: Classic post is Anvilmar; blames adventurers for Gnomeregan; thinks the dwarves would rather help humans than retake it). New Tinkertown is Cataclysm and is not used.
- Branstock_Khalder (read: easy-going; worried about the troggs; sends priests on to Maxan Anvol in Kharanos). Existing pack: Sten Stoutarm says "don't let him tell ye jokes" (dunmorogh.lua).
- Loslor_Rudge (read: supplies Hegnar Rumbleshot; courier took a shortcut, camped near the Grizzled Den, chased off by wendigo).
- Angus / Shorty / Spotter_Klemmy / Rifleman_Middlecamp / Rifleman_Wheeler (read: camp east of the Coldridge Valley entrance, a shooting range with dummies; the mortar team sometimes hits Klemmy for a joke; Wheeler laughs and flexes, Middlecamp gets frustrated).
- Narm_Faulk (read: paladin, Silver Hand; killed by Dark Irons saving Muiredon Battleforge south of Helm's Bed Lake; raised by a young paladin with the Symbol of Life). Existing pack: Tiza and Muiredon Battleforge in mystic_ward.lua.
- Gretta_Ganter / Paxton_Ganter (relatives of each other; Forever quests Frosthowl and Camping 101: Fishing, which teaches a Fish Bowl). Frosthowl (wendigo, Grizzled Den, drops a Sack of Fish).
- Turuk_Amberstill (relatives Veron, Yarlyn, Rudra, Pol). Existing pack: rudra_amberstill, Vagash (dunmorogh_roads.lua).
- Wagner_Hammerstrike (Harvest Festival fireworks vendor at the Gates of Ironforge; Honoring a Hero = Uther's Tomb). Yori_Crackhelm (Thunderbrew Distillery; the Collector's Edition "Welcome!" voucher).

## Their quests
- Alamar Grimm: gnome warlock start (Beginnings: Frostmane feather charms), hinted only, no quest ids used.
- Branstock Khalder: Hallowed Rune (reacts while active); points priests on to Maxan Anvol (In Favor of the Light, not named).
- Loslor Rudge: Ammo for Rumbleshot (before / active / done).
- Gretta Ganter: Frosthowl (Forever; before / active / done). Paxton reacts to it done.
- Bronk, Yarr, Paxton: Camping 101 (Forever) turn-ins; each mentions a camp item once the player has the profession, and teaches the `camping` topic. No quest ids used.
- Narm Faulk: The Tome of Divinity (the Symbol of Life, then Dark Iron script as proof for the Senate). Uses no quest conditions; he can only be talked to once raised.
- Turuk Amberstill: reacts to Protecting the Herd (Rudra's) done.
- Yori Crackhelm: Welcome! (voucher greeting only; promises nothing specific).
- Wagner Hammerstrike: Honoring a Hero (active / done).

## Identity / voice
- Adlin Pridedrift · dwarf man · cheerful shopkeeper; sizes recruits up by what they forgot to pack; kin to Nori.
- Alamar Grimm · gnome man · bitter, precise, sardonic; measures everything ("approximately", "a measurable improvement"); grieves Gnomeregan by being angry at everyone else. Softer with warlocks and gnomes.
- Branstock Khalder · dwarf man · jovial priest; bad jokes, real care for the recruits; the three virtues in dwarven terms.
- Grundel Harkin · dwarf man · gruff armorer; judges buckles before faces; proud of a flattened helm with a live head in it.
- Rybrad Coldbank · dwarf man · loud, hearty weaponsmith; axe for what bleeds, hammer for troggs.
- Angus · dwarf man · mortar aimer; half deaf, shouts, cheerful. Blames Shorty.
- Shorty · dwarf man · mortar loader; dry and sly; blames Angus. Not actually short.
- Spotter Klemmy · dwarf man · long-suffering, sooty; puts up with the jokes because the crew never drops one short when it matters.
- Rifleman Middlecamp · dwarf man · serious, prickly, careful shot; privately respects Wheeler.
- Rifleman Wheeler · dwarf man · cocky, laughing, fast shot; privately respects Middlecamp.
- Bronk Guzzlegear · dwarf man · loud engineer; dwarven-versus-gnomish pride, but fair about the refugees.
- Loslor Rudge · dwarf man · harried, worrying storekeeper, always counting.
- Yarr Hammerstone · dwarf man · slow, patient miner who listens to walls.
- Burdrak Harglhelm · dwarf man · plainspoken tanner.
- Keeg Gibn · dwarf man · jolly gossip; diplomatic about Thunderbrew versus Barleybrew.
- Tristane Shadowstone · dwarf woman · watchful, restless; walks to the bend in the road and back.
- Gretta Ganter · dwarf woman · brisk, practical; runs the stall. Paxton Ganter · dwarf man · placid, soft-spoken; watches his float.
- Turuk Amberstill · dwarf man · blunt smith; the Amberstill who can't abide rams.
- Ultham Ironhorn · dwarf man · hearty, teasing riding master; rams are loyal, not friendly. Dwarves (or exalted with Ironforge) only.
- Narm Faulk · dwarf man · grim, grateful paladin just back from death; no self-pity; fond of Muiredon.
- Yori Crackhelm · dwarf man · chatty self-appointed welcomer of Kharanos.
- Wagner Hammerstrike · dwarf man · solemn but warm festival-keeper.

## Authored, not canon
- Gretta and Paxton as wife and husband (the wiki only says relatives); Paxton slept through the theft; red cloth on the hook.
- Frosthowl stole Gretta's sack of fish off the ice (the wiki gives only the quest name, the wendigo and the Sack of Fish drop); Tristane's prints and Keeg's gossip tie into it.
- Tristane as the village's unofficial lookout (the wiki only has her walking down the road and back).
- Klemmy is hit with smoke-only practice charges; Shorty's snow-in-the-boots grudge; the trogg that threw a shell back.
- Middlecamp and Wheeler shoot ten rounds each, loser cleans both rifles; the camp exists to watch the Coldridge Pass.
- Adlin's "cold end" of a family of haulers; Turuk trained at the Great Forge; Yarr's wall-tapping; Loslor's new courier.
- Branstock took up the Light after the Second War; his jokes.
- Narm's account of the ambush (four spies, an unseen sentry) and of telling Muiredon to run (the latter matches Muiredon's lines in mystic_ward.lua).
- Yori welcomes people out of principle and is paid by nobody; Wagner's father marched beside the Silver Hand.

## Never
- Cataclysm Dun Morogh: New Tinkertown, the Coldridge quake and airlift, Frostmane retreat, Grundel's Cataclysm quests (Dwarven Artifacts, Make Hay While the Sun Shines), the comic's giant Frostmane troll.
- Tristane's Cataclysm hunter quest. Later Harvest Festival changes.
- Promises of gifts, pets, discounts or training the addon can't deliver.
