# Changelog

All notable changes to RPG Dialogue. The core and each content pack get their own version numbers once they exist (see DESIGN.md §1).

## 0.30.0 (2026-11-15)
Packs: every content pack has a new version (World 1.18.0, Stormwind 1.6.0, Elwynn 1.10.0, Stranglethorn 1.6.0, Westfall 1.4.0, Redridge 1.3.0, Duskwood 1.3.0, Riverglades 1.3.0 and the rest; `python3 tools/version.py` lists them). No new folders, but **three new files** (Elwynn's Eastvale stables, Hillsbrad's Raleigh, World's Hillsbrad rumors): **exit the game fully and start it again**; /reload won't load new files.

### People talk like people
The user: "The writing is too choppy where it seems characters want to have one liners 'He did. I didn't' kinda stuff. Have them talk like normal people, have the writing be more authentic to WoW."
- The old house style asked for 1-3 short sentences and called fragments "a voice". About a quarter of all lines read like telegrams ("Big. Angry. Southwest.").
- Every line in every pack has been rewritten in whole sentences, in Warcraft's register: concrete, a little old-fashioned, spoken to you. Each character keeps their own voice (a dwarf's burr, a goblin's pitch, a Forsaken's chill), now without chopping it up. Ids, conditions, effects and facts are unchanged.
- The voice checker now fails any line with two short sentences in a row, or three in one line; the validator no longer nags about longer lines. CONTENT_GUIDE section 2 has the new rule and before/after examples.

### Deeper everywhere a human goes
- Every NPC in Stormwind, Elwynn, Westfall, Redridge, Duskwood, the Wetlands, Hillsbrad (Southshore and Tarren Mill), Ironforge and Dun Morogh, Loch Modan, Darnassus, Teldrassil, Darkshore and Ashenvale now meets the depth standard: a hub with several branches, their own story and advice, and replies only some characters get. 296 of 409 NPCs meet it (102 at the start of this release).
- For a human priest throughout: blessings, prayers for the dead, the Light and Elune, Shadowform, and the Northshire novice background. For every race and class where a person would really react to them.
- Many quest references checked against Classic and fixed (Cataclysm and Burning Crusade quests that slipped in, wrong quest givers, invented family histories removed). Lore notes for all of it in LORE_NOTES.md.

### The Scarlet Path (a new throughline)
Brother Crowley recruits in the Cathedral's lower level, Brother Anton sends you through the Valley of Bones, and his letter takes you to Raleigh the Devout in Southshore (new), who left the Crusade after what he saw at the Monastery. Then you decide whether Anton hears the truth. Crowley, Benedictus and Tyrosus react.

### Also
- **The Mirage Raceway** to the depth standard (Pozzik, Fizzle, Kravel), with three lines that contradicted their quests fixed.
- **A first horse at 40:** Katie and Randal Hunter at the Eastvale stables (new).
- **Reputation condition:** `reputation = { faction = "Stormwind", min = "exalted" }`. An exalted non-human can buy Katie's horses, as in the game.
- **34 new Ask about topics**, from SI:7 and the Stockade to Grim Batol, the Sentinels and the troggs.
- Lines that called every player "lad" or "brother" now follow the player's gender.
- Fixed: Galiaan and Gryan in Westfall now register what they tell you about the harvest watchers. A doubled field had been dropping it.

## 0.29.0 (2026-11-14)
Packs: World 1.16.0, Stormwind 1.5.0, Elwynn 1.9.0, Stranglethorn 1.5.0, Riverglades 1.2.0, Dustwallow 1.3.0, Feralas 1.3.0, Desolace 1.3.0, Arathi 1.3.0, EasternPlaguelands 1.2.0, Badlands 1.2.1, Felwood 1.1.1, UnGoro 1.2.1, Winterspring 1.2.1 (the rest as in 0.28.0). No new folders: /reload is enough.

### For a human priest
The user: "Develop whatever you think needs developing. My main is a human priest."
- **The Cathedral of Light:** Archbishop Benedictus has much more to say, including, if a priest asks about shadow, a bishop after the First War who went too far into it. New: High Priestess Laurena, Brother Joshua and Brother Benjamin (the priest trainers), and Brother Crowley, the Scarlet Crusade's emissary in the catacombs.
- **Stormwind's leaders:** Bolvar (the Church, Lady Prestor, the refugees), Anduin and Katrana have new branches. "Something else" goes back to the start instead of ending the conversation.
- **Priest trainers everywhere:** Anetta and Josetta, and every unnamed priest trainer, now have a real conversation: what to practise, Light or shadow, whether they tire of healing. A new origin: Novice of Northshire Abbey.
- **On the road, levels 30-45:** priest-only replies where someone would genuinely want a priest. Pray over Doren's dead, say words for Smotts' crew, bless Demar's riders at dawn, sit with James Hyal, bless the Stromgarde badges, be Pentigast's chaplain, ask Jaina whether the Light still answers her, ask Shandris about Elune, and ask Tyrosus what the Dawn needs from a healer.

### Shadowform
- People notice a priest in Shadowform: trainers won't teach through it (no Holy spells in that shape), Benedictus asks to see your face, Crowley wants it off, Anduin wants to know if it hurts, children think you're a ghost, and guards get a fright.
- **Fixed:** shape reactions fired on any change. Entering Shadowform made Eastern Plaguelands guards call you a druid's beast; warrior stance swaps and stepping out of a form set them off too. Now only taking a visible shape counts, stances and stealth are not shapes, and every zone's beast-shape line names the shapes it means. The validator warns when one doesn't.

## 0.28.0 (2026-11-14)
Packs: World 1.15.0, Riverglades 1.1.0, Dustwallow 1.2.0, Tanaris 1.2.0, Feralas 1.2.0, Hinterlands 1.2.0, Desolace 1.2.0, Arathi 1.2.0, UnGoro 1.2.0, Winterspring 1.2.0, SearingGorge 1.1.0, EasternPlaguelands 1.1.0, Felwood 1.1.0, Badlands 1.2.0 (the rest as in 0.27.0). No new folders: /reload is enough.

### Deeper conversations where an Alliance character goes next
The user: "Develop whatever you think needs developing." The depth rewrite from 0.26.0 (hubs, branches, replies for particular characters, their own story and advice), for every Alliance and neutral NPC in the 30-60 zones:
- **Theramore:** Jaina, Tervosh, Captain Vimes, Adjutant Tesoran, Janene. **Gadgetzan and Steamwheedle Port:** Marin, Sprinkle, Bilgewhizzle, Fizzledowser, Pestlezugg, Tran'rek, Fizzgrimble, Stoley. **Feathermoon:** Shandris, Pratt, Shyria. **Aerie Peak:** Falstad, Talonaxe, Fraggar, Thulfram. **Nijel's Point:** Pentigast, Marandis, Kreldig, Brother Anton, Lyshaerya. **Refuge Pointe:** Captain Nials.
- **Marshal's Refuge:** Williden, Linken, J.D. Collie, Spraggle. **Everlook and the springs:** Vizzie, Umi, Gregor, Donova, Mau'ari. **Thorium Point:** Oilfist, Hansel, Lolo, Kalaran. **Light's Hope and the river:** Tyrosus, Leonid, Tirion. **Felwood:** Eridan, Greta, Arathandris, Golhine. **The Badlands:** Ryedol, Lotwil.
- Some of the replies only some characters get: a dwarf shaman is welcomed by a Wildhammer shaman; a Bronzebeard dwarf faces a Dark Iron who was raised to hate them; a paladin asks Tyrosus where paladins belong now; Lordaeron refugees talk to Jaina and Nials; a hunter takes Shandris's archery test; the Forsaken ask Gregor and Leonid whether the Dawn will have them.
- 48 NPCs in all; with Stranglethorn and the Riverglades, 92 meet the depth standard (4 at the start of the day).

### The lost of Farholde (a new throughline)
Fern Crimsonleaf went into the Horde's camp the night before the charge that broke the Siege of Farholde, and never came back. Gray Dawnbright won't believe she's dead; Ashe remembers what her father said about her; Cady warns you off asking Demar; Demar says it once. Then you decide what to carry back to Gray, and both of them remember. Nobody ever learns what happened to her.

## 0.27.0 (2026-11-14)
Packs: World 1.14.0, Stranglethorn 1.4.0, and a new one: **Riverglades 1.0.0** (the rest as in 0.25.0). **New folder: exit the game fully, copy RPGDialogue_Riverglades in, and tick it.**

