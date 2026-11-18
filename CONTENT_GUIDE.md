# Content guide

How to write dialogue for RPG Dialogue, for people and for AI sessions. Read it before writing a single line. The schema reference is in `DESIGN.md` §2; this guide is about using it well.

**Workflow for a zone**: the full step-by-step version, with the tools for each step, is `PACK_AUTHORING.md` §4. In short:
1. Capture in game (`/rpgd autocapture on`, talk to everyone; `/rpgd capture zone` shows what's missing), then `tools/import_capture.py <SavedVariables> --resolve` and `tools/export_reference.py <SavedVariables>`.
2. `tools/new_zone.py plan "<Zone>"`, and agree the NPC tiers with the user.
3. Write the zone's lore sheet in `LORE_NOTES.md` (sources, quest storylines, what has and hasn't happened in Year 1, what you're unsure of).
4. `tools/new_zone.py scaffold "<Zone>"`, then write voice bibles (**sources and quests first**), propose throughlines (agree them), then dialogue from the bibles.
5. `python3 tools/check_all.py` must pass.

---

## 1. Characters come from their lore and their quests

- **Named lore characters** sound and think like their canon selves in Year 1.
- **Everyone else:** their quests and in-game text are the source. What they ask you to do, why, and how they ask tells you what they fear, want, resent and are proud of. Write that down in the bible's *Their quests* section, one bullet per quest.
- **Agendas, secrets, noticing moments and opinions grow from the same source.** Never give an NPC a personality, backstory or allegiance that contradicts their lore or quests. Small authored secrets are fine if they fit (mark them "authored, not canon" in the bible).
- **Almost nothing to go on** (a vendor with one gossip line)? Build from role, place and what neighbours say. Keep it modest. Write `- none: <why>` under *Their quests*.

## 2. The voice

- **No AI voice.** `banned_phrases.txt` is enforced. The test: hide the name, and you should still know who's talking.
- **People talk in sentences.** The user, playing it: "too choppy... characters want to have one liners 'He did. I didn't.' Have them talk like normal people, have the writing be more authentic to WoW." So:
  - 1–3 complete sentences per NPC line (a fourth if it flows), joined the way speech joins them: *and, but, so, though, because, which*. Read it aloud: one breath of conversation, not a telegram.
  - **No stacked fragments.** One short sentence for punch is fine; two in a row, or three in a line, fails the voice checker ("Big. Angry. Southwest.", "He did. I didn't.", "A chest? A cutlass? A sash? No?"). An opening "Ah!" or "Oh." doesn't count.
  - **Warcraft's register.** Classic quest text is the model: concrete about the place and the trouble, warm or gruff or grand, a little old-fashioned, and spoken *to* the player ("friend", "{class}", their name, sparingly). Character shows in word choice and attitude (a dwarf's burr, a goblin's sales pitch, a Forsaken's dry chill), not in chopping sentences up.
  - Nervous or childish speakers can stumble, as one run-on nervous sentence, not five fragments.
  - Before: "Light preserve us. Oh. One of the Cathedral's. Carry on. Slowly." After: "Light preserve us! Oh, you're one of the Cathedral's lot. Carry on, then, but go gently; you'll frighten the canal folk."
  - Before: "I'm the king. For now. Until my father comes back. Everyone's been very kind about it." After: "I'm the king, at least until my father comes home. Everyone's been very kind about it, though I don't think I'm very good at it yet."
  - Replies the player picks stay short: about 15 words or fewer.
