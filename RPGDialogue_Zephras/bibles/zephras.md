# Zephras Isle: zone lore sheet (pack 1.7.0)

Covers `npcs/thendal.lua`, `npcs/thendal_orders.lua`, `npcs/valanaar.lua`, the 1.7.0 changes to `npcs/talaanis.lua` (her own bible: `talaanis.md`) and `pools.lua`.
Facts come only from warcraft.wiki.gg (which cites the in-game text and Blizzard). Downloaded 2026-11-17. Many pages the wiki links to do not exist yet (Valanaar, Shrine of Akir, Shal'nan, Talaanis Shadowsong, Captured Bandit, Illaya Amberwind, Valennia Stormfist, Crab Season...); facts about them come from the pages that summarize them (mainly "Skyborne").

## Sources

- https://warcraft.wiki.gg/wiki/Aetheen_of_the_Gales_(quest
- https://warcraft.wiki.gg/wiki/Aggressive_Encroachment
- https://warcraft.wiki.gg/wiki/Al'Aketh_Thugs
- https://warcraft.wiki.gg/wiki/Ayessa_Dawnsinger
- https://warcraft.wiki.gg/wiki/Calmbreeze_Inn
- https://warcraft.wiki.gg/wiki/Coming_of_Age_(Forever
- https://warcraft.wiki.gg/wiki/Donaal_Downbreeze
- https://warcraft.wiki.gg/wiki/Elaadrin_Evengale
- https://warcraft.wiki.gg/wiki/Elemental_Unrest_(quest
- https://warcraft.wiki.gg/wiki/Eluvi'ana_(quest
- https://warcraft.wiki.gg/wiki/Falling_With_Style_(Skyborne
- https://warcraft.wiki.gg/wiki/Falorne_Fallwind
- https://warcraft.wiki.gg/wiki/Foul_Matriarch
- https://warcraft.wiki.gg/wiki/Halaan_Hawk-Eye
- https://warcraft.wiki.gg/wiki/Harmony_in_Balance
- https://warcraft.wiki.gg/wiki/Harvesting_Windstones
- https://warcraft.wiki.gg/wiki/High_Order_Dockmaster
- https://warcraft.wiki.gg/wiki/High_Priestess_Lorthuna_(Forever
- https://warcraft.wiki.gg/wiki/Muln_Earthfury
- https://warcraft.wiki.gg/wiki/Myriaal_Mistwake
- https://warcraft.wiki.gg/wiki/Nyalah_Brightfire
- https://warcraft.wiki.gg/wiki/On_the_Shal'nan
- https://warcraft.wiki.gg/wiki/Reading_the_Leylines
- https://warcraft.wiki.gg/wiki/Return_to_Rorian
- https://warcraft.wiki.gg/wiki/Rorian_the_Dayseeker
- https://warcraft.wiki.gg/wiki/Shen'dar_Village
- https://warcraft.wiki.gg/wiki/Sirocca_%22Swimmers%22_Starfeather
- https://warcraft.wiki.gg/wiki/Skyborne
- https://warcraft.wiki.gg/wiki/Skyborne_(playable
- https://warcraft.wiki.gg/wiki/The_Anchors_of_Zephras
- https://warcraft.wiki.gg/wiki/The_Ancient_Hilt
- https://warcraft.wiki.gg/wiki/The_Gift_of_Skysight
- https://warcraft.wiki.gg/wiki/The_Next_Step_(Skyborne
- https://warcraft.wiki.gg/wiki/Thendal_Village
- https://warcraft.wiki.gg/wiki/Ventaari_Brightwish
- https://warcraft.wiki.gg/wiki/What_Comes_Next_(Alliance
- https://warcraft.wiki.gg/wiki/What_Comes_Next_(Horde
- https://warcraft.wiki.gg/wiki/What_Is_My_Purpose%3F
- https://warcraft.wiki.gg/wiki/Zephras_Citizen
- https://warcraft.wiki.gg/wiki/Zephras_Isle

## Their quests

- Coming of Age
- Crab Season
- Eluvi'ana
- Falling With Style
- Foul Matriarch
- Reading the Leylines
- Return to Rorian
- The Anchors of Zephras
- The Ancient Hilt
- The Fate of a Loved One
- The Gift of Skysight
- What Comes Next

## Timing
Year 1. Most people here speak as if the campaign is under way or just over: the Al'Aketh are a live threat, the orders feud, and the skycutters have started running. Lines that need the ending (orders gone to Dalaran and Mulgore, Lorthuna struck into the sky) are Talaanis's, or gated on `questDone = TODO_QUEST("What Comes Next")`. Nothing after Year 1; Al'Akir's judgement is a threat, never an event.

## Voice notes
- Skyborne speech: measured, a little formal, warm underneath. Wind greetings and farewells: "Gale's greetings", "Winds be with you", "Winds guide you", "May the winds guide your path", "Winds' tidings". People call themselves shen'dorei; elders call the young "child" ("child of Zephras" is Rorian's).
- The two orders talk past each other. Windshapers (Ventaari): the spirits are owed a debt; the High Order is arrogant like the Highborne. High Order (Falorne): self-reliance, reclaiming Highborne magic, "knowledge and power"; the Windshapers are the true arrogant ones, no better than supplicants.
- Rorian: solemn, protective, scolds misuse of gifts ("Gah... Youths!" energy, never the quote). Aetheen: watchful, every remark a test. Myriaal: playful and bored. Halaan: slow, grateful, stiff. Ealaane: quiet grief, exact about craft. Swimmers: drunk, loud, shouts at Donaal mid-sentence. Donaal: dry, put-upon. Nyalah: cheerful, food as defiance.
- Outsiders: few Skyborne have ever seen another race. Wary curiosity, gratitude to the Kirin Tor (Alliance) and the Earthen Ring and tauren (Horde). Night elves are distant cousins who speak their tongue. Priests are met warily (the only Skyborne priesthood was the Al'Aketh's). Warlocks remind them of Tortheldrin. They have no paladins.
- Never copy the wiki's quotes; paraphrase in our own words.