### Ask about, Morrowind-style
The user: "Develop the 'Morrowind' style 'ask about' more deeply."
- **You pick topics up by hearing them.** When someone in the box names a person, place or trouble the addon knows (the Defias, Hogger, the Bloodsail, the Siege of Farholde...), you learn it, and the word is highlighted. **Click it to ask them about it.** The text types out plain and the links appear when it finishes. Hover a word to see "Ask about ...". Settings: "Highlight topics in what people say" (on by default; off still learns them).
- **Anyone can be asked:** Their story, Their work, A little advice, Latest rumors. These are always in the list, first. Named people tell their own story or politely don't; everyone else answers from their role (guards, innkeepers, smiths, flight masters, children, priests, soldiers, farmers, peons...). Anyone passes on the rumors going round their zone, not only innkeepers.
- **Answers lead somewhere.** Some answers open that subject's replies: ask Demar Brant about Fern Crimsonleaf and you're in that conversation.
- **The list** is grouped by category under headers ("Ask anyone" first, then people, places, threats, history...), flat while you search. Topics you've already asked this person about say "(asked)". Keys and the gamepad skip the headers.

### The Riverglades (new zone)
Forever's new zone, Alliance and neutral first, from the wiki and Blizzard's announcements (LORE_NOTES "The Riverglades"):
- **Farholde Keep:** Knight Commander Demar Brant and twenty years of the Brotherhood of the Horse; Ashe Amberhall, his advisor, who thinks Stormwind made the sensible choice and fights anyway; Sergeant Riftan at the front; Sister Rowland and the sick in the chapel; Cady Lloydriel, her dog and cat and the cradle she won't explain; Wheatley, Gretchen Mayberry and Alphonse Dumas; the sentries.
- **Outside the walls:** Hurley and Halligan Turner at the logging camp, Benjy Wheeler at Wheeler's Grange.
- **Powderfuse Port:** Melbin Powderfuse, who built all of it (he says); Innkeeper Zizplink; Gray Dawnbright, drinking, who won't believe Fern Crimsonleaf is dead; Jazzle's arena with no fights yet; Fimbo's cafe; Argo and his sea monster; Gritta's chum.
- Questions left open on purpose: was Stormwind cowardly or sensible? Is Fern alive? Did Cho'gall come here? Did Melbin build the port?
- Horde (Rog'mar, Bolder'ok) is still to come.