- **Goblins (0.76.0).** Hide the name and a goblin should still be unmistakable. Their own cadence, layered on each one's bible (Sprinkle stays warm, Bilgewhizzle harried, Renzik third person):
  - **Everything is a deal.** They price things out loud: costs, margins, interest, overhead, liability, invoices, the small print, "on account". Danger is a cost line; kindness is "an investment"; a friend is "a valued customer".
  - **Fast and pushy.** Long, quick sentences that run on with *and* and *so*, interrupting themselves ("whoa, whoa", "listen, listen"), selling while they talk. Still whole sentences, never stacked fragments.
  - **Street talk.** "Pal", "friend", "chum", "buddy", "boss", "kid", "sweetheart"; the odd dropped g ("somethin'", "nothin'") or "ya", one or two per line at most, never every word. Oaths by money and machinery: "by my last copper", "on my mother's ledger", "sparks and sprockets".
  - **Casual about explosions.** Things blow up, rockets misfire, cousins lose eyebrows, and nobody thinks that's strange.
  - **Neutral and shameless.** Steamwheedle goblins sell to both sides and say so; Venture Company goblins are harder, crueller company men. A Cartel catchphrase ("Time is money, friend!") at most once per character.
  - **Classic only:** the Steamwheedle Cartel, the Venture Company, the trade princes, Undermine by name only. No Kezan, Gallywix, Bilgewater homeland or Kaja'Cola.
- **Every race sounds like itself (0.80.0).** The goblin test applies to all of them: hide the name, and the speaker's race should still come through. A tauren, troll or Forsaken who talks like a Stormwind shopkeeper is a bug. Do it through outlook, imagery and a few signature words, one or two per line, never a mad-lib of catchphrases and never broken grammar. Each NPC's own bible still comes first; a race is the floor, not the whole character.
  - **Orcs.** Blunt, proud, plain-spoken and martial; short sentences that still join up. Honor, strength, blood and battle; the Horde as family; memories of the internment camps, the demon blood and its shame, Grom's sacrifice and Thrall's freedom. Orcish words sparingly: *Lok'tar ogar*, *Throm-ka*, *Lok'tar*, *dabu*, *zug zug* (peons only). Address: "{class}", "warrior", "young one", "grunt". They respect deeds over talk and say so.
  - **Trolls (Darkspear).** Loose, rolling, sly or laughing; a light Caribbean lilt: "mon", "ya", "dat/dis/de" at most once or twice a line, "I be"/"you be" now and then, never every word. The loa (Bwonsamdi, the spirits), voodoo, the Echo Isles, Sen'jin and Vol'jin, Zalazane, hunting and headhunting, Thrall's debt. Never written as a minstrel act: Darkspear are clever, and the accent sits on top of a whole sentence.
  - **Tauren.** Slow, calm, gentle and deep; a herd's and a hunter's long view. The Earth Mother (An'she the sun, Mu'sha the moon), the winds, the land, the ancestors, the hunt, the great kodo, Cairne and the tribes (Bloodhoof, Runetotem, Grimtotem). Closing blessings like "Walk with the Earth Mother" or "May the eternal sun shine upon you". Metaphors from plains, herds, rain and grass. They rarely hurry and almost never joke at someone's expense; dry humour is fine.
  - **Forsaken.** Dry, cold, clipped in tone but whole in sentence; gallows humour and contempt for the living, the Scourge and the Scarlet Crusade. The Dark Lady, the Royal Apothecary Society, the Plague, unlife, rot and graves; a cultured Lordaeronian turn of phrase gone sour. Old human lives remembered with distance or bitterness. They never sound warm by accident.
  - **Dwarves.** A burr: "aye", "ye", "lad/lass" via `{g:lad|lass}`, "wee", "nae" sparingly; hearty, loud, stubborn. Ale, stone, forge, beards, mining and digging, the Explorers' League and the titans, Magni and Muradin, the Dark Iron feud and Thaurissan's ruin, Grim Guzzlers. Oaths by the forge, the stone or one's beard.
  - **Gnomes.** Quick, bright, precise and a little lost in the details; technical words, numbers, prototypes and percentages, enthusiasm running ahead of sense. Gnomeregan and its fall (Thermaplugg, the radiation, the refugees in Tinker Town), Mekkatorque, explosions as data. Long excited sentences, never fragments.
  - **Night elves.** Ancient, measured, formal and a little remote; ten thousand years in their memory. Elune and the moon, the Sentinels and Tyrande, the druids and Malfurion, the Emerald Dream, Nordrassil and Teldrassil, the War of the Ancients, the Highborne folly, the Burning Legion, Kaldorei balance. Greetings sparingly: *Ishnu-alah*, *Elune-adore*, *shan'do* (honoured teacher). Wary of newcomers' haste, axes and fire.
  - **Humans.** The baseline Warcraft register. Even so, the place shows: Stormwind's crown and taxes, Westfall's dust and Defias, Lordaeron's refugees, the Church of the Holy Light.
