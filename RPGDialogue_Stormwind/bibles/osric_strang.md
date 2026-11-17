# Osric Strang  (key: osric_strang)

## Sources
- https://warcraft.wiki.gg/wiki/Osric_Strang (via LORE_NOTES, Westfall section; not re-read): Limited Immunity, armor shop in Old Town; Quartermaster Lewis's contact; wiki id 1323 (unused, TODO_NPC stays).
- A Swift Message / Continue to Stormwind / Dungar Longdrink / Return to Lewis (human-only Classic chain), as summarised in LORE_NOTES and `bibles/trade_district.md` (Dungar).
- Lore: First War burning of Stormwind, refugees to Lordaeron, Second War (Hillsbrad, Blackrock Spire, Lothar's death), internment camps funded by Terenas's levy (Gilneas left over it), Thrall freeing the camps, Jaina at Theramore, night elves absent until the Third War, Hyjal.

## Their quests
- Continue to Stormwind (turn-in): Lewis's message; he fills the Militia's order from his own stock because the Keep won't. Proud of soldiers holding a line.
- Dungar Longdrink (gives): the crate to the Gryphon Roost; "fly, don't walk".

## Identity
TODO_NPC · Osric Strang · Limited Immunity, Old Town, Stormwind · Alliance · Human · armorer, old soldier
Personality: gruff, loyal, stubborn, honest about his hatred, privately unsettled
Speech: plain Old Town soldier; long practical sentences; armor as metaphor; "lad"
Knows and cares about: armor, the two wars, the camps, Westfall's Militia, Old Town
Relationships: Quartermaster Lewis (sends him plate); Dungar Longdrink (carries his crates); Edric (brother, dead)
Default attitudes: orcs (hatred he calls a debt); night elves (resentment: "sat out the war"); dwarves and gnomes (warm: Second War allies); Lordaeron refugees (kinship)
Lore anchors: Year 1; Thrall's Horde in Durotar; Theramore's peace; Ashenvale logging
Never says: anything after Classic; slurs of any kind; anything about real-world groups

## The prejudice
Orcs: born of his brother's death in the First War and hardened by three years guarding a camp. Night elves: wounded pride that the Alliance bled alone while "they slept under their trees". Blind spots: he refuses to credit that orcs fought beside humans and elves at Hyjal, and that the night elves never knew the Eastern Kingdoms were in danger. Softens through the camp carving (Persuade) and, for night-elf players, through the Hyjal story (`xelf_listen`).

## Changed a little (memory)
- `heardLine = "osric_strang.co_default"` (the carving confession): new greeting, hub line, softer `horde_met`, hub reply `carving_again`.
- `heardLine = "osric_strang.xh_listen"` (night elf told him about Hyjal): warmer greeting and hub line for night elves.
- `npcFlagBefore = "agreed"` (player agreed the orcs earned the camps): greeting and `horde` line as fellow-traveller.

## Agenda
Keep the war remembered; keep Westfall's Militia in steel.

## Secrets
Authored, not canon: brother Edric died on Stormwind's walls in the First War (coat buried instead); Osric was fourteen and fled north with his mother; pike at Hillsbrad, shield at Blackrock Spire; three years guarding an internment camp in Lordaeron; an old grey orc the guards called "Grandfather" whittled him a wooden footman with his nose, which sits on the shelf behind the counter; the doubled left shoulder on every breastplate (a walnut-sized lump of bone from an orc axe at Hillsbrad); the shop name's meaning.

## Reliability
Honest about facts he saw; biased in every judgement about orcs and elves.

## What they notice
1. soldier: former city guards (origin `human_city_guard`).
2. elf: night elf druids (shapeshifting near his stands).
3. gear: badly damaged armor (durability ≤ 25%).

## Topics
background, advice, westfall, blackrock, teldrassil, _none