### Also
- Validator: an error when two packs use the same NPC key for two different people (they'd merge into one). It caught `gretchen` (Gretchen Dedmar in Brill, Gretchen Mayberry in Farholde).
- "Sentry ..." NPCs are guards; Farholde's laborers, scouts and sick soldiers are pooled.

## 0.26.0 (2026-11-14)
Packs: Stranglethorn 1.3.0 (the rest as in 0.25.0). No new folders: /reload is enough, restarting is safest.

### Conversations you can explore
The user: "there needs to be more density for each NPC... only a few dialogue choices and they don't lead very deep, and I'm given effectively one dialogue option."
- **A hub to come back to.** The opening is a hub; each reply opens a subject that runs two or three exchanges deep, then "Something else." brings you back. The NPC says a short "what else?" line in their own voice instead of repeating their introduction.
- **Asked and answered.** A subject you've already been down in this conversation disappears from the list. On your next visit it's back, dimmed, after the subjects you haven't tried.
- **Up to six replies** at once (was four), in the writer's order. When there are more, subjects you've explored drop first, then the ones everybody gets; replies that exist because of who you are (your class, race, origin, a quest you've done, someone you've talked to) stay.
- **A depth standard** for writers (CONTENT_GUIDE §7a), measured per NPC in the coverage report's new "Depth" table.

### Stranglethorn Vale, rewritten for depth (Alliance and neutral first)
Every NPC you can talk to as Alliance: the Rebel Camp (Doren, Nimetz, Thorsen), Nesingwary's Expedition (Hemet, Barnil, Ajeck, Erlgadin) and Booty Bay (Revilgaz, Seahorn, Krazek, MacKinley, Kebok, Skindle, Smotts, Shaky, Crazz, Crank Fizzlebub, Whiskey Slim, Drizzlik, Sprogger, Fin, Lozgil). Each has 4 to 7 subjects; the larger ones run to 15 or 20 exchanges. Some replies only appear for some characters: a warrior or paladin tells Doren about a bad order they once followed, a priest prays with Nimetz, an alchemist reads his residue, a refugee tells Smotts what they did after losing everyone, a hunter compares bows with Ajeck, a noble-born character faces Erlgadin. Grom'gol (Horde) is next for the Horde pass.

## 0.25.0 (2026-11-14)
Packs: Arathi 1.1.0, Ashenvale 1.1.0, Badlands 1.1.0, Barrens 1.2.0, Darkshore 1.1.0, Darnassus 1.1.0, Desolace 1.1.0, Durotar 1.1.0, Duskwood 1.2.0, Dustwallow 1.1.0, Elwynn 1.8.0, Feralas 1.1.0, Hillsbrad 1.1.0, Hinterlands 1.1.0, Ironforge 1.3.0, LochModan 1.1.0, Moonglade 1.1.0, Mulgore 1.2.0, Orgrimmar 1.2.0, Redridge 1.2.0, Silverpine 1.1.0, Stonetalon 1.1.0, Stormwind 1.4.0, Stranglethorn 1.2.0, SwampOfSorrows 1.1.0, Tanaris 1.1.0, Teldrassil 1.2.0, ThousandNeedles 1.1.0, ThunderBluff 1.2.0, Tirisfal 1.1.0, UnGoro 1.1.0, Undercity 1.1.0, Westfall 1.3.0, Wetlands 1.1.0, Winterspring 1.1.0, World 1.13.0, Zephras 1.0.1, and three new ones: Felwood 1.0.0, Searing Gorge 1.0.0, Eastern Plaguelands 1.0.0. **New folders: exit the game fully, copy them in, and tick them.**

### More to say, second round
Repeat visits bring personal lines (habits, worries, running jokes) and night-time lines for most of the NPCs who only talked about their quests: Elwynn's class trainers and the Northshire and Eastvale folk; Westfall (Gryan, the Saldeans, the Furlbrows, Danuvin, Galiaan, Grayson, Daphne, Heather, MacGregor); Redridge and Duskwood (the paladin's road); Stormwind (Arthur the Faithful tells his story; Samuelson won't rest until King Varian comes home); Durotar (Kaltunk and Galgar remember the camps), Orgrimmar, Freewind Post; and the innkeepers and thinnest quest givers everywhere else. Neighbours now remark on each other once you've met both (Goldshire, Bloodhoof, Dolanaar, Thunder Bluff).

### Stranglethorn Vale (the user is questing there)
- **Nesingwary's Expedition.** Hemet Nesingwary and his hunts (raptors, King Bangalash), Barnil Stonepot and the scattered pages of The Green Hills of Stranglethorn, Ajeck Rouack and the tiger Sin'Dall, Sir S. J. Erlgadin, who walked out of the House of Nobles over the stonemasons.
- **Booty Bay.** Captain Hecklebury Smotts and his three sea giants (and Sprogger, his cook, the only other survivor), Fin Fizracket and his Stranglethorn Fever, Wharfmaster Lozgil watching the docks, "Shaky" Phillipe and his debt, First Mate Crazz and the Bloodsail, Crank Fizzlebub's schemes (and his arrangement with Kravel at the Raceway), Whiskey Slim's lost port, Drizzlik's Emporium.
- **The Rebel Camp.** Private Thorsen, who spied inside Kurzen's force and nearly didn't come out.
- Everyone already in the pack (Revilgaz, Seahorn, Krazek, MacKinley, Kebok, Skindle, Grom'gol, the Rebel Camp) gets repeat-visit and night lines, and neighbours remark on each other.

### New places
- **Searing Gorge.** Thorium Point: Overseer Oilfist (how the Brotherhood escaped Ragnaros), Hansel Heavyhands (always just sat down), Lookout Captain Lolo Longstriker (blind, and suspicious of a certain grieving stranger); Kalaran Windblade, whose story about his father is a claim the game will settle. Guard names "... Lookout".
- **Eastern Plaguelands.** Light's Hope Chapel: Lord Maxwell Tyrosus, Leonid Barthalomew the Revered; Tirion Fordring by the river with Mirador (Eitrigg, his exile, his son); Nathanos Blightcaller at the Marris Stead (Horde).
- **Felwood.** The Emerald Sanctuary: Eridan Bluewind (who makes Linken's totem), Greta Mosshoof, Maybess Riverbreeze for the Horde and Arathandris Silversky for the Alliance, cleansing the forest a little each day. Bloodvenom Post: Winna Hazzard, cackling, with a kitten; Trull Failbane, Orgrimmar's eyes in the forest; the braves. Talonbranch Glade: Golhine the Hooded, druid trainer.

## 0.24.0 (2026-11-14)
Packs: World 1.12.0, Elwynn 1.7.0, Ironforge 1.2.2, Mulgore 1.1.0, Thunder Bluff 1.1.0, Teldrassil 1.1.0, The Barrens 1.2.0, Ashenvale 1.1.0, Stonetalon 1.1.0, Darkshore 1.1.0, Darnassus 1.1.0, Moonglade 1.1.0, and six new ones: Swamp of Sorrows 1.0.0, Arathi Highlands 1.0.0, The Hinterlands 1.0.0, Badlands 1.0.0, Un'Goro Crater 1.0.0, Winterspring 1.0.0 (the rest as in 0.23.0). **New folders: exit the game fully, copy them in, and tick them.**

### Staying in the box
The user: "make sure there aren't options that bring up the normal menu as much as possible." With "Keep the NPC's menus, pages and quests in the conversation box" on (the default):
- **"Get on with it"** goes straight to the NPC's vendor, trainer, flight map or bank when there's one to go to, shows the NPC's whole menu (quests and every option) in the box when there are several, and ends the visit when there's nothing. It no longer shows the game's gossip window.
- **Replies that lead to business** ("Show me your wares.", "A room, please.") pick the matching service by their words.
- **On the game's pages** in the box, the last row is "Goodbye."
- **Close, Escape and the gamepad's B** end the visit, as they do in the game.
- **NPCs without lines, and quest boards,** show their menu and quests in the box too.
- The game's own window still appears for the service windows themselves (merchant, trainer, flight map, bank, stable, auction house), PvP quests and paid hand-ins, in combat, inside DialogueUI, and with the setting off.

### More to say
Repeat visits bring personal lines (habits, worries, opinions of the neighbours), night-time lines, and questions about the person, not only about their quests: Goldshire's townsfolk and Brother Sammuel; Bloodhoof Village and Thunder Bluff (Turak's story, a line for Skyborne druids); Shadowglen, Dolanaar and Darnassus; the Crossroads and Camp Taurajo; Astranaar, Splintertree, Stonetalon, Auberdine; Nighthaven. Every authored detail is marked "authored, not canon" in its bible; new facts are in `LORE_NOTES.md`.

### New places
- **Swamp of Sorrows.** Stonard: Warlord Ruag, Bengor, Helgrum the Swift, Fel'Zerul, Innkeeper Karakul; the Stonard Grunts.
- **Arathi Highlands.** Refuge Pointe: Captain Nials; Hammerfall: Drum Fel, Zengu (sent by Vol'jin) and Innkeeper Adegwa, a tauren among orcs; both towns' guards.
- **The Hinterlands.** Aerie Peak: Falstad Wildhammer, Gryphon Master Talonaxe (Sharpbeak, Rhapsody Shindigger), Fraggar Thundermantle, Innkeeper Thulfram; the Wildhammer Sentries.
- **Badlands.** Kargath: Warlord Goretooth (stuck on watch, dreaming of a glorious death), Hierophant Theodora Mulvadania and Shadowmage Vivian Lagrave (the 109th Division, the Grim Guzzler), Lexlort, Innkeeper Shul'kar; Prospector Ryedol at Hammertoe's dig; Lotwil Veriatus and his Enlightened Assembly.
- **Un'Goro Crater.** Marshal's Refuge: Williden Marshal (King Mosh), Linken who's forgotten his quest, J.D. Collie and her crystals, Spraggle Frock worried about Ringo.
- **Winterspring.** Everlook: Innkeeper Vizzie (no bugs), Umi Rumplesnicker's mechanical yeti, Gregor Greystone of the Argent Dawn; Donova Snowden by the hot springs; Witch Doctor Mau'ari and her E'ko.
- Magni's opening line is now one others can echo (Falstad does).

### Engine
- Guard names "... Sentry" (Aerie Peak); a duplicated "... Guardian" pattern removed.

## 0.23.0 (2026-11-14)
Packs: World 1.11.0, Stranglethorn 1.0.1, Thousand Needles 1.0.1, Desolace 1.0.1, Darnassus 1.0.2, and three new ones: Tanaris 1.0.0, Dustwallow Marsh 1.0.0, Feralas 1.0.0 (the rest as in 0.22.0). **New folders: exit the game fully, copy them in, and tick them.**

### New places
- **Dustwallow Marsh.** Theramore: Lady Jaina Proudmoore, Archmage Tervosh and his garden, Captain Garran Vimes investigating the burned Shady Rest Inn, Adjutant Tesoran and his records, Innkeeper Janene; the Theramore Guard. Brackenwall Village: Krog, who wants to know who made a liar of the Warchief, and the spymaster Nazeer Bloodpike.
- **Tanaris.** Gadgetzan: Marin Noggenfogger and his not-quite-finished elixir, Sprinkle (only she calls him Noggy), the Water Company's Bilgewhizzle and Fizzledowser, Alchemist Pestlezugg and Rose the rat, Tran'rek (Krazek's cousin), Innkeeper Fizzgrimble; the Bruisers. Steamwheedle Port: Stoley, who owes MacKinley money.
- **Feralas.** Feathermoon Stronghold: Shandris Feathermoon, Pratt McGrubben (a semi-retired paladin who sells leather), Innkeeper Shyria. Camp Mojache: Rok Orhan, Orwin Gizzmick, Innkeeper Greul.
- **Desolace:** Nataka Longhorn at Ghost Walker Post.

### Threads between zones
- Cliffwatcher Longhorn and his brother Nataka each know when you've met the other.
- Krazek knows his cousin Tran'rek; MacKinley knows you've found Stoley.
- Gracina Spiritmight in Darnassus hears about Pestlezugg's insects, and Shandris has sent her word of a hive in Feralas.
- Jaina knows when you've stood before Thrall, and Shandris when you've met Tyrande.

## 0.22.0 (2026-11-14)
Packs: World 1.10.0, The Barrens 1.1.0, Thunder Bluff 1.0.2, Undercity 1.0.1, Darnassus 1.0.1, Ironforge 1.2.1, Orgrimmar 1.1.1, and a new one: Desolace 1.0.0 (the rest as in 0.21.0). **New folder: exit the game fully, copy it in, and tick it.**

### Camp Taurajo
- Jorn Skyseer, who teaches young hunters the four great hunts of the Barrens; Mangletooth, a Razormane quilboar in a cage, who will trade the boar god's blessings for blood shards; Tatternack Steelforge, sent by the Warchief to study everyone's weapons; Innkeeper Byula.

### Desolace
- Nijel's Point: Captain Pentigast, who'd rather the centaur clans fight each other; Keeper Marandis on the Circle's business; Kreldig Ungor of Reclaimers Inc.; Brother Anton of the Scarlet Crusade, who hasn't heard the news; Innkeeper Lyshaerya. Ghost Walker Post: Takata Steelblade, hunting the Burning Blade among the satyrs.

### The capitals know where you've been
- Cairne knows you've met Baine; Hamuul knows Rau at Freewind; Thrall knows Gar'Thok; Sylvanas knows Zygand; Bethor hears what Renferrel found; Magni has opinions about the Whitebeard brothers; Fandral about Corithras's moonwells; Tyrande knows Tenaron sent you down from Aldrassil.

## 0.21.0 (2026-11-14)
Packs: World 1.9.0, Elwynn Forest 1.6.0, Ironforge 1.2.0, and three new ones: Tirisfal Glades 1.0.0, Teldrassil 1.0.0, Silverpine Forest 1.0.0 (the rest as in 0.20.0). **New folders: exit the game fully, copy them in, and tick them.**

### Forever's own additions
- **Camping teachers** in every starting zone that has a pack: Sam Sarsaparilla on the road by Goldshire (Marshal McBride sends you), Eric Brighthammer near Kharanos, Lyreena Duskblade near Dolanaar, Brakk near Razor Hill (he'd like his journal back), Kaga Wildhoof outside Bloodhoof (Chief Hawkwind owes her a favor), Eleanor Shackleton outside Brill (not with the Crusade, she says).
- **Forsaken paladins:** Shadow Priest Sarvis would rather you read that glowing scroll somewhere else, and Aramis Hammerhand teaches the Light to the risen in Deathknell's church.

### New places
- **Tirisfal Glades.** Deathknell: Undertaker Mordo, Shadow Priest Sarvis, Executor Arren, Aramis Hammerhand. Brill: Executor Zygand, Magistrate Sevren, Apothecary Johaan and his new plague, Coleman Farthing and his grudge against the Agamands, Gretchen Dedmar, Innkeeper Renee. The Deathguard.
- **Silverpine Forest.** The Sepulcher: High Executor Hadrec, Apothecary Renferrel, Dalar Dawnweaver (an archmage still annoyed at Dalaran), Shadow Priest Allister, Innkeeper Bates. Renferrel and Sevren both point you to Bethor Iceshard.
- **Teldrassil.** Shadowglen: Conservator Ilthalaine, Melithar Staghelm, Tenaron Stormgrip atop Aldrassil, Dirania Silvershine, Gilshalan Windwalker. Dolanaar: Corithras Moonrage and the moonwells, Athridas Bearmantle and the Gnarlpine, Tallonkai Swiftroot, Syral Bladeleaf, Innkeeper Keldamyr. The Sentinels.
- **Dun Morogh** (in the Ironforge folder): Sten Stoutarm and Grelin Whitebeard in Coldridge Valley; Senir Whitebeard, Ragnar Thunderbrew and Innkeeper Belm in Kharanos.

## 0.20.0 (2026-11-14)
Packs: World 1.8.0, Orgrimmar 1.1.0, Thunder Bluff 1.0.1, and four new ones: Stranglethorn Vale 1.0.0, Thousand Needles 1.0.0, Durotar 1.0.0, Mulgore 1.0.0 (the rest as in 0.19.0). **New folders: exit the game fully, copy them in, and tick them.**

### New places
- **Stranglethorn Vale.** Booty Bay (both factions): Baron Revilgaz on his balcony, Fleet Master Seahorn (a tauren who went to sea), Krazek who knows everything, "Sea Wolf" MacKinley who collects from the dead, Kebok and his fake tiger fangs, Innkeeper Skindle; the Booty Bay Bruisers. Grom'gol (Horde): Commander Aggro'gosh, Nimboya searching for Vol'jin's son, the witch doctor Kin'weelay, Far Seer Mok'thardin, Innkeeper Thulbek. The Rebel Camp (Alliance): Lieutenant Doren and Brother Nimetz, who walked away from a colonel gone mad.
- **Thousand Needles.** Freewind Post (Horde): Cliffwatcher Longhorn, Rau Cliffrunner and the Cloven Hoof, Hagar Lightninghoof and his egg, Thalia Amberhide, Innkeeper Abeqwa; Freewind's braves. The Mirage Raceway (both factions): Pozzik, Fizzle Brassbolts, and Kravel Koalbeard, who has rigged nothing, honestly.
- **Durotar.** The Valley of Trials: Kaltunk, Gornek, Zureetha Fargaze, Foreman Thazz'ril and his sleeping peons, Galgar, and Kzan Thornslash (with Forever's new Wayward Weapons). Razor Hill: Gar'Thok, Orgnil Soulscar, Innkeeper Grosk; the grunts. Sen'jin Village: Master Gadrin, who taught Vol'jin; the watchers.
- **Mulgore.** Camp Narache: Chief Hawkwind and Grull. Bloodhoof Village: Baine Bloodhoof, Zarlman Two-Moons, Harken Windtotem, Maur Raincaller, Mull Thunderhorn and the poisoned wells, Ahab Wheathoof (Forever brought him back; he still can't find Kyle), Innkeeper Kauth; the braves. **Camp Gev'rek: Ayessa Dawnsinger of the Windshapers**, for Horde Skyborne.

### More of the capitals
- **Vol'jin** stands beside Thrall in Orgrimmar. He knows if you've met Nimboya in the jungle or old Gadrin in Sen'jin.
- Thrall talks about the Burning Blade and the Echo Isles; Magatha about the Grimtotem.

### Fixes
- Guards named "Ironforge Mountaineer", "Booty Bay Bruiser", "Moonglade Warden" and "Brave ..." are now recognised as guards, so Thelsamar's Mountaineers speak their own lines (they were treated as townsfolk).

## 0.19.0 (2026-11-14)
Packs: World 1.7.0, and a new one: Stonetalon Mountains 1.0.0 (the rest as in 0.18.0). **New folder: exit the game fully, copy it in, and tick it.**

### For druids
- **The Circle takes notice.** A druid who visits Moonglade hears that the Keeper has been asking after them. Remulos asks you to watch the land; Tonga at the Crossroads or Terenthis in Auberdine shows you what's wrong with it; Hamuul or Mathrengyl sends you back; and the Keeper listens. Works for either faction.

### New place
- **Stonetalon Mountains.** Sun Rock Retreat: Maggran Earthbinder, Tammra Windfield and her burned slopes, Braelyn Firehand (who would like the druids gone), Innkeeper Jayka; Witch Doctor Jin'Zil in his cave at Malaka'jin. Stonetalon Peak: Keeper Albagorm and Innkeeper Faralia.

## 0.18.0 (2026-11-14)
Packs: World 1.6.0, Elwynn Forest 1.5.0, Westfall 1.2.0, Stormwind 1.3.0, Zephras Isle 1.0.1, Redridge 1.1.0, Duskwood 1.1.0, Ironforge 1.1.1, Wetlands 1.0.0, Moonglade 1.0.0, Darnassus 1.0.0, Thunder Bluff 1.0.0, The Barrens 1.0.1, Ashenvale 1.0.0, Hillsbrad Foothills 1.0.0, and four new ones: Darkshore 1.0.0, Loch Modan 1.0.0, Orgrimmar 1.0.0, Undercity 1.0.0. **New folders: exit the game fully, copy them in, and tick the new packs.**

0.17.0 wasn't released on its own; this release includes it.

### Capitals and the road between them
- **Orgrimmar.** Thrall; Neeru Fireblade in the Cleft of Shadow, all charm (Thrall isn't fooled); Gryshka at the Broken Tusk, who would very much like to hear what Zargh said about her; and Gamon, who has made his peace with being attacked.
- **Undercity.** Lady Sylvanas Windrunner; Varimathras, ever so loyal; Master Apothecary Faranell and his very interesting bottles; Bethor Iceshard and the friend who became a lich; Innkeeper Norman.
- **Darkshore.** Auberdine: Thundris Windweaver (who trusts paladins), Terenthis and the Fel Moss, Gwennyth and the beached sea creatures, Sentinel Glynda Nal'Shea, Cerellean Whiteclaw waiting on the dock, Innkeeper Shaussiy. Auberdine's Sentinels.
- **Loch Modan.** Thelsamar: Mountaineer Kadrell, the Hearthstoves at the Stoutlager, Prospector Ironband at his dig, Captain Rugelfuss in the Valley of Kings, and Chief Engineer Hinderweir VII, who checks the dam three times a day. The Mountaineers.
- **Stormwind.** General Marcus Jonathan at the gate, Renzik "The Shiv" at SI:7, Major Samuelson in the throne room, and Thomas Miller with his basket.

### For developers
- The simulation now streams each shard's output to disk (the 0.17.0 run ran out of memory) and includes Horde characters, so Horde-only lines are exercised.

## 0.17.0 (2026-11-14)
Packs: World 1.5.0, Elwynn Forest 1.5.0, Westfall 1.2.0, Stormwind 1.2.2, Zephras Isle 1.0.1, Redridge 1.1.0, Duskwood 1.1.0, Ironforge 1.1.0, Wetlands 1.0.0, Moonglade 1.0.0, Darnassus 1.0.0, Thunder Bluff 1.0.0, and three new ones: The Barrens 1.0.0, Ashenvale 1.0.0, Hillsbrad Foothills 1.0.0. **New folders: exit the game fully, copy them in, and tick the new packs.**

### Level 20 to 30, both factions
- **The Barrens.** The Crossroads: Thork and Sergra Darkthorn, Mankrik on the wall (everyone asks about his wife), Tonga Runetotem and the oases going bad, Apothecary Helbrim, Darsok Swiftdagger, Zargh the butcher and Innkeeper Boorand. The Crossroads' guards.
- **Ashenvale.** Astranaar: Raene Wolfrunner with Korra and Dagri, Pelturas Whitemoon and his sick daughter Relara (who gets better), Faldreas, Innkeeper Kimlya; Delgren the Purifier, a human paladin at Maestra's Post. Splintertree Post: Senani Thunderheart and the Ashenvale Hunt, Mastok Wrilehiss (who prefers wagons to people) and Kuray'bin.
- **Hillsbrad Foothills.** Southshore: Marshal Redpath (who met Lothar off the boats), Magistrate Maleb and the Syndicate, Lieutenant Farren Orinelle (who wants to go home), Brewmeister Bilger (once of the Silver Hand), Loremaster Dibbs, Innkeeper Anderson. Tarren Mill: High Executor Darthalia, Apothecary Lydon and his frog, Innkeeper Shay.

### Also
- Inn talk across Kalimdor: Darnassus, Thunder Bluff, the Crossroads, Astranaar, and word of Moonglade for druids.
- New thing to ask about: the Wailing Caverns.
- Lydon in Tarren Mill has heard of Helbrim in the Barrens; Dibbs in Southshore works for Milton Sheaf.
- For developers: the simulation runs in parallel shards (`--jobs`).

## 0.16.0 (2026-11-14)
Packs: World 1.4.0, Elwynn Forest 1.5.0, Westfall 1.2.0, Stormwind 1.2.1, Zephras Isle 1.0.1, Redridge 1.1.0, Duskwood 1.1.0, Ironforge 1.1.0, and four new ones: Wetlands 1.0.0, Moonglade 1.0.0, Darnassus 1.0.0, Thunder Bluff 1.0.0. **New folders: exit the game fully, copy them in, and tick the new packs in the AddOns list.**

### New places, chosen for a level 22 druid
- **Moonglade.** Keeper Remulos, Rabine Saturna, Dendrite Starblaze and the druid trials, Loganaar, the Great Bear Spirit (who mostly doesn't speak), and the Circle's two flight masters. Neutral throughout. A Skyborne druid is recognised for honouring the winds before the moon.
- **Darnassus.** Tyrande Whisperwind, Arch Druid Fandral Staghelm (and their quarrel), Mathrengyl Bearwalker for the Alliance druid trials, Priestess A'moora, Gracina Spiritmight, Innkeeper Saelienne.
- **Thunder Bluff.** Cairne Bloodhoof, Arch Druid Hamuul Runetotem, Turak Runetotem for the Horde druid trials, Magatha Grimtotem, Innkeeper Pala. The first Horde capital with people of its own; a Horde Skyborne is welcomed as a friend of the Earthen Ring.
- **Wetlands.** Menethil Harbor: Captain Stoutfist and the Dragonmaw in the hills, First Mate Fitzsimmons and the drowned Third Fleet, Glorin Steelbrow, Harlo Barnaby, Karl Boran, Innkeeper Helbrek, Archaeologist Flagongut, and Mikhail, a bartender who doesn't sell drinks. Menethil's guards.

### Also
- New things to ask about: the Dragonmaw clan, the Cenarion Circle.
- Tavern talk in Menethil, and word of the Wetlands in the inns to the south.
- Hamuul has heard about Fandral; Mikhail asks after Elling Trias.

## 0.15.0 (2026-11-14)
Packs: World 1.3.0, Elwynn Forest 1.5.0, Westfall 1.2.0, Stormwind 1.2.0, Zephras Isle 1.0.1, Redridge 1.1.0, Duskwood 1.1.0, Ironforge 1.1.0. No new folders: a /reload is enough, but a restart is safest.

### More people, great and small
- **Elwynn.** All nine class trainers in Northshire and Goldshire speak for themselves now. Goldshire's everyday folk: Dobbins, the shopkeepers, Erma at the stables, the cellar under the Lion's Pride, and the trainers by Crystal Lake.
- **Stormwind.** Mathias Shaw of SI:7, Lord Grayson Shadowbreaker and Arthur the Faithful in the Cathedral (paladins: Grayson is the one you'll be trying to impress for years), Grimand Elmore and his student Furen, Milton Sheaf and Lord Lescovar in the Royal Library, Elling Trias and his cheese, Jennea Cannon, Gakin the Darkbinder, Innkeeper Allison, Dashel Stonefist in Old Town, Topper McNabb behind the Auction House, and Warden Thelwater, who would rather you didn't mention the Stockade.
- **Duskwood** (good ground for a level 22 druid). The Carevins and their zealot Calor, Sirra Von'Indi the historian (ask him about Morgan Ladimore), Viktori who studies stars in the fog, Chef Grual and his crab cakes, Councilman Millstipe and his grudge against Stormwind's nobles, Innkeeper Trelayne and Clarise Gnarltree. Shapechangers get a very different welcome in Darkshire.
- **Westfall.** Sentinel Hill's working people: Innkeeper Heather, Quartermaster Lewis (and his robbed wagons), Thor and his gryphons, Scout Riell up the tower, and William MacGregor the bowyer.
- **Redridge.** Innkeeper Brianna, Bailiff Conacher, Deputy Feldon, Guard Parker on the Duskwood road, and the daffodil business between Darcy, Martie Jainrose and Parker. Chef Breanna feeds the garrison.
- **Ironforge.** High Tinker Mekkatorque, the Royal Historian Archesonus, the Explorers' League (Magellas and a very curt Prospector Stormpike), Senator Stonehallow out in the trogg quarry, and Firebrew at the Stonefire.
- **New things to ask about:** the Carevins, Morgan Ladimore, Gnomeregan, the Dark Iron, the Explorers' League.
- People hear about each other across towns: Thelwater has opinions on Darkshire's letters, Furen on his master, Sirra on Abercrombie's handwriting.

## 0.14.0 (2026-11-14)
Packs: World 1.2.0, Elwynn Forest 1.4.0, Westfall 1.1.0, Stormwind 1.1.0, Zephras Isle 1.0.1, Redridge 1.0.1, Duskwood 1.0.1, and a new one: Ironforge 1.0.0. New folder: restart the game, tick the Ironforge pack.

### For paladins
- **The Tome of Divinity, all the way.** Stephanie Turner (the orphanage), Gazin Tenorm at the Cathedral's altar and Henze Faulk by Heroes' Vigil now have their own voices, and Duthorian Rall notices how far you've got. At 20-something, Rall points you to Daphne Stilwell's farm for the Tome of Valor; her husband Jordan, the Church's smith, waits at the gates of Ironforge with Verigan's Fist.
- **Ironforge.** King Magni, Brandur Ironhammer in the Hall of Mysteries, and John Turner, who is always in Ironforge despite visiting only monthly.
- **The Cathedral.** Archbishop Benedictus, and Lil Timmy with a kitten that needs a home.

### For Skyborne
- Eighteen named NPCs across Elwynn, Westfall, Stormwind, Redridge and Duskwood now react to a Skyborne visitor, each in their own way (Farley practises "Winds be with you"; Lady Prestor is not impressed). Only what's known about the Skyborne is used.

### Also
- New race and class pairings get noticed in more places: a gnome priest at the Cathedral, a dwarf shaman by Heroes' Vigil, a human hunter at Sentinel Hill.

## 0.13.0 (2026-11-14)
Packs: World 1.2.0, Elwynn Forest 1.3.0, Westfall 1.0.1, Stormwind 1.0.1, Zephras Isle 1.0.1, and two new ones: Redridge Mountains 1.0.0 and Duskwood 1.0.0. New addon folders again: restart the game, and tick the new packs.

### The road goes on
- **Redridge Mountains.** Lakeshire under pressure: Magistrate Solomon and his unanswered letters, Marshal Marris, Foreman Oslow and his drowned toolbox, Verner Osgood (who sends you to Smith Argus for horseshoes), Corporal Keeshan, Wiley the Black in the inn's corner, Dockmaster Baren and Barkeep Daniels.
- **Duskwood.** Darkshire and the Night Watch: Lord Ello Ebonlocke, Commander Althea Ebonlocke, Tavernkeep Smitts, Madame Eva and her cards, Clerk Daltry; out in the woods, Jitters, Sven Yorgen, and Abercrombie, the kindly hermit who is definitely not building anything.
- **More of Elwynn.** Deputy Rainer at Westbrook, the rest of the Stonefield farm, Billy Maclure, Sara Timberlain and Gerard Tiller.
- **Stories that cross zones.** Solomon's letters go to Sentinel Hill, the Keep and Darkshire, and each answer has a reason in it. An old murder links the Scarlet Raven to the Lion's Pride and Marshal Haggard's house. People in different towns now pick up what you heard elsewhere (Smitts asks after Haggard; Verner's note reaches Argus; Gryan has opinions about Wiley).

### Smaller things
- Named NPCs keep to their own noticing moments. Before, a named smith or innkeeper could also say the generic ones every smith or innkeeper says.
- NPCs named "Watcher ..." (Duskwood's Night Watch) are treated as guards.

## 0.12.0 (2026-11-14)
Packs: World 1.1.0, Elwynn Forest 1.2.0, and three new ones: Westfall 1.0.0, Stormwind 1.0.0, Zephras Isle 1.0.0. New addon folders: restart the game, don't just /reload, and tick the new packs in the AddOns list if your client doesn't do it for you.

### More people to talk to
- **Every common kind of NPC has a voice now.** Stable masters, bankers, auctioneers, blacksmiths, food, drink and reagent vendors, each class's trainer, Horde flight masters, Alliance and Horde guards, and the guards of all six capitals. Anyone without a file of their own speaks from these.
- **Class trainers know their class.** A paladin trainer talks like a paladin trainer, not like "a trainer", and notices the new race and class pairings (a human hunter, a dwarf shaman, a gnome priest, an orc mage, a troll warlock, Skyborne druids, mages and shamans).
- **Elwynn grows east.** Brother Wilhelm (Goldshire's paladin trainer, and your next step after Brother Sammuel), Falkhaan Isenstrider, the young lovers Maybell Maclure and Tommy Joe Stonefield, Gramma Stonefield, and Eastvale: Guard Thomas, Marshal Haggard, Supervisor Raelen, and Theocritus up in his tower.
- **Westfall.** Gryan Stoutmantle and the People's Militia at Sentinel Hill, the Saldeans and the Furlbrows, and a ghost at the lighthouse.
- **Stormwind.** Highlord Bolvar, Lady Prestor, young King Anduin, Duthorian Rall at the Cathedral (paladins: he's where the Tome of Divinity leads), and Baros Alexston at City Hall.
- **Zephras Isle.** The High Elder and the isle's Peacekeepers, innkeepers and traders, written only from what's known about the Skyborne.
- **A story across three zones.** From Goldshire to Sentinel Hill to the Keep, people have something to say about the kingdom leaving Westfall to fend for itself, and they don't all agree.

### Under the hood
- Role pools can be narrowed to an NPC's title (`subtitle = "paladin trainer"`), and win over the plain role pool.
- NPCs whose name ends in "Peacekeeper" or "Empyrean Blade" are treated as guards.
- The voice checker matches banned phrases as whole words.

## 0.11.0 (2026-11-13)
Packs unchanged: World 1.0.0, Elwynn Forest 1.1.0. Adds a file (`Integrations/DialogueUIView.lua`): restart the game, don't just /reload.

### One window, start to finish
- **The game's next pages stay in the box.** Pick a gossip option or a quest in the conversation box and what follows shows in the same box:
  - the NPC's next gossip page;
  - a quest's offer (text, objectives, rewards with their icons, money and experience), with Accept and Decline;
  - the hand-in (required items, Continue once you have them);
  - the reward page (pick your reward from the list, with the game's item tooltip on hover; or Complete quest).
  - Vendors, trainers, flight maps and banks still open their own windows. A PvP quest or a hand-in that costs money is handed to the game's quest window for its own confirmation. "Get on with it" still reaches the game's window from every page.
  - Setting: "Keep the NPC's other pages and quests in the conversation box" (on).
- **With DialogueUI, everything happens in DialogueUI's window** (the new default). The NPC's lines and your replies are drawn inside DialogueUI's own window, as its own options, with its number keys, and RPG Dialogue's box doesn't appear. "Ask about..." lists topics there too. Picking a quest or a service, or "Get on with it", carries on with DialogueUI's own pages.
  - DialogueUI has no way for other addons to add dialogue, so this is built on how its window works inside (version 1.0.7). A DialogueUI update could change that: if its window can't take the conversation (or doesn't show), RPG Dialogue's own box takes over for that visit.
  - "Other dialogue addons" → "RPG Dialogue first, then the other window" brings back the 0.10.2 behavior (our box over DialogueUI's).
- Fixed: after a quest was picked in the box, the game's gossip window could be left see-through the next time it opened.

## 0.10.3 (2026-11-13)
Packs unchanged: World 1.0.0, Elwynn Forest 1.1.0. Adds a file (`UI/TextOptions.lua`): restart the game, don't just /reload.

### Text size and fonts, right in the box
- **"Aa" button** in the conversation box's title bar: text size (10–24), line spacing, the font for what people say and the font for names, changed live while you read. Each font's name is shown in that font. Escape closes it before the conversation.
- Settings: the same options moved up into a new **"Look and text"** section with the window style.
- **Text no longer looks bold**: every string started from the game's highlight font, which has a drop shadow, and on parchment that shadow thickened dark text. Text and replies now have no shadow, like the game's quest text. Only the gold name in the metal title bar keeps one.
- The text size setting is now the size you see. The default is 13 (the game's quest font size); the old default of 14 moves to 13 once (saved-data schema 6), and a size you chose is kept.

## 0.10.2 (2026-11-13)
Packs unchanged: World 1.0.0, Elwynn Forest 1.1.0.

### Works with DialogueUI
- **RPG Dialogue and DialogueUI now work together** (the new default when DialogueUI is loaded). The conversation comes first, in our box. DialogueUI's window waits invisible underneath it, and its camera keeps working. "Get on with it", or picking a quest or service, hands you to DialogueUI's window, exactly where it would have been.
  - DialogueUI's window is never closed (that would end the visit). It's only made see-through and covered, and it can't fade itself back in while we talk.
  - Number keys, Space, Enter, Escape and the arrows stay with the box while it's up, so they can't pick DialogueUI's options underneath.
  - DialogueUI's "hide the game UI" option no longer hides our windows.
- Settings → "Other dialogue addons": "Automatic" (new default: together with DialogueUI, step back for Immersion), "RPG Dialogue first, then the other window", "Step back", "Turn RPG Dialogue off". The old "step back" default moves to "Automatic" (saved-data schema 5).
- Built from DialogueUI's public source (it has no API for adding dialogue, so the two windows coordinate instead): DESIGN.md §8.

### The game style, sized like the game's window
- The box now has the gossip window's measurements: 338 × 496 (taller only when a conversation needs it), with open parchment below the replies. The text column is 270 wide, in the quest font's size (13 at the default text size; parchment and wood keeps 14). There's a 15-pixel space before the replies, and the rows are 300 wide with the game's spacing.
- The Ask list follows the box's height.

## 0.10.1 (2026-11-13)
Packs unchanged: World 1.0.0, Elwynn Forest 1.1.0.

### After the first look at the game style
- **Fixed: named NPCs speaking from the role pools on a new character** (Melika gave an innkeeper's generic lines to a new level-1 human paladin). A zone's pack only loaded at login and on entering a new zone. On a new character's first login the zone isn't known yet, and Northshire to Goldshire never changes the zone, so the Elwynn pack never loaded. Packs now load on every zone signal and again just before the addon decides who you're talking to.
- **Ask list** looks like the box beside it: title in the metal title bar, its own close button, the search box on the rock header, topics on parchment, "Show older topics" on the bottom bar. It's the same height as the box (no more tall empty panel) and shows as many topics as fit.
- **Journal and export window** get the same frame: title in the title bar, tabs and search on the header, pages on parchment.
- **Parchment keeps its proportions** instead of being squashed into short boxes: drawn at its own size from the top-left corner and cut off by the frame, as in the game's gossip window.
- Text and replies keep further from the parchment's ragged right edge.

## 0.10.0 (2026-11-13)
Packs unchanged: World 1.0.0, Elwynn Forest 1.1.0.

### The game's own window style
- **New default look: the game's own quest and gossip window.** The conversation box is built from your client's own art, so it matches your quest windows: the metal frame with the NPC's round portrait in the corner, their name in the title bar, the quest parchment, replies listed like gossip options (speech bubbles; the game's own quest and option icons; the gossip list's highlight bar), "Get on with it" with a bullet, and red buttons ("Ask about..." on the bottom bar, the red close button). It's gossip-window shaped (360 wide) and opens where the game opens its quest windows, or right over the game's window. Names use the game's title-bar font.
- The Ask list, the short-line bar, the journal and the export window get the game's panel border, parchment and red buttons.
- Follows the game's **Quest Text Contrast** setting (Options → Accessibility): lighter parchments, or the dark background with light text. RPG Dialogue's own high-contrast option uses that dark background too.
- Settings → **"Window style"**: "The game's own (like the quest window)" or "Parchment and dark wood" (the 0.9.0 look). Changes apply at once, even mid-conversation. If your client lacks any of the art, windows use parchment and wood, and settings say so.
- Name font: new choice **"The window's own"** (the default): Friz Quadrata in the game style, Morpheus on wood. The old default (Morpheus) moves over to it once (saved-data schema 4); other choices are kept.
- Quest icons now come from the game's own helper (campaign, daily and other quest kinds show their own marks) in both looks.
- How it's built (sources, sizes, the fallback): DESIGN.md §3.10. 143 Lua tests.

## 0.9.0 (2026-11-13)
First build with version numbers. Packs in this build: World 1.0.0, Elwynn Forest 1.1.0.

### Fonts, look and version numbers (2026-11-13)
- **Choose your fonts.** Settings → "Font for what people say" and "Font for names", each with a live sample line. Text: Friz Quadrata (game default), Crimson Pro (book serif), Atkinson Hyperlegible (most readable), Arial Narrow, Morpheus, Cinzel, Skurri. Names: the same list plus "Same as the text". Fonts other addons register through SharedMedia are listed too. Crimson Pro and Cinzel are bundled (SIL Open Font License, licence files included). Fonts are sized so each choice reads at about the same size, and Latin-only fonts fall back to the game's font on non-Latin clients. The old "readable font" checkbox moves over once (saved-data schema 3).
- **Polish**: soft drop shadow; parchment shaded top to bottom; brass trim inside the wood frame; a framed portrait; a thin rule under the name and above the replies; replies as full-width rows with a colored number, a hover band and an accent stripe on the marked one; "Get on with it" set apart and dimmed; themed buttons (close, Ask about, journal tabs, export) instead of the game's red ones; quest and option icons from the game's own art; a short fade-in (off with reduce motion). Same in the Ask list, short-line bar, journal and export windows.
- **Version numbers on every folder**: in the AddOns list (grey, after the name), each TOC's `## Version`, `/rpgd packs`, the settings header and the login line. `tools/version.py` shows and sets them (TOC, code and changelog in step); `tools/build_zip.py` refuses a zip when they disagree.
- **"Restart the game" warning**: the game reads an addon's file list only at start-up, so a /reload after an update can leave new files (like Melika's) unloaded. RPG Dialogue now notices a version or file-list mismatch and says to exit and restart the game.

### Second in-game test (2026-11-13)
- **Fixed: the conversation box failed to draw in the game** ("FontString:SetText(): Font not set"): every text in our windows now has a font from the moment it's created. The test mock now refuses text without a font, like the real client, so this can't come back unnoticed.
- **Right-click to talk to people with no menu of their own.** A quick right-click (not a camera turn) on a friendly NPC we have dialogue for, within reach, opens the box when the game opens no window of its own. NPCs with a gossip menu, quests or a shop keep the game's path: their window opens and the box comes with it, listing their options. If the game's window arrives late, the box keeps the conversation and adds its options. Setting: "Right-click people who have no menu of their own to talk to them" (on).
- New in the Elwynn pack (1.1.0): Melika Isenstrider, Assistant Innkeeper.
- Capture marks NPCs that open a game window (`interacts`), so right-click talk never races their window.

### After the first in-game test (2026-11-13)
- **The conversation box opens every time** you right-click an NPC with dialogue, not only on first meetings and news. Existing settings move over once (saved-data schema 2); "short line" and "straight to business" are still in settings ("When you talk to someone").
- **The box lists the NPC's own options**: quests (hand-ins first, then new, then in progress) and gossip options (vendor, training, flights...), after the NPC's replies. Picking one hands you to the game's window with that option selected. Works on gossip windows, the quest window's greeting page and single quests. Up to 10 buttons; keys 1–9 and 0.
- **Safety net**: if anything in a conversation errors, RPG Dialogue says so in chat (once per message, even with Lua errors hidden) and gives the game's window back at once. Reported because the Talk button appeared to do nothing in game: the engine picked a line, so the window most likely failed while drawing.
- `/rpgd probe`: old fallback functions a modern client doesn't have (`IsQuestFlaggedCompleted`, `UnitBuff`, `InterfaceOptions_AddCategory`, `GetQuestLogLeaderBoard`) are marked "not needed" in grey; new entries for quest selection, gamepad and tooltip functions.

### M8 (2026-11-13): Release prep
- **Total RP 3** (optional, read-only): with it loaded, `{name}` is your roleplay title and first name ("Sir Aldric"). Two settings, both on. Uses Total RP 3's public player object, strips color codes and textures, falls back to older profile fields, and never writes anything. Everything works the same without it.
- **Accessibility pass** (brief 4.15):
  - Keyboard: Up/Down/Tab move a marked selection, Enter takes it (or finishes the text), Escape closes the Ask list before getting on with it; Ask list navigable with Up/Down/Enter; journal tabs with Left/Right, Escape closes; new **Ask About...** keybinding.
  - Gamepad (client gamepad mode, setting on by default): D-pad moves, A confirms, B = Get on with it, X = Ask about; journal D-pad left/right, B closes.
  - Bundled **Atkinson Hyperlegible** (SIL Open Font License) as the readable font, with fallbacks; names drop the decorative font when it's on; non-Latin clients keep the game's fonts.
  - No color-only signals left: the selection has a ">" marker, locked replies say "(Locked)", the current journal tab is marked.
- **"Something new to say" tooltip marker** (brief 4.10; was missing): off by default, read-only, cached.
- Packs: `requires` checked (pack manager and `/rpgd packs` say what's missing; the validator errors); each pack has its own version and `CHANGELOG.md`; the pack manager shows versions.
- `PACK_AUTHORING.md`: the pack format, merge rules, format versions, the step-by-step zone workflow with tools, releasing a community pack, notes for AI sessions.
- Packaging: `.pkgmeta` checked against the BigWigs packager's source (it knows Forever's 160xx interface numbers); `.github/workflows/checks.yml` and `release.yml` (tag → release checks → packager → CurseForge/Wago once project IDs and tokens exist).
- Blizzard UI add-on policy checked (November 2026); `tools/check_all.py --release` now fails on chat or addon-message sending, dynamic code, or donation/advertising text in shipped files, and on pack versions that don't match their changelogs.
- README rewritten (controls, accessibility, other addons, releases). 118 Lua tests, 7 tool tests.

### M7 (2026-11-13): Content expansion workflow and tooling
- `tools/new_zone.py plan "<Zone>"`: lists the zone's captured NPCs and quests and proposes a coverage tier for each (major / quest / service / pooled / skip) in `RPGDialogue_<Zone>/PLAN.md`, with suggested keys, roles and towns, the zone's quests (lowest level seen, factions), settlements and hostile creatures, and the brief's zone checklist.
- `tools/new_zone.py scaffold "<Zone>"`: after the tiers are approved, writes the pack (TOC, `pack.lua`, `pools.lua`), one NPC file and voice bible stub per approved NPC (captured IDs and quests filled in, never invented), a lore-sheet stub in `LORE_NOTES.md` and the pack's line in `.pkgmeta`. Never overwrites; re-run it after approving more NPCs.
- Scaffold NPCs (`scaffold = true`) are ignored in game (the NPC stays pooled) and listed by the validator; `--strict` refuses them. The coverage report shows written vs planned NPCs.
- `tools/check_all.py`: one command for every check (Lua tests, tool tests, luacheck, validator, voice check, simulation, coverage) with a pass/fail summary; `--release` adds the strict validator and packaging/repository checks (TOC versions and interface numbers, `.pkgmeta` folders and ignores, no captured text tracked by git, clean tree).
- Simulation: flags lines about quests a character couldn't have taken yet at the line's level or on its faction, using the lowest level and factions now recorded by capture. Contradictions and impossible references now fail the run.
- Voice check: fails any line that shares a 6-word run with captured Blizzard text in your local `reference/` files; now also checks rumors and errand text.
- Flag report: a ready-to-paste `/rpgd spoof ... /rpgd seed N` replay line for each flag.
- `/rpgd capture zone`: what's captured in your zone, and the NPCs you've talked to that have no content yet.
- Python tool tests (`tests/test_tools.py`, run against a scratch copy of the repo). 98 Lua tests.

### M6 (2026-11-13): Spirit healers, books, insanity, barks, errands
- Spirit healers: one shared conversation tree for every spirit healer (they "keep shared records": one memory, one file). Reactions to how you died (falling, drowning, fatigue, guards, players, something far below you, elites, bosses), death counts with running jokes, the same spot again, long streaks, class and race (shaman ankh, warlock soulstone, priests and paladins, Forsaken, night elf wisps), alignment and Fel Taint tone; "your file", "what are you?", "why do you help us?". The afterlife stays a mystery.
- Pools can now carry whole conversation trees and act as one character. New conditions `deathsHere`, `daysSinceDeath`, `visited`; tokens `{deaths}`, `{deathplace}`, `{killer}`.
- Ghosts: only spirit-sensitive NPCs answer (spirit healers, Brother Sammuel).
- Books: known books teach topics and are journaled; Brother Neals reacts to *The Seven Kingdoms*.
- Temporary insanity (`fx.insanity`, `/rpgd insanity <n>`): scrambled text (stable, no flicker), wrong names, intrusive extra replies, local-only fake whispers, journal entries in a different hand, a static dark vignette. Cured by rest, holy places, the Camping buff (once its spell ID is captured), and time. Off with the setting or reduce motion.
- Drunk replies: slurred choice text.
- Proximity barks from nameplates, target and mouseover (local chat only, 90 s global / 10 min per NPC, 30% chance), and live reactions from nearby NPCs (a child squeals when you shift into a cat).
- Addon-side errands (`P:Errand`, `/rpgd errands`): visit / item / kill requirements verified by the addon, addon-only rewards. Slice: Eagan asks you to look at Echo Ridge Mine.
- Pacing: removed the per-conversation "death" budget (it silenced spirit healers).
- Validator: errands, books, pool trees. Simulation: barks, ghosts, books, lies, spirit healer deaths. Tests: 96 passing.

### M5 (2026-11-13): Journal, origins, export/import
- Journal window (`UI/Journal.lua`, `/rpgd journal`, keybinding, launcher left-click): Chronicle (searchable, newest first, folded old entries), People I've Met (affinity in words, last talked, last thing said), Character Sheet (alignment in words, title, dominant traits, opinions incl. contradictions, Fel Taint only if present, town standings as tier names, Origin page), Topics (known topics, "X insists: ..." claims with settled marks, books read), Deeds, Notes (your own writing).
- Origins (`Systems/Origins.lua`): picked on the Character Sheet (browse, edit the 2–3 sentence blurb, confirm; changing asks for a second click), one dismissible hint at first login, starting nudge and home-town welcome applied once per origin, blurb becomes a journal entry, "Other" unlocks nothing. Draft lists (for approval) for humans, dwarves, gnomes, night elves and Skyborne (from the brief's section 10 only, faction-aware).
- Export/import (`Systems/Export.lua`, `UI/ExportFrame.lua`, `/rpgd export`, `/rpgd import`): typed serializer (data, never code) + base64 + version header + checksum; import checks first and changes nothing until confirmed; the previous story is kept aside in `_quarantine`.
- Save-data corruption checks were already in place since M1 (repair into `_quarantine`, newer-schema read-only mode).
- Tests: 86 passing.

### M4 (2026-11-13): Story systems
- Throughline engine (`Systems/Threads.lua`): beats from thread files compete in the NPC's opening line (base 480), at most one per conversation, same-thread gaps in conversations and minutes (per-thread overrides), HELD reasons in `/rpgd why`, beats count as "something new", every beat goes in the journal, a reflective journal entry at the third beat, untouched threads fade after three weeks. `/rpgd threads [reset | force]`.
- "Ask about..." (`Systems/Topics.lua`, `UI/AskAbout.lua`): button on the dialogue window, searchable topic list (most recent first, archive for stale topics), answers via the specificity engine (own take, community, role, brush-off in their voice). `/rpgd topics [teach | forget]`.
- Gossip network: `gossip` condition (an opinion told to someone in this NPC's community reaches them after a delay, with a stable chance). `contradiction` condition (conflicting opinions within one community get noticed). Content: Willem hears what you told McBride; Milly notices contradictions; Farley hears what you told William Pestle.
- Lies: `lieCaught` condition checks a player claim against real history (`trueWhen` on the claim). Slice: tell Farley you killed Hogger ([Deceive]) and Dughan notices there's no claw on his desk (town standing drops).
- Innkeeper rumors (`Systems/Rumors.lua`): rumor sets by role, town and zone; at most one per hour per innkeeper with a chance per visit; shown after the first line, or instead of the greeting in compact mode. Elwynn rumor set added.
- Town standing (`Systems/Towns.lua`): quests done for a town move its standing (town quest lists), spread to related towns, extremes soften with long absence but never below ±30, flavored tier names.
- Alignment hint tags on replies ([Light], [Cunning], ...), off by default.
- `/rpgd claims`, `/rpgd die <cause>`.
- Validator checks thread beats, rumors, town quest lists and player claims. Simulation advances time and conversations like real play, shuffles visiting order, and reports beats fired.
- Simulation (2,000 characters): all four `elwynn_gold` beats fire; 7 of 325 lines never fire (all explained). Tests: 78 passing.

### M3 (2026-11-13): Vertical slice (Northshire Valley + Goldshire) and content tools
- `RPGDialogue_World` pack (loads at login): towns (Northshire, Goldshire, Stormwind), 10 topics, 5 claims, the `elwynn_gold` throughline (4 beats, 2 endings), draft human origins (for approval), generic fallbacks, role pools (children, flight masters, innkeepers, vendors, trainers, spirit healers).
- `RPGDialogue_Elwynn` pack (loads in Elwynn Forest): 13 NPCs: Marshal McBride, Deputy Willem, Eagan Peltskinner, Milly Osworth, Brother Neals, Brother Sammuel, Llane Beshere, Brother Danil, Marshal Dughan, Innkeeper Farley, Remy "Two Times", William Pestle, Smith Argus. Plus Northshire and Goldshire guard pools. Each NPC has a voice bible built from their wiki page and quests.
- Slice items covered: race/class/gender lines, race+class combos (dwarf shaman, human hunter, gnome priest, dwarf paladin), level bands, quest history, noticing moments and live reactions, compact repeat visits with news lines, return-visit memory, alignment choices, opinions, before/during/after/later quest reactions (incl. NPCs who weren't involved), echoes of lines heard from other NPCs, an NPC with an agenda (Dughan) contradicted by others and open to confrontation and [Persuade], a topic answered differently by many NPCs (defias), [Intimidate] on Remy, innkeeper rumors teaching topics, origin-only options. Thread beats and topic UI get their engine in M4.
- Scoring tuned from the simulation: long-tail quest states (before 45, done/later 40) no longer drown out race and class lines.
- New condition: `money`.
- Tools: `voicecheck.py` (banned phrases, sameness, mad-libs, broad-pool noticing), `simulate.py` + `tests/sim_driver.lua` (real engine, thousands of random characters, repeat visits), `coverage.py`, `import_capture.py` (registry + `--resolve` for TODO placeholders), `export_reference.py`, `flag_report.py`. The validator now judges line length by sentences and words together.
- `CONTENT_GUIDE.md`, `banned_phrases.txt`, slice lore sheet in `LORE_NOTES.md`.
- Tests: 65 passing, including real-pack content tests.

### M2 (2026-11-13): Engine, packs, dialogue UI
- Specificity engine: candidate gathering (own lines, community/role pools, generic), conditions with weights and failure reasons, pacing vetoes, anti-repetition fade, top-band weighted pick with a seeded RNG, traces for `/rpgd why`.
- Conditions: the full key set from the brief plus `questBefore`, `questReady`, `questLater`, `durability`, `nearlyNaked`, `equipped`, `profession`, `chance`, `npcFlag`; `all`/`any`/`not`. TODO quest titles resolve at runtime from the NPC's gossip quest list, your quest log and capture data.
- Pacing: per-system budgets (alignment, taint, origin, trait, opinion, book, insanity), noticing-moment budget and per-category cooldowns, line cooldowns and `once`.
- Effects: alignment with diminishing returns, drift, titles; traits and dominant traits; opinions (with contradictions remembered); flags; player claims; affinity; town standing with spread; thread state; heard/exposed claims; learned topics; journal in both voices.
- Content pack API (`RPGDialogueAPI`, the one public global): discovery from TOC metadata, load-on-demand by zone or at login, data-format check with refusal message, merging of NPCs across packs, TODO placeholders with name matching.
- Conversation controller: gossip, quest and service windows; full window vs compact bar (first meeting, something new, noticing moment for story NPCs); Blizzard's window is only faded and covered, never hidden or re-opened; never a full window in combat; live reactions (form, pet, mount, stealth, auras); Talk to Target with range checks; special options decided by who you are; "this line is wrong" flags.
- UI: parchment-and-wood dialogue window (portrait, typewriter, numbered choices, Get on with it, flag box, keys 1-5/Space/Escape), compact bar with Talk button, settings panel (features, accessibility, other dialogue addons, content packs, developer), launcher (addon compartment or minimap button).
- Other dialogue addons (Immersion, DialogueUI): steps back by default, with a one-time notice.
- Tools: `tools/rpgd/luadata.py` (data-subset and SavedVariables parser), `tools/validate.py`.
- Tests: fixture packs and 33 new engine/conversation tests (60 total).

### M1 (2026-11-13): Skeleton
- Core addon `RPGDialogue`: TOC (interface 16001, 16002), localization table, event dispatcher, logging, dev mode.
- `Compat.lua`: every Blizzard API call in one file, modern-first with legacy fallbacks, secret-value aware, `/rpgd probe`.
- `SavedData.lua`: account and per-character data, schema 1, migrations, repair that sets damaged data aside (never wipes), newer-schema read-only mode, trimming (seen lines, journal folding, death log).
- `Trackers.lua`: quest turn-ins with timestamps, deaths with inferred cause (no combat log in Forever), deeds (first death, levels, zones, dungeons, party kills), books read, home inn and visits, drunkenness.
- `Context.lua`: lazy context snapshot with spoof overlay; level bands, relative power, time of day, holidays (calendar, then a fallback date table), forms, pets, debuff types, out-of-place flags.
- Dev tools: `/rpgd capture`, `autocapture`, text capture (gossip greetings, quest text at each stage, quest givers and turn-in NPCs), `spoof`, `dump ctx`, `mem`, `probe`, `auras`, `reset`.
- `.luacheckrc` (only Compat may touch WoW globals), `.pkgmeta`, `tools/link_addons.sh/.bat`, README, MIT license.
- Out-of-game tests: WoW API mock, TOC loader, test runner; 27 tests.

### M0 (2026-11-13): Design
- Added `DESIGN.md`: folder structure, data schema with a complete example NPC, engine scoring, needs from the user, risks and API unknowns, decisions open to veto, M1 plan.
- Added `HANDOFF.md`, `LORE_NOTES.md` and this changelog.
- Initialized the git repository.