## Fact used | Source
| Fact used | Source |
|---|---|
| Zephras Isle: Skyborne start zone in Skywall, levels 1-12; ruler High Elder Talaanis Shadowsong; former ruler the Shal'nan; Valanaar the major town; Thendal Village, Shen'dar Village, Falaath Village, Shrine of Akir | https://warcraft.wiki.gg/wiki/Zephras_Isle |
| Air elementals who lived with the Skyborne vanished "a number of years ago"; the island's sustaining magic is fading; windstones hold the winds' raw energy and grow more precious as the anchor pylons' magic fades | https://warcraft.wiki.gg/wiki/Harvesting_Windstones ; https://warcraft.wiki.gg/wiki/Zephras_Isle |
| Other islands Anvilas and Siroccas, towns Shen'dramar and New Eldre'naar; skystreams once linked them, now impassable; crab common on Zephras, a delicacy on Anvilas and Siroccas | https://warcraft.wiki.gg/wiki/Skyborne (cites Crab Season) |
| Contact with the other islands lost; Windshapers with skysight tried to reach them, no answer; fear Zephras is all that's left; spirits' debt and oath; High Order "arrogant like their Highborne ancestors"; Ventaari reads Highborne lineage in an aura and warns High Order youths | https://warcraft.wiki.gg/wiki/Ventaari_Brightwish |
| Falorne: island sanctuaries once spanned Skywall; High Order reclaiming Highborne heritage, masters of their own destiny; calls the Windshapers hypocrites; warns Windshaper youths | https://warcraft.wiki.gg/wiki/Falorne_Fallwind |
| Ley lines piercing the surface; "sons and daughters of the Highborne"; Windshapers "little better than the Al'Aketh"; making the unknown known; knowledge and power | https://warcraft.wiki.gg/wiki/Reading_the_Leylines |
| Skysight, convergence of elements, exercised like a muscle | https://warcraft.wiki.gg/wiki/The_Gift_of_Skysight |
| Coming-of-age relic held by those before; ashes scattered to the winds; Rorian is village leader at the greatfather tree; "Gale's greetings" | https://warcraft.wiki.gg/wiki/Coming_of_Age_(Forever) |
| Rorian addresses the young as "child of Zephras" | https://warcraft.wiki.gg/wiki/Rorian_the_Dayseeker |
| Vuldren cull; vuldren docile but sense magic out of balance | https://warcraft.wiki.gg/wiki/Harmony_in_Balance |
| Sprites near the standing stones agitated; not self-aware, respond to emotions and intentions; Yala Windwatcher is Rorian's apprentice | https://warcraft.wiki.gg/wiki/Elemental_Unrest_(quest) |
| Rorian: cult watched from afar; agitating the sprites an escalation | https://warcraft.wiki.gg/wiki/Return_to_Rorian |
| Myriaal's leap game; Rorian scolds her and says gifts aren't for amusement, don't exhaust them; a little practice acceptable | https://warcraft.wiki.gg/wiki/Falling_With_Style_(Skyborne) |
| Myriaal bored, calls Halaan a stuffy wretch | https://warcraft.wiki.gg/wiki/Myriaal_Mistwake |
| Class trainers in Thendal: Xyton (druid; fang, claw, feather, branch), Tai'ree (hunter), Dorii (mage, High Order), Akeri (rogue, "a shady fellow"), Boro (shaman), Ren (warrior, she); their locations | https://warcraft.wiki.gg/wiki/Thendal_Village and the class quest pages (A_Student_of_Nature, The_Way_of_the_Hunter, A_Student_of_the_Arcane, At_Home_in_the_Shadows, Embracing_the_Elements, The_Warrior's_Path) |
| Aetheen: Council of Elders member; reads the flow of the winds in Thendal Grove; assesses the young; everything was a trial | https://warcraft.wiki.gg/wiki/Aetheen_of_the_Gales_(quest) |
| Foul Matriarch: ursera den, matriarch Urs'anah, a test of resolve | https://warcraft.wiki.gg/wiki/Foul_Matriarch |
| Adolescent ursera attacked a boy near the elder tree; hunger and desperation | https://warcraft.wiki.gg/wiki/Aggressive_Encroachment |
| Aetheen sends the young to Constable Aonda in Shen'dar; the Al'Aketh worship the "supposed" ruler of Skywall; brutal, single-minded | https://warcraft.wiki.gg/wiki/The_Next_Step_(Skyborne) |
| Shen'dar Village: inn, trainers, Elder Windshaper Illaya Amberwind, Elder of the High Order Rathril Sunlance, Constable Aonda | https://warcraft.wiki.gg/wiki/Shen'dar_Village |
| Malduko Cloudcrush's thugs at the temple ruins; Hanaa Nightwind's post on the road; Lorthuna at the Shrine of Akir | https://warcraft.wiki.gg/wiki/Al'Aketh_Thugs |
| Anchor pylons: gifts of the wind spirits, bind and sustain the island; magic unstable, splendor unchanged; Halaan's far-seeing gift, not skysight nor ley lines; gratitude vs yearning | https://warcraft.wiki.gg/wiki/The_Anchors_of_Zephras ; https://warcraft.wiki.gg/wiki/Halaan_Hawk-Eye |
| The Shal'nan: led the rebellion against Tortheldrin; fled from Eldre'narr; brokered the pact; abdicated at the groundbreaking of the Shrine of the Four Winds to a council of provincial elders after more than a century of rule; kept tending the bond with the spirits; missing; Valennia Stormfist captained his Empyrean Blades nearly nine centuries and doesn't know why he left | https://warcraft.wiki.gg/wiki/Skyborne ; https://warcraft.wiki.gg/wiki/On_the_Shal'nan |
| Spirits evasive about Al'Akir; High Order vs Windshapers disagreement about that silence | https://warcraft.wiki.gg/wiki/Skyborne (cites On The Windlord) |
| Islands began drifting a few years before the return; parts of Zephras breaking away; Ban'aethal evacuated at night as it began to fall into the sky; Resaan died going back for supplies; Ealaane sought his heirloom | https://warcraft.wiki.gg/wiki/Skyborne (cites Ealaane's quotes, Aid For The Refugees, The Fate of a Loved One) |
| Refugees turned bandit or Al'Aketh; captured bandit from Shen'dramar, family escaped on one of the last skycutters then died; faces execution for killing a peacekeeper and stealing windstones | https://warcraft.wiki.gg/wiki/Skyborne (cites Captured Bandit's quotes) |
| Luminarian: legendary magesmith who came from Kalimdor, worked for centuries; Zephras arms in his style; arcane markers; twin swords Eluvi'tor and Eluvi'ana, lost for centuries, magic weak, maybe restorable; Ban'aethal's magesmiths the finest | https://warcraft.wiki.gg/wiki/The_Ancient_Hilt ; https://warcraft.wiki.gg/wiki/Eluvi'ana_(quest) ; https://warcraft.wiki.gg/wiki/Skyborne |
| Peacekeepers warn people from Ban'aethal and Shadowgale Forest; hollowed-out spirits; cult tampering with the anchor pylons; skycutters running again, still no contact with Shen'dramar; grey robes and shaved heads; why the spirits never spoke of Al'Akir | https://warcraft.wiki.gg/wiki/Zephras_Citizen |
| Swimmers: former skycutter sailor, grounded; orders' skycutters running again; "what aren't we being told"; Shadowgale Forest haunted: windblown wraiths, ankle-gnawing spirits, terror birds, a black-clad wraith; shouts at Donaal | https://warcraft.wiki.gg/wiki/Sirocca_%22Swimmers%22_Starfeather |
| Donaal: innkeeper of the Calmbreeze Inn, few customers; sells gustberry pie, Pungent Skycheddar, Red Delicious Stormapple, hippogryph flank | https://warcraft.wiki.gg/wiki/Donaal_Downbreeze |
| Calmbreeze Inn has a recall crystal of The Rebellion In Eldre'Thalas, Part 3 upstairs | https://warcraft.wiki.gg/wiki/Calmbreeze_Inn |
| Nyalah: cooking trainer in Valanaar; dwindling home lacks kaldorei ingredients; new variations of ancestral recipes; recipes to remind you of home; gives Crab Season | https://warcraft.wiki.gg/wiki/Nyalah_Brightfire |
| Stormapples from Windfield Orchard (Alvarion and Aamelia Windfield); berries; eggs fried in ursera tallow; the cyclone construct that defended the orchard from bandits | https://warcraft.wiki.gg/wiki/Skyborne ; https://warcraft.wiki.gg/wiki/What_Is_My_Purpose%3F |
| Skydocks: eastern dock to Dalaran (Alliance), western to Skywatcher Plateau, Mulgore (Horde); non-Skyborne can fly in | https://warcraft.wiki.gg/wiki/Zephras_Isle ; https://warcraft.wiki.gg/wiki/High_Order_Dockmaster |
| High Order: Highborne magisters' descendants, keyhole spell, contact with the Kirin Tor, Elaadrin Evengale (Supreme Magister) calls for explorers; Windshapers: Earthen Ring, Ayessa Dawnsinger (Grand Skyseer); Sky Enclave in Dalaran; Camp Gev'rek on Skywatcher Plateau | https://warcraft.wiki.gg/wiki/Skyborne ; https://warcraft.wiki.gg/wiki/Elaadrin_Evengale ; https://warcraft.wiki.gg/wiki/Ayessa_Dawnsinger |
| Ley lines seen by the High Order as treasure, by the Windshapers as scars; deaths in the Shen'dar Highlands; High Order apprentices at the Windshapers' standing stones | https://warcraft.wiki.gg/wiki/Skyborne (cites Meddlesome Mages, A Magical Affront) |
| Lorthuna: Talaanis had her spied on; recall crystal; wards; Rohash of the Conclave struck her into the sky; status unknown; Ayessa's sister | https://warcraft.wiki.gg/wiki/High_Priestess_Lorthuna_(Forever) ; https://warcraft.wiki.gg/wiki/Skyborne |
| Orders, Peacekeepers united at the Shrine of Akir; Ansirem Runeweaver and Muln Earthfury against Rohash's elementals; Muln convinced Rohash to retreat; the truce "only temporary"; Talaanis blessed both expeditions ("Winds be with you") | https://warcraft.wiki.gg/wiki/Skyborne ; https://warcraft.wiki.gg/wiki/Muln_Earthfury ; https://warcraft.wiki.gg/wiki/What_Comes_Next_(Alliance) ; https://warcraft.wiki.gg/wiki/What_Comes_Next_(Horde) |
| Recovered relics go to a communal collection overseen by the High Elder; Nightclaw druids recovered the cultists' heirlooms | https://warcraft.wiki.gg/wiki/Skyborne |
| Sky-Touched Blessing: three in ten newborns blue-skinned; High Order "twinkle" in the eyes; static prickle near Windshapers | https://warcraft.wiki.gg/wiki/Skyborne |
| Skyborne speak Darnassian and can talk with night elves; Horde Skyborne friendly with Thunder Bluff | https://warcraft.wiki.gg/wiki/Skyborne_(playable) |
| A Valanaar Peacekeeper doesn't recognize engineering | https://warcraft.wiki.gg/wiki/Skyborne (Economy and technology) |
| Clothcraft imitates the winds and comforts people; hippogryph feathers in hair | https://warcraft.wiki.gg/wiki/Skyborne |
| No Skyborne priests: aversion to religion, priesthood tied to the Al'Aketh (developer podcast) | https://warcraft.wiki.gg/wiki/Skyborne (Notes and trivia) |

