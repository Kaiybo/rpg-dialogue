# Stormwind, missed folk B  (npcs/missed_b.lua, missed_b2.lua, missed_b3.lua)

Keys: justine_demalier, karlee_chaddis, paige_chaddis, lieutenant_jackspring, master_sergeant_biggins, sergeant_major_clate,
sergeant_major_skyshadow, lisan_pierce, suzanne_mage, maldryn, theridran, sylista (missed_b.lua);
maria_lumere, owen_vaughn, steven_lohan, thurman_schneider, master_wood, mayda_thane, randal_worth, reese_langston,
seoman_griffith, wilhelm_strang, officer_brady (missed_b2.lua);
miss_danna, mikey_sw, pat_sw, steven_sw, twain_sw, roman_sw, william_sw, morgg_stormshot, thorfin_stoneshield,
ulfir_ironbeard, wilder_thistlenettle (missed_b3.lua).

## Sources
- warcraft.wiki.gg pages of each NPC, read through `tools/npc.py` (infobox, summary, quotes, notes). Classic-range NPC ids.
- Justine_Demalier (read: Stormwind recruiter, Trade District square, works with Melris Malagan, carries a great sword; her listed quests are Cataclysm and are not used).
- Karlee_Chaddis, Paige_Chaddis (read: long walk through the city with Gil, ending at Ancient Curios; Karlee's list for Charys; Fizzles the rabbit "was a great wizard").
- Lieutenant_Jackspring, Master_Sergeant_Biggins, Sergeant_Major_Clate, Sergeant_Major_Skyshadow (read: Champions' Hall; weapons, accessories, armour quartermasters; Skyshadow has no listed wares and is affiliated with Darnassus; Jackspring was once Gnomeregan Exiles).
- Lisan_Pierce, Suzanne (read: sit with Janey Anship at the foot of the Wizard's Sanctum debating a spell or potion; walk the canals and Trade District).
- Maldryn, Theridran, Sylista (read: druid trainers and stable master; in the Park before Cataclysm, so written in the Park; "Lion's Rest" is not used). Theridran: Heeding the Call.
- Maria_Lumere (Alchemy Needs), Owen_Vaughn (Essential Components), Steven_Lohan (Blue Recluse counter), Thurman_Schneider (child at Larson Clothiers; Package for Thurman).
- Master_Wood (read: outside the Command Center, Old Town; reacts to /rude, /wave, /bow, /salute, /flex).
- Mayda_Thane (Thane's Boots), Randal_Worth (Protective Hide; "a bit of a dandy but dependable"), Reese_Langston (Pig and Whistle; hearty welcome), Seoman_Griffith (leather armour; Alyssa Griffith a relative), Wilhelm_Strang (mail at Limited Immunity; Osric Strang a relative), Officer_Brady (patrols the streets).
- Miss_Danna, Pat, Steven, Twain, Mikey (read: school tour of the Cathedral, the Keep gate and the Valley of Heroes; the children's interruptions).
- Roman (fishes in the Canals with Justin and Brandon), William (ran off with Donna's doll Betsy; the Cataclysm reversal is not used).
- Morgg_Stormshot (smith), Thorfin_Stoneshield and Ulfir_Ironbeard (hunter trainers; Ulfir: The Hunter's Charm), Wilder_Thistlenettle (Miners' Union; brother Foreman Thistlenettle; cave-in in the Deadmines; Collecting Memories, Oh Brother. . .).
- Existing pack for neighbours: stormwind_more.lua (Karter on Clate), old_town.lua and unsung_oldtown.lua (Pig and Whistle, Protective Hide), unsung_mage.lua (Alchemy Needs, Wynne Larson on Thurman), canals.lua (Rema), park.lua (Sheldras), unsung_east.lua (Jenova), osric_strang.lua, angus_stern.lua.

## Their quests
- Theridran: Heeding the Call (druids from level 10; sends them to Dendrite Starblaze in Moonglade). `TODO_QUEST`.
- Ulfir Ironbeard: The Hunter's Charm (hunters from level 50; sends them to Ogtinc in Azshara). `TODO_QUEST`.
- Wilder Thistlenettle: Collecting Memories (Miners' Union cards from the undead miners), Oh Brother. . . (the foreman's Explorers' League badge). `TODO_QUEST`.
- Thurman Schneider: receives Package for Thurman from Rema (his sewing kit); reacts before and after.
- Everyone else: none of their own.

## Identity / voice
- Justine Demalier · human woman · brisk, cheerful, "mate"; soldier first, recruiter second.
- Karlee Chaddis · human woman · patient mother; keeps the last item on her list to herself.
- Paige Chaddis · small girl · Fizzles, "Mommy", believes Gil's story.
- Lieutenant Jackspring · gnome man · precise, ledgers and counts; weapons taller than he is.
- Master Sergeant Biggins · gnome man · fussy, cheerful; the small things hold the machine together.
- Sergeant Major Clate · dwarf man · gruff fitter of armour; loses at cards to Karter and doesn't mind.
- Sergeant Major Skyshadow · night elf woman · Sentinel, reserved; Ashenvale and Warsong Gulch.
- Lisan Pierce · human woman · earnest note-keeper; it is a spell. (Wiki gives no gender; written as a woman.)
- Suzanne · human woman · wry peacemaker; it is a potion.
- Maldryn · night elf man · serene; balance can be found inside stone walls.
- Theridran · night elf man · grave; sends the young to Moonglade.
- Sylista · night elf woman · gentle with beasts; speaks softly.
- Maria Lumere · human woman · practical; the one human at Alchemy Needs, does the haggling.
- Owen Vaughn · human man · dry; guesses the spell from the shopping list.
- Steven Lohan · human man · unflappable innkeeper of a mages' tavern.
- Thurman Schneider · boy · restless apprentice, cheeky, clever hands.
- Master Wood · human man · stern, formal; judges people by their greeting.
- Mayda Thane · human woman · blunt, kindly, "love"; reads boots.
- Randal Worth · human man · vain but good-natured; style first, technique catching up.
- Reese Langston · human man · hearty tavernkeeper, "friend"; sees a fight coming.
- Seoman Griffith · human man · quiet craftsman; honest about what leather can do.
- Wilhelm Strang · human man · patient; mail versus plate with Osric.
- Officer Brady · human man · brisk patrolman, "citizen"; never stops walking.
- Miss Danna · human woman · proper school mistress; "Children..."
- Mikey (grumbler), Pat (asks everything), Steven (the Mage Tower), Twain (the stick) · schoolchildren, short and childlike.
- Roman · boy · the doubter among three canal fishers.
- William · boy · breathless, on the run with Betsy.
- Morgg Stormshot · dwarf man · loud, hearty smith; burr.
- Thorfin Stoneshield · dwarf man · gruff, fond of beasts; burr.
- Ulfir Ironbeard · dwarf man · bluff marksman; burr.
- Wilder Thistlenettle · dwarf man · mournful survivor; burr, mining images.

## Authored, not canon
- Justine marched before she recruited; the regiments being away is the pack's standing premise.
- Jackspring's ledger column of people who tried to talk him round; Biggins a tinker's clerk in Gnomeregan; the borrowed-tabard punishment.
- Clate's knees and his cards; Skyshadow sent by Darnassus as a liaison for those who fight in Ashenvale (she sells nothing here).
- The Sanctum trio have argued for about a month; Lisan keeps the notes; Suzanne a middle child of five. What the spell does is never said.
- Maldryn and Theridran take students Sheldras sends them; Theridran's two druids who ignored the call.
- Sylista tended nightsabers on Teldrassil; she thinks well of Jenova.
- Maria owned Alchemy Needs before the night elves came; Owen's blue mouse; Steven's sheep at the bar and the cellar-spider story.
- Thurman hid his sewing kit under his bed on purpose; he watches the gryphons.
- Master Wood is a retired trainer who answers rudeness in kind (from the emote reactions).
- Mayda's shop carries her own name; the "soft sole" customers are the SI:7 hint already in the pack.
- Randal's oxblood jerkin; Reese repainting the sign; Seoman waxing chest pieces; the Strang family suppers.
- Mikey placed in Miss Danna's class (the wiki only says he roams the city; his id sits with her pupils). Which child says which of the tour interruptions is my assignment. Pat's report on Alleria or Kurdran.
- Roman's friends' crocolisk rumour (already told by a canal fisher in this pack); Justin's onion-selling uncle.
- William took the doll to prove he is faster.
- Morgg's kin were riflemen; Thorfin is kin to Jenova Stoneshield (the wiki says only "may be related"); Ulfir's best student in Loch Modan and the white ram above Kharanos.
- Wilder's mother in Ironforge; the company's contract to reopen the deep seams before the Defias took the mines.

## Never
- Cataclysm Stormwind: Lion's Rest, the destroyed Park, Justine's infiltrator quests, William chasing Donna, Stormwind Harbor.
- Anything after year 1; no promises of discounts or rewards.
