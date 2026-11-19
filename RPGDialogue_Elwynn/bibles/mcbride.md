# Marshal McBride  (key: mcbride)

## Sources
- https://warcraft.wiki.gg/wiki/Marshal_McBride
- reference/elwynn.md (captured gossip and quest text; pending capture)
- LORE_NOTES.md, lore sheet: Northshire Valley and Goldshire

## Their quests  (IDs from capture; names are vanilla's, confirm for Forever)
- A Threat Within (turn-in; Deputy Willem sends new recruits up to him): every recruit
  arrives to be sized up. He has seen a lot of green ones.
- Kobold Camp Cleanup: treats kobolds as a real threat to the Abbey, not a joke. He uses
  recruits because he's short of soldiers.
- Investigate Echo Ridge, then Skirmish at Echo Ridge: works from his scouts' reports and
  escalates step by step. When it's done he gives respect but admits there may be more
  kobolds and he'll send others: the job is never quite finished.
- Report to Goldshire: part of a chain of command. He hands recruits on to Marshal Dughan.
- Class letters (Simple, Consecrated, Encrypted, Hallowed, Glyphic, Tainted): routes every
  human recruit to a trainer. Forever's new Human Hunter presumably has a letter of its own:
  unknown, so don't reference it.

## Identity
ID: TODO · Marshal (Douglas) McBride · Northshire Abbey, Elwynn Forest · Alliance,
Stormwind Army · Human · quest giver, commander of the Abbey garrison

Personality: dutiful, tired, fair, dry, methodical
Speech: short declaratives; orders phrased as plain facts; calls everyone "recruit";
dry understatement; no speeches, no flourishes
Knows and cares about: the valley's defense, the kobolds in Echo Ridge Mine, the Defias in
the valley, how few hands he has, keeping the Abbey's brothers safe
Relationships: Deputy Willem (his deputy, trusted); Marshal Dughan in Goldshire (next in
the chain, a colleague); the Abbey's brothers (protects them, finds them unpractical);
the paladins and warriors he marshals against the kobolds
Default attitudes: humans are his recruits; dwarves and gnomes are welcome allies;
night elves get polite unfamiliarity; Skyborne get careful curiosity (he knows only that
the Kirin Tor vouched for them); classes are judged by use ("can you hold a line?");
warlocks get wariness, but he follows orders; Horde are the enemy
Lore anchors: Stormwind Army; Year 1; the Defias are active; Lordaeron's fall is recent
Never says: anything after Year 1 (no Cataclysm-era Northshire, no worgen, no Blackrock
assault on the Abbey); modern idiom; speeches about honor

## Threads he could carry
- The Defias grievance (stonemasons thread): a soldier's view. They're organized; a cause
  doesn't make them less thieves.
- "Too quiet" kobold aftermath, once Echo Ridge is done.

## Agenda
A secure valley with too few soldiers; recruits who follow orders and come back alive.

## Secrets  (authored, not canon; consistent with his quests)
He has asked Stormwind for more soldiers and been turned down. He keeps it from recruits.

## Reliability
Trustworthy on kobolds, the valley and army matters. Biased on the Defias: no sympathy for
causes. Mistaken: nothing planned.

## What he notices
1. How green you are (level band, deaths).
2. The state of your kit (durability, nearly naked).
3. Whether you finish what you're given (quest history with him).

## Topics
kobolds, echo_ridge, defias, northshire_abbey

## Depth pass (Elwynn 1.10.0)
Sources read: the wiki pages for McBride, A Threat Within, Kobold Camp Cleanup, Investigate Echo Ridge, Skirmish at Echo Ridge, Report to Goldshire, The Adventurer (Elwynn Forest) (Forever), Echo Ridge Mine, Garrick Padfoot.
- Canon used: "we guards are spread a little thin" (gossip); so many forces marshaled abroad, enlisting anyone willing to defend their home and their alliance, "we're getting a lot of you; I hope it's enough" (A Threat Within); kobolds are thieves and cowards but a threat in numbers; the longer they sit in the mine the deeper the foothold; "there may still be kobolds; I'll marshal others" (Skirmish); Goldshire lies along the south road past the border gates (Report to Goldshire); Garrick Padfoot fights with a warrior's Defensive Stance (his abilities), which McBride reads as drilling.
- Branches: orders and the garrison (the authored secret surfaces only at affinity 4+), kobolds and Echo Ridge, the Defias (who leads them; Garrick), Goldshire and Dughan, and replies for priests (level 1-15), Westfall farmhands, Lordaeron refugees, dwarves/gnomes/night elves/Skyborne, and returning veterans (level 20+).
- Authored, not canon: his opinion of Dughan ("known each other too long to listen to each other"); the abbey novice "carrying the brothers' candles last spring"; asking Stormwind twice for soldiers (his bible secret, now said aloud to trusted players).

## 0.34.0
- McBride (Persuade, `garrison_letters`): he wrote twice; the first reply came from the Highlord's clerk ('will consider'), the second from Lady Prestor's office ('the valley must make do').

## Humans (human patch)
- Human recruits get `hum_g1` and a hello line about Northshire as where "Stormwind's own learn their trade". Branches: `hu_valley` (why recruits start at the Abbey; the Defias in the vineyards are Stormwind men; stance order +/-1) and `hu_expect` (he expects more of humans: "run from his own front door"; stance order +/-1).
- Non-humans: `hu_what`, a short dry answer about human hurry.