- **Original writing.** Read Blizzard's text in `reference/` to learn a voice; never copy it. Reference events in your own words.
- **Timeline discipline.** Year 1 only: after *Forsaken Kingdom*, before Molten Core and the Dark Portal reopening. Nothing from Burning Crusade onward, nothing from retail Cataclysm-era Elwynn. Unsure? Leave it out.
- **Hyper-specific beats generic.** Nearby place names, the quest just finished, the player's pet's name (`{pet}`).
- **Even a brush-off has a voice.** Every NPC gets a `_none` topic answer that sounds like them.
- **No promises the game can't keep.** No discounts, free drinks, rewards or "I'll fix that for you" (the addon can't change prices or give items).

## 3. Noticing moments (acknowledgments)

A noticing moment is *this* NPC reacting to something about the player *they in particular* would care about.

- **The test: if any NPC could say it, rewrite it or cut it.**
- Put the 2–3 things an NPC notices in the bible ("What they notice") and in `notices = { ... }`. Every `notice` line has a `cat` from that list.
- `place = "before" | "after" | "replace"` relative to the main line.
- They're rare by design: about one in three conversations rolls for one, at most one per conversation, and each category cools down (30 min across NPCs, 3 days per NPC). Don't fight the pacing by adding more.
- Pools may carry noticing moments only for **narrow roles** (children, flight masters, innkeepers, guards, blacksmiths, spirit healers, trainers, stable masters), or when the pool is narrowed to one town (`community`) or one kind of NPC by title (`subtitle`). The voice checker fails broad-pool noticing moments. A trainer pool narrowed by title should notice things only that trainer would: pair race notices with the class (`{ race = "Orc", class = "MAGE" }`), or an orc warrior asking the mage trainer for directions gets the orc-mage line.