## Assumed
- Talaanis is "she" (pack choice since 1.0.0; the wiki has no Talaanis page and uses no pronoun).
- The Skyborne pack's NPCs share one Year-1 moment, so Thendal Village speakers talk as if the campaign is in progress, and Valanaar speakers as if it is ending.
- Swimmers's role is `citizen` (he has no service).
- Quest titles in `TODO_QUEST` drop the wiki's disambiguation: "Coming of Age", "Falling With Style", "Eluvi'ana", "What Comes Next".
- The Windshapers' skycutter goes to Mulgore and the High Order's to Dalaran, as Swimmers guesses (documented docks; his guessing is his own).

## Authored, not canon
- Rorian: the relic "a story that stopped in the middle"; his guess that the cult made the sprites hateful; the tauren children "polite ursera" joke; his wariness of priests and paladins in his own words.
- Aetheen: her opinions of Talaanis; the children arguing whether dwarves are short elves; the kaldorei "neighbors in Eldre'Thalas".
- Myriaal: the cirrusflies in Rorian's robes; her secret fondness for Halaan; "land on Rorian's toes" scoring.
- Halaan: his secret respect for Myriaal; his question about the sky below.
- Ventaari: her curiosity about trolls and the tauren; standing upwind of the Forsaken.
- Falorne: the human/gnome Kirin Tor remarks; "filling in a well in a drought"; his fear and curiosity about warlocks.
- Ealaane: changing her mind each evening about Resaan; "keep an eye out for Luminarian's markings".
- Swimmers: the joke about how he got his name (left untold); his guesses about where the skycutters go.
- Donaal: lowering his voice about the forest; the creaking stairs.
- Nyalah: sending crab out to Anvilas "by the crate"; the moonberry question; sending recipes "into the wind".
- Talaanis (1.7.0): not yet signing the bandit's sentence; asking people not to guess about Lorthuna near Ayessa; relics "passed through my hands"; "half of Valanaar" reactions to mainlanders.
- Pools: the midwives' count (the ratio is documented, the midwives aren't); the citizen who won't shave her head; innkeepers housing refugees.