- **Shapes:** `form` is the shape the player visibly wears: `bear`, `cat`, `travel`, `aquatic`, `moonkin`, `tree`, `flight`, `ghostwolf`, or `shadow` (a priest's Shadowform). Warrior stances and Stealth are not shapes. A live reaction `on = "form"` fires only when the player *takes* a shape, and must say which shapes it means (`when = { form = { "bear", "cat" } }`): a line about claws said to a priest in Shadowform is a bug the validator warns about.

Good: a blacksmith winces at your broken armor before you speak. A trapper eyes a druid's bear form: "I've skinned bears. Don't take it personally."
Bad: "Greetings, night elf druid." (a mad-lib, and anyone could say it)

## 4. Race, class, gender, combinations

- Real reactions with a point of view, never a swapped label. **Tokens decorate; they never carry a line.** A line built around `{race}` or `{class}` fails the voice check.
- New combinations (human hunter, dwarf shaman, gnome priest, orc mage, troll warlock, undead paladin) and the Skyborne should feel new: curious, skeptical or impressed.
- **Skyborne:** only what section 10 of the brief supports (and `LORE_NOTES.md`). NPCs may be curious or wary; they don't state facts about them that the brief doesn't give.
- Gender only through `{g:lad|lass}`, always respectful. In-world racial friction is fine where it's true to lore; never echo real-world bigotry.

## 5. Everything matters sometimes

- **A line hinges on one or two facts about the player.** Who the NPC is doesn't count. The validator warns at three hinges and errors at four.
- Each system has its moment: alignment in big conversations (`big = true` nodes), town standing in that town, Fel Taint rarely and dramatically, traits and origin now and then, books rarely. Pacing budgets enforce this (`Pacing.lua`).
- **Scoring cheat sheet** (own line base 400): time-sensitive quest states and heard lines +60, race+class +50, quest before +45, quest done/later +40, deeds/deaths/taint +40, origin +35, alignment/trait/opinion/topic/book +30, race or class +25, relationship/standing +20, state/zone +15, level/band +10, gender/time +5. Lines within 5 points tie and are picked at random; recently seen lines step aside.
- Use `priority` sparingly, to nudge one line over a close rival (e.g. a return-after-a-week line).

## 6. Quests: before, during, after, later

For every quest an NPC would care about, consider all four:
- **before** (`questBefore`): the trouble, before the quest is offered or taken.
- **during** (`questActive`, `questObjective` for progress, `questReady`): "Still short a few of those pelts?"
- **after** (`questRecent` with `days`, `questDone`): the reaction, including from NPCs who weren't involved.
- **later** (`questLater`): the aftermath days later.

Tag fresh reactions `tags = { "news" }`: they open the full conversation on an otherwise compact repeat visit. Quest references use `TODO_QUEST("Exact Title")` until capture data gives the ID; `import_capture.py --resolve` swaps them.

## 7. Repeat visits

- `greetings` are the compact-bar lines: short, varied, can carry conditions (quest progress, standing, time of day).
- Service NPCs (vendors, trainers, flight masters, bankers, stable masters) default to compact. They should still have one or two lines that make the full conversation worth opening.

## 7a. Depth: conversations the player can explore

A conversation is a place to explore, not one line and a goodbye. The player should always have more than one real thing to say, and following a thread should lead somewhere.

**Shape: a hub with branches.** The opening node is the hub. Each reply opens a branch (a subject: their quest, their past, the people around them, the place, the player). A branch runs two or three nodes deep, then offers `next = "BACK"` ("Something else." in the player's own words, varied) to return to the hub, or an exit. Long branches can have their own hub (`hub = true`); BACK returns to the last hub visited.

**What the engine does with it:**
- A branch the player already went down in this conversation disappears from the hub (asked and answered). Replies that lead to a hub (BACK, or `next` = the start node) never disappear. A reply that should stay can say `repeatable = true`.
- On a later visit, branches explored before are still offered, dimmed, and drop first when there are too many.
- Returning to a hub shows one of its `again` lines (`again = { { id = "h_again", text = "..." } }`): a short "what else?" in this person's voice. Write two or three per hub; they can carry conditions like any line. Without them a greeting is shown.
- Up to **six** replies show at once, plus "Get on with it". When there are more, explored branches drop first, then branches without conditions; exits and replies that exist because of who the player is stay.

**The standard** (the coverage report's "Depth" table measures it):

| tier | branches from the hub | nodes | longest chain | replies only some characters get |
|---|---|---|---|---|
| major | 4+ | 10+ | 3+ | 2+ |
| quest | 3+ | 6+ | 3+ | 1+ |
| service | 2+ | 3+ | 2+ | - |

Reputation counts as who the player is too: `reputation = { faction = "Stormwind", min = "exalted" }` (names in `World.FACTION_IDS`; standings `hated` to `exalted`). Use it where the game itself cares (Katie Hunter sells Stormwind's horses to humans or to anyone exalted with Stormwind), or where an NPC would know (the Argent Dawn's quartermaster, a Timbermaw sentry).

"Replies only some characters get" are choices with a `when` on who the player is (race, class, origin, level band, a quest done, a line heard, a topic known, standing, alignment...) or a special tag. They are how a dwarf paladin and a gnome mage have different conversations with the same person: write them for the characters this NPC would actually react to, Alliance first while the user plays Alliance, then everyone.

**What makes a branch worth taking:**
- **Alignment comes only from stances (0.33.0).** A reply with `fx.align` must be a statement the character makes, never a question, and every node with one has at least one opposing aligned statement. The stances in a node are mutually exclusive: once one is taken, the others vanish for good with that NPC, and the same stance never counts twice. Don't put `align` on the only reply into a deeper branch. The validator fails both rules.
- **Each reply is a different stance**, not a rewording: ask, push back, joke, sympathize, offer help, lie, change the subject. Replies carry the effects (alignment, traits, affinity, opinions) and the NPC answers the stance, not just the words.
- **Observations, not only questions.** The player isn't conducting an interview. About a third of the replies that open or deepen a branch are remarks the character makes: something they notice, guess or put plainly ("Those scarecrows didn't walk out there on their own." / "You don't sleep much, by the look of you." / "I passed the Molsen farm. It's empty."). The NPC answers the remark the way people do: agrees, corrects, bristles, laughs it off, then tells the same thing they would have told a question. Mix them in, one or two per hub alongside the questions. An observation with no stance carries no `fx.align`; if it is a real stance, it follows the alignment rules above.
- **Something is learned at each step**: a fact from their quests or lore, a topic (`learn`), a name to ask someone else about, a claim, an opinion of a neighbour. If a node only says "Yes." it isn't a node.
- **The NPC asks back.** People ask the player things ("You've come from Stormwind? How's the harbor?"), and the player's answer is a reply with effects. That's where traits and opinions come from.
- **Branches reach the rest of the world**: other NPCs ("Ask Kebok, if you can stand him"), quests nearby (before/during/after), threads, topics.
- **Lines inside branches react too.** A branch's node can have conditional lines (race, class, quest state) like the hub does; the deeper the node, the fewer conditions it needs.
- **Keep the rules in sections 2 and 5.** One or two things about the player per line; 1–3 whole sentences per line, never stacked fragments; replies 15 words or fewer. Depth comes from more nodes, not longer lines.
- Lore discipline doesn't loosen with depth. A minor NPC with three branches talks about their work, their place and their neighbours; they don't grow an invented life story (section 1). If there isn't enough source for a fourth branch, write three good ones.

## 8. Agendas, claims and unreliable narrators

- People have agendas, grudges and blind spots: **bias** (honest but one-sided), **mistakes**, **half-truths**, **lies**, **manipulation**.
- Register important statements as claims (`claims/<id>.lua`, in the World pack): who says it, `truth = "true" | "false" | "partly" | "disputed" | "unknown"`, a `truthNote`, and `exposedBy` (another NPC's line, a quest, an item, a place) or `open = true` for questions that are never settled.
- Lines that state a claim carry `fx = { hear = "<claim>" }`; lines or quests that settle it carry `fx = { expose = "<claim>" }`. Conditions `heardClaim` / `claimExposed` let other NPCs and the player react.
- **Gut feelings:** a claim may set `tell` (`lie`/`true`/`hiding`/`afraid`) when its truth alone misreads the speaker (a sincere mistake is `true`, not `lie`); a claim may list `contradicts = { ids }`. A line may set `tell` itself, with or without a claim (DESIGN §3.15).
- **Limits:** agendas fit the character (canon schemers scheme; canon heroes don't become villains). Only NPCs can be wrong; the UI and the factual parts of the journal never state false lore. The truth behind a lie is canon or deliberately open.
- **Disagreement is good.** Write both sides with conviction. Don't add a "correct" NPC unless the claim file says it gets settled.
- Slice example: Dughan says the Defias are common thieves (`defias_common_thieves`, partly true; he plays it down to keep Goldshire calm). McBride and Milly contradict him. The player can confront him (`confront` node, `[Persuade]`).

## 9. Throughlines

- A thread is 3–6 beats across 2–6 NPCs, tied by a theme or mystery, living in `threads/<id>.lua` with `beats = { { id, npc, when, text, fx } }`, `states`, `endings`, `pacing`.
- **Not quests:** no markers, no objectives, no "thread started" pop-ups. NPCs may nudge ("Brother Sammuel might have something to say about that"); they never give orders.
- At most one beat per conversation, and beats of one thread are kept apart (3 conversations and 20 minutes by default). Important NPCs carry the beats; pooled NPCs only carry light echoes ("Folks say…").
- Beats should work in any order where possible. Later beats acknowledge earlier ones (`thread = { id, beat = "b1" }`).
- **Lore rule:** threads connect existing Year 1 storylines and characters' concerns. They never invent major events or contradict how quests turn out.
- Slice example: `elwynn_gold`. Remy's dust supply shrinks (he claims he's the only buyer), Farley saw a rider paying in gold dust heading for the pumpkin patch, Dughan finds the Collector's schedule, Remy's trade recovers after Manhunt. Remy can be intimidated into admitting the riders.

## 10. Echoes, opinions, topics, rumors

- **Echoes:** an NPC reacts to a specific line the player heard elsewhere: `when = { heardLine = "npc.lineid" }`. The target line needs `key = true`.
- **Opinions:** choices record `fx = { opinion = { topic = "stance" } }`, remembered with who heard it. Other members of the same community may bring it up later (gossip network, M4).
- **Topics:** NPC files answer `topics = { topic_id = { lines } }`. Order of preference: the NPC's own take, their community's, their role's, then a brush-off in their voice. Answers can be claims, teach new topics (`learn`), move threads, or cost you.
- **Topics are heard (Morrowind-style).** When anyone says a topic's name or one of its `keywords` in the box, the player learns it and the word becomes a link to ask about it. So name things: "Ask Ashe" teaches nothing, "the Siege of Farholde" does. Give a topic `keywords` for the short forms people actually say ("Kurzen", "Bloodsail"); never a keyword that's an everyday word ("Fern" is borderline and only lives in Riverglades lines). `linkName = false` for a topic whose name is an ordinary phrase.
- **Ask anyone.** Every NPC can be asked `background` (Their story), `trade` (Their work), `advice` (A little advice) and `rumors` (Latest rumors). Write `background` and `advice` for every named NPC you write or deepen: one or two lines each, from their bible, and no invented life story (a deflection in their voice is better than a made-up childhood; Cady Lloydriel's is "No."). Roles cover `trade` (`RPGDialogue_World/asks.lua`), and zone rumors cover `rumors`, unless the NPC has a better one.
- **Answers that lead somewhere.** A topic line can say `next = "node"`: after the answer, that subject's replies follow. Use it when the topic is one of the NPC's branches (Demar on Fern Crimsonleaf, Ashe on the Twilight's Hammer). Give the topic a second line without `next` too, so asking again isn't always the same door.
- **Speaking your mind (0.82.0).** After an answer, the player can say what they think (`RPGDialogue_World/views*.lua`, DESIGN §3.14): 3 or 4 different stances per topic (admire, condemn, joke, doubt, profit...), faction-gated ones first, each with an `opinion` and a trait, aligned where the topic is moral or political (two opposing at least). Replies stand in for the NPC's side through conditions on the player and carry `affinity` when the NPC agrees or bristles. An NPC with strong feelings can add its own `views`/`viewReplies`.
- **Rumors:** innkeepers pass on local news, word from nearby and reactions to the player's own deeds. They're hearsay (claims), gated by level, zone and deeds, and they rotate.

## 11. Origins and town standing

- Origin lines and options are **extras**. Every conversation must make complete sense with no origin (`"other"` or never picked). No "you never told me where you're from".
- Town standing tiers: Reviled ≤ -60, Distrusted ≤ -20, Stranger, Known ≥ 10, Liked ≥ 30, Respected ≥ 55, Hero ≥ 80. The whole town must be consistent: if you're Distrusted, the baker doesn't greet you warmly. Standing is addon-only; it never changes prices or how guards really behave.

- **Coming back and word of mouth (0.67.0).** `away` greetings fire for a few hours after the player returns to the NPC's town; say how long with `{away}` rather than a number, and notice what changed (`levels`). `levelsSince` is personal: this person saw you green. `word` lines are town talk, not eyewitness: keep them general ("I hear you leaned on someone at the barracks"), name the teller only with `{source}`, and keep bad kinds (`angered`, `intimidated`, `deceived`, `caughtLying`) cool and good ones (`pleased`, `persuaded`, `helped`) warm. These kinds also move town standing a little on their own.

## 12. Voice bible format

One Markdown file per NPC in the pack's `bibles/` folder (not shipped). **Write the first two sections before anything else.**

```markdown
# Name  (key: npc_key)

## Sources
- wiki page (and whether you actually read it), reference/<zone>.md, LORE_NOTES.md section

## Their quests
- Quest title (gives / turn-in): what it reveals (fears, wants, resents, proud of)

## Identity
ID · name · location · faction · race · role
Personality: 3–5 adjectives
Speech: patterns, dialect, verbal tics
Knows and cares about:
Relationships:
Default attitudes: toward races, classes, factions
Lore anchors:
Never says:

## Threads he could carry
## Agenda
## Secrets
## Reliability
## What they notice   (2–3 things)
## Topics
```

## 13. File and data rules

- Pack files are data: `local P = RPGDialogueAPI:Pack("<pack id>")`, `local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST`, then `P:NPC { ... }` calls only. No variables, functions or concatenation (the validator rejects them).
- **Never invent NPC or quest IDs.** Use `TODO_NPC("Name")` / `TODO_QUEST("Title")`. They match by name/title at runtime so content is testable early, and the validator lists every one.
- Line ids are unique within their NPC; global ids are `npc_key.line_id`. Don't rename a `key = true` line without updating every `heardLine` that points to it.
- Every node has at least one line without `when` (or it can go silent) and at least one choice; every path reaches `END` or `BUSINESS` (`BACK` returns to the last hub, see 7a). "Get on with it" is added automatically.
- Special options (`tag = "Persuade" | "Intimidate" | "Deceive"`) belong on the major NPCs (one or two each, 0.34.0), need a `fail = { next, fx }` with its own node, and succeed from who the player is (`check = { pass = { any = { ... } } }`: one route through `disposition = { min = 60-70 }`, others through trait, class, race, origin, deeds, quests done for them), or the NPC's `temper` defaults. The player is told whether it worked, so the success must reveal something real (a confidence, an admission, their real opinion). Don't write "[Persuade]" in the text; the UI adds it. No bribes, no items, no `fx.align` on a check.
- `disposition` (0-100; DESIGN §3.12) gates what people confide: warm confidences at `{ min = 65 }`-`{ min = 75 }`, curt lines at `{ max = 34 }`.
- Every major NPC gets `topics.knows`: the lead-in to "What do you know?", one or two whole sentences that come before a list of subjects and name none of them (the addon lists them).
- Journal templates come in both voices: `journal = { first = "...", third = "{name} ..." }`.
- **Every named NPC carries an `impression`** (0.35.0): the player character's private diary note about them, written after the first conversation. `first`: 1-2 whole sentences, 40 words or fewer, what they noticed and made of the person, readable whether written after the first or the fifth meeting (no "Today I met"). `third`: one chronicle sentence with `{name}`. No assumptions about the player's class, race, gender or faction; no new facts beyond the bible.
- **Every zone gets a `P:Arrival`** in `RPGDialogue_World/arrivals.lua` (exact in-game zone name): the diary line on first arrival. Faction variants (`when = { faction = ... }`) go before the plain entry.
