# Build Prompt: "RPG Dialogue" for World of Warcraft: Forever

> Fill in everything in [BRACKETS] (mostly in section 9) before sending.
> Works best in Claude Code pointed at your WoW AddOns folder, but works in chat too.

---

You are an expert World of Warcraft addon developer (Lua 5.1, the WoW UI API, FrameXML, SavedVariables, taint rules) and an experienced narrative designer with deep knowledge of Warcraft lore. You're going to help me build **RPG Dialogue**, an addon that turns talking to NPCs into a branching, reactive, CRPG-style conversation system. Think Baldur's Gate or Dragon Age dialogue, inside Azeroth.

This is a big project. We'll build it in milestones over several sessions. Read the whole brief before doing anything.

## 1. Context you won't have: World of Warcraft: Forever

WoW: Forever came out after your training cutoff. Treat the facts below as true. When you're unsure whether something exists in Forever, ask me rather than guessing.

- Released November 4, 2026. It's Blizzard's official "Classic+": a permanent third version of WoW alongside retail and Classic, built on vanilla (levels 1–60) with new content.
- Level cap is 60, permanently. There's no flying and no level scaling.
- Timeline: "Year 1". It comes after Warcraft III: Reforged's new campaign *Forsaken Kingdom*, before Kazzak reopened the Dark Portal, and before Molten Core. It's its own continuity, separate from retail.
- New playable race: the **Skyborne**, high elves who can join either faction. Their starting zone is **Zephras Isle** (levels 1–12). **Section 10 is a lore brief on them.** Use only what it says, and don't fill its gaps with invented lore.
- New race/class combinations: Human Hunter, Dwarf Shaman and Gnome Priest (Alliance); Orc Mage, Troll Warlock and Undead Paladin (Horde). Skyborne classes are listed in section 10.
- New zones include Zephras Isle, the Riverglades and Mount Hyjal.
- New systems:
  - **Camping:** rest at a camp for special buffs, plus crafting and utility stations.
  - **Legacy:** account-wide challenge talent trees.
  - Account-wide Collections and Transmog.
  - Hardcore mode is coming in a later update.
- The client includes some modern UI features (Cooldown Manager, built-in damage meter, mouseover casting), so the API may be closer to the modern client than to Classic Era. **Don't assume either way.** See the compatibility layer below.
- Quest IDs and NPC IDs may differ from original vanilla, because Forever adds and changes content.
- **Lore sources.** If you can browse the web, you may look up Forever lore, but only on warcraft.wiki.gg and Blizzard's official sites. Anything a page labels as speculation is not canon. Record every new fact you rely on, with its source, in `LORE_NOTES.md`.

## 2. What the addon does

When the player talks to an NPC, a custom dialogue window opens with in-character dialogue and multiple-choice replies. What NPCs say reacts to as much as possible: the player's race, class, gender and combination of these, level and power relative to the NPC, zone, time of day, holidays, reputation, forms, pets, curses and diseases, quests and quest chains completed, and past conversations. Replies shape a Warcraft-flavored alignment, personality traits and recorded opinions, which NPCs reference later. NPCs remember the player, and a journal recounts everything. Across many conversations, **throughlines** form: NPCs follow how quests are going, react to things you said to other people, and hint at events elsewhere, until a story starts to take shape. It never turns into a formal quest. Each town also forms its own opinion of the player, and players can optionally pick an origin story in the journal. NPCs don't always tell the truth: Elder Scrolls style, some have agendas, biases or secrets, and the player has to work out who to believe. The goal is **hyper-specificity**: whatever the situation (a gnome priest wandering Shadowglen at night with a disease), the player should feel seen. That never means "Hello, {race} {class}." It means a particular person noticing something they in particular would care about: a little girl thrilled to watch a druid turn into a bear, or a flight master pointing out to a Skyborne that gliding down is one thing, but a gryphon goes *up*. The long-term target is virtually every named NPC in the game, plus generic pools for unnamed ones.

## 3. Hard constraints

1. **No AI or network at runtime.** Addons can't call outside services. All dialogue is pre-written and shipped as Lua data. AI (you) is the authoring tool, not the runtime.
2. **Client-side only, and solo.** This is a personal experience for each player. Conversations exist only on the player's screen. There's no communication with other players or their addons, and nothing is shared or shown to anyone else. Don't fake real quests or real rewards.
3. **No taint.** Never modify protected or secure frames or call protected functions. Use events and `hooksecurefunc`. Handle combat lockdown gracefully.
4. **Never block gameplay.** One click or keypress must always reach the normal vendor, quest or trainer window.
5. **Performance.** Everything is event-driven, with no heavy per-frame work. Split dialogue data into LoadOnDemand modules by zone or continent. Measure memory with `UpdateAddOnMemoryUsage` and report it.
6. **Never invent NPC IDs or quest IDs.** If you need an ID you haven't been given, use a named placeholder such as `TODO_NPC("Marshal McBride")` that the validator flags. The capture tools in 4.13 are how I'll harvest real IDs in-game.
7. **Clean Lua 5.1.** Namespace everything with `local addonName, ns = ...`. Use no globals except SavedVariables, slash commands and keybinding names. Include a `.luacheckrc`.
8. **Localization.** All UI strings go through a localization table (English only for now).
9. **Data, not code.** Dialogue data must be declarative tables. No `loadstring` and no code strings in data.

## 4. Architecture

### 4.1 Compatibility layer (`Compat.lua`)
Every Blizzard API call goes through this one file, so a difference in Forever's API means changing one file. Detect at load time which APIs exist and degrade gracefully, logging anything missing in dev mode. Covers at least:
- gossip (`C_GossipInfo` vs. legacy)
- quest completion (`C_QuestLog.IsQuestFlaggedCompleted` vs. `IsQuestFlaggedCompleted`)
- auras (`C_UnitAuras`/`AuraUtil` vs. `UnitBuff`/`UnitDebuff`)
- calendar and holidays (fall back to a built-in date table)
- shapeshift forms
- text-to-speech
- settings panel registration

### 4.2 Context snapshot (`Context.lua`)
When a conversation opens, build one `ctx` table describing everything detectable. Conditions are checked against `ctx`, never against the live API, which makes them testable and spoofable. Fields:

- **Player:** name (plus roleplay name if Total RP 3 is loaded; see 4.14), race, class, gender, level, level band, faction, guild and rank, professions and skill levels, gold, PvP rank/title, notable equipped items, tabard, average durability, "nearly naked" flag, hardcore flag (when it exists).
- **NPC:** npcID (parsed from GUID), name, level, elite status, reaction.
- **Relative power:** level difference and a power bucket (e.g., "far below NPC" … "far above NPC").
- **World:** zone, subzone, map ID, in a capital, resting, at an inn, time-of-day bucket (dawn/day/dusk/night), active holiday, Camping buff.
- **States:** shapeshift form, mounted, stealthed, ghost, pet (type, family, name), debuffs by dispel type (Curse/Disease/Poison/Magic), notable buffs/debuffs by spell ID, resurrection sickness, drunk (inferred from system messages), party members' race and class.
- **Reputation:** standing with relevant factions.
- **History:** completed quests, active quests and their objective progress, recently turned-in quests with timestamps (the addon logs these itself), throughline states, origin, town standings, deeds the addon tracks itself (boss kills, zones discovered, notable kill counts), a death log (count, cause, place, time), topics known, books read, home inn, NPC memory, alignment, traits, opinions, flags, claims, insanity level.
- **Out-of-place flags:** far from racial homeland, under-leveled for the zone, over-leveled for the zone.

Level bands (tunable): 1–9 Greenhorn, 10–24 Blooded, 25–44 Seasoned, 45–54 Veteran, 55–60 Champion.

### 4.3 Dialogue data schema
Design a declarative schema that meets these requirements:
- Each NPC with custom content has a file in its zone pack: a voice-bible reference plus conversation nodes.
- **Node:** id, candidate NPC lines, player choices.
- **Line:** text, conditions, weight, tags, optional `once` or cooldown.
- **Choice:**
  - text
  - conditions for showing it
  - effects: alignment deltas, trait deltas, opinion sets, flags, claims, affinity change, throughline progress, town standing change, NPC claim heard or exposed, journal entry template
  - next step: another node, end, or open the default Blizzard window
- **Text tokens:** `{name}`, `{race}`, `{class}`, `{g:lad|lass}`, `{pet}`, `{zone}`, and so on. Tokens are for small touches. They are never what a line is *about*. No mad-libs like "Hello, {race} {class}". If a line only works by swapping in the player's race or class, write real lines for the races and classes that matter instead.
- **Greeting lines:** short lines tagged for repeat visits (see 4.10).
- **Conditions:** declarative keys such as `race`, `class`, `gender`, `minLevel`/`maxLevel`, `band`, `zone`, `subzone`, `questDone`, `questActive`, `questObjective`, `questRecent` (turned in within N days), `heardLine` (player has seen a specific line from another NPC), `thread` (throughline state or beats heard), `origin`, `townStanding`, `heardClaim`, `claimExposed`, `topicKnown`, `bookRead`, `deaths`, `deathCause`, `homeInn`, `form`, `debuffType`, `aura`, `rep`, `timeOfDay`, `holiday`, `alignment`, `trait`, `opinion`, `metBefore`, `timesTalked`, `daysSince`, `flag`, `claim`, `deed`, `outOfPlace`, `insanity`, plus `all`/`any`/`not` combinators.
- **Shared pools:** lines by NPC role (guard, innkeeper, vendor, trainer, flight master, stable master, blacksmith, child, militia, peon, etc.) × city or faction. They cover unnamed NPCs and act as fallbacks for named ones. A role is specific enough to carry real noticing: every flight master has opinions about anything that flies, and every child is impressed by magic.

### 4.4 Specificity engine (`Engine.lua`), the heart of the addon
- A line is eligible only if all its conditions pass.
- **Score = the sum of condition weights.** Rough order, most specific first: NPC-specific, then quest/history, then race+class combo, then race or class alone, then zone/state, then gender/time, then generic. The most specific eligible line wins. Ties are broken by weighted random choice among the top lines, excluding recently seen ones.
- The fallback chain always ends in a generic line, so no NPC is ever silent.
- **Acknowledgments are moments of noticing, not greetings.** An acknowledgment is a specific NPC, or a narrow role like children or flight masters, reacting to something about the player that *they in particular* would care about, in a way only they would say it. Examples:
  - A little girl in Goldshire gasps when a druid turns into a cat, and asks if she can pet you.
  - A flight master tells a Skyborne that Walk on Air is a nice trick for going *down*, but a gryphon goes up.
  - A blacksmith winces at your broken armor before you've said a word.
  - A Forsaken apothecary is unimpressed by your disease: "Amateur strain."
  - An innkeeper tells a warlock the imp doesn't sleep in the beds.
  - An Ironforge dwarf is baffled by a dwarf who talks to the elements.

  **Rules:**
  - There is no generic pool any NPC could draw from. Acknowledgments are written per NPC, or per narrow role, and paired with what that NPC would notice (the "what they notice" field in their voice bible).
  - **The test:** if the line would make sense coming from any NPC, rewrite it or cut it.
  - They can be added before or after the main line, or replace it.
  - Use a configurable probability and per-category cooldowns, with at most one or two per conversation, so they feel earned.
- **Live reactions.** While the dialogue window is open, the engine listens for changes and can react to them: a shapeshift, a pet summoned, mounting up, stealth, a buff landing or wearing off. Watching a druid transform is different from seeing a bear walk up. Once proximity barks exist (4.12), the same reactions can fire for nearby NPCs, like a child squealing as you shift forms in the town square.
- **Anti-repetition:** each character keeps a history of lines they've seen, which fades over time.
- Seeded random mode for deterministic tests.
- **Everything matters sometimes, not all the time.** Keep every system (that's the flair), but don't let them all speak at once:
  - Apart from who the NPC is, a single line should hinge on one or two things about the player, not five stacked conditions.
  - Each system has its moments: alignment in big conversations, town standing in that town, Fel Taint rarely and dramatically, traits and origin now and then, books rarely.
  - Each NPC reacts mainly to the 2–3 things they'd plausibly notice (the "what they notice" field in their voice bible). A priest notices Light and Shadow, a guard notices town standing, a goblin notices Cunning and coin.
  - Per-system cooldowns and budgets, like the acknowledgment budgets above, keep any one system from dominating.

### 4.5 Memory and persistence
- `SavedVariablesPerCharacter`:
  - NPC memory: first met, last met, times talked, affinity, topics discussed, last thing said
  - alignment, traits, opinions (who heard them and when)
  - flags, claims, deeds
  - throughline states, the log of quests turned in (with timestamps), origin, town standings
  - topics known, books read, death log, home inn
  - journal, insanity state, seen lines (keep a lasting record of the "key" lines that other NPCs may refer back to via `heardLine`, even after the general seen-lines history is trimmed)
- `SavedVariables` (account-wide): settings, capture data, debug log.
- A schema version number and migration function from day one.
- Cap or trim tables that grow (journal, seen lines) so saved data stays small.

### 4.6 Who the player is: alignment, traits, opinions, town standing, origin
- **Three axes, each from −100 to +100:**
  - **Light ↔ Shadow:** mercy and faith vs. ruthlessness and forbidden power.
  - **Order ↔ Wild:** duty, law and kingdoms vs. freedom, nature and the old ways.
  - **Honor ↔ Cunning:** keeping your word vs. pragmatic deals.
- **Fel Taint meter (0–100), separate from the axes.** It rises when the player accepts demonic or Old God offers, decays very slowly, and opens or closes content.
- Alignment moves with diminishing returns and drifts slowly. Big story choices count for more.
- **Titles** come from regions of the alignment space and are worded differently for Alliance and Horde. They change how NPCs treat you: priests trust the Light-aligned, cultists approach the Shadow-aligned or tainted, Cenarion druids warm to the Wild.
- **Traits** are counted from *how* you answer: witty, stern, kind, cruel, pious, skeptical, greedy, generous, curious, brave, cautious. Dominant traits come up in dialogue.
- **Opinion ledger** on recurring topics, extensible: Thrall, the Forsaken, the Defias and the stonemasons, the Scourge, peace between factions, arcane magic, the Light, the Earth Mother, goblins and trade, the Burning Legion. Record who heard each opinion.
- **Gossip network:** NPCs share "community" tags (e.g., Goldshire, Cathedral District). An opinion told to one member can be referenced by others after a delay, with some probability.
- **Claims and lies:** choices can record a claim ("killed VanCleef"). NPCs who could know the truth check it against real history and may call the player out.
- **Contradictions:** stating conflicting opinions within one community can get noticed.
- Optional hint tags on choices (e.g., `[Light]`, `[Cunning]`), off by default.

**Town standing**
- Every town or community keeps its own opinion of the player, separate from Blizzard's faction reputation. Use the same community tags as the gossip network: Goldshire, Lakeshire, Sentinel Hill, Razor Hill, the Crossroads, the Cathedral District, and so on.
- **Tiers, from −100 to +100:** Reviled, Distrusted, Stranger (the default), Known, Liked, Respected, Hero of {town}. Tier names can be flavored per town.
- **What moves it:**
  - choices in conversations with that town's people
  - quests done for the town (the town's data file lists which ones)
  - lies that get caught
  - how throughlines end
  - deeds that matter to the town, like killing what threatens it
- **What it changes:**
  - how guards and townsfolk greet you
  - the tone of important NPCs
  - which reply options and thread beats appear
  - occasional remarks around town ("The innkeeper's been telling everyone about you")

  The whole town has to be consistent: if you're Distrusted, the baker shouldn't greet you warmly.
- Standing spreads a little to related towns (Goldshire to Stormwind, at a small fraction). Long absences slowly soften the extremes, but a town never forgets completely.
- **Addon-only.** It can't change prices, real reputation or how guards actually behave. Dialogue must never promise discounts or rewards the game won't really give.
- **Data:** `towns/<id>.lua` holds the id, name, subzones and member NPCs, related towns and how much standing spreads to them, tier names, and the quests that affect standing.

**Origins (picked in the journal)**
- The journal's Character Sheet has an **Origin** page where the player can pick a background at any time. One dismissible hint at first login says it exists. Nothing else pushes the player to choose.
- **The list depends on race and class.** Each race gets 4–6 origins rooted in its Year 1 situation, plus class-specific ones where lore gives them weight. Examples of the kind of thing (you write the real lists in M5 for my approval):
  - Human: a Westfall farmhand driven off by the Defias; a younger child of a minor Stormwind noble house; a refugee from fallen Lordaeron. Human paladin: a squire whose training ended when the Silver Hand fell apart.
  - Forsaken: who you were in life (a Lordaeron farmer, a Dalaran apprentice, a soldier at Andorhal) and how you feel about that life now.
  - Orc: raised in an internment camp. Orc warlock: secretly studying magic the Horde has outlawed.
  - Skyborne: a descendant of Highborne magisters hungry for lost arcane knowledge (High Order, Alliance); a Windshaper initiate who passed the elemental trials (Horde); a Peacekeeper of Zephras Isle; a ranger of Thendal Grove. Every Skyborne origin must fit the lore brief in section 10.
- **Every list ends with "Other".** If the player picks Other or never picks, origin-specific lines and reply options are simply skipped. There are no placeholders and no "you never told me where you're from". Every conversation must make complete sense without an origin.
- **What a chosen origin does:**
  - unlocks origin-only reply options ("I worked fields like these, before the Defias came")
  - unlocks lines from NPCs who'd care (Farmer Saldean recognizing a fellow Westfall farmer)
  - gives a small nudge to starting traits and alignment
  - can set a better starting standing in the home town (Known instead of Stranger)
- The Origin page shows a short, editable 2–3 sentence blurb, which also becomes the first journal entry.
- The player can change their origin later, after a confirmation. Past conversations stay as they were.

### 4.7 Throughlines (stories that emerge on their own)
Besides single conversations, build **throughlines**: threads that run across several NPCs, quests and conversations, so a story gradually forms on its own. **They are not quests.** There are no quest-log entries, markers, objectives, tracking UI or "thread started" pop-ups. The player should notice the pattern themselves, the way you notice a plot building in a good RPG.

**What they're made of:**
- **Quest-state awareness, before, during and after.**
  - *Before:* NPCs mention the trouble before the quest is offered or picked up.
  - *During:* they comment while it's active, including objective progress ("Still short a few of those pelts?").
  - *After:* they react once it's turned in, including NPCs who weren't involved ("Heard Hogger's finally gone. Goldshire's sleeping easier").
  - *Later:* the aftermath can come up days later ("Things have been quiet since the Hogger business. Too quiet, if you ask the militia.").
- **Echoes across NPCs.** NPCs refer to specific conversations you had with other named NPCs. They agree, disagree, give their side of it, or correct what you were told ("Dughan told you *that*? Of course he did."). This builds on the gossip network in 4.6 but uses actual lines the player heard (`heardLine`), not just opinions.
- **Allusions.** NPCs refer to other NPCs' troubles, the player's deeds (a dungeon cleared, a death, a reputation milestone) and wider Year 1 events, often without explaining all of it. Half-told is better than over-explained.
- **Authored threads.** A thread is a small set of **beats** spread across 2–6 NPCs, often in different places, tied together by a theme, tension or mystery. An example is the stonemasons' grievance against Stormwind's nobility, heard from several sides. Each beat is a line or a small node, gated by conditions: quests done, earlier beats heard, opinions, alignment, time passed. Where possible, beats can be heard in any order, and later beats acknowledge earlier ones.
- **Per-character state.** Each thread tracks the beats heard, the choices made within it, and its state: *dormant*, *stirring*, *unfolding*, *resolved* or *soured*. Threads branch on the player's choices, opinions and alignment, and can end in different ways. A thread the player never follows up on just fades. That's fine.
- **Discovery, not direction.** NPCs may nudge ("Brother Sammuel might have something to say about that"), but never give orders like a quest giver. Nothing is tracked on screen.

**Pacing (important):**
- Thread beats are rare compared with normal lines. Allow at most one beat per conversation, and enforce a minimum gap, in conversations and real time, between beats of the same thread.
- Important and major NPCs carry most beats. Pooled and unnamed NPCs only ever carry light echoes ("Folks say…").
- In the engine, an eligible beat scores high, but the pacing rules can veto it. `/rpgd why` should show when a beat was held back for pacing.

**Lore rule:** threads connect and add color to existing Year 1 storylines and characters' established concerns. They never invent major lore events or contradict how quests actually turn out.

**Data:** each thread lives in its own file (`threads/<id>.lua`) containing an id, a one-line theme, the NPCs involved, the beats (with conditions and effects), the possible states and endings, and pacing overrides. A thread can cross zones and zone packs. Make sure a thread still works when only some of its zones' data is loaded.

**Agendas and unreliable narrators (Elder Scrolls style)**
- NPCs don't have to tell the truth. As in The Elder Scrolls, people have agendas, grudges, blind spots and secrets, and what they tell the player reflects that:
  - **Bias:** honest but one-sided. A Westfall farmer and a Stormwind noble describe the Defias very differently.
  - **Mistakes:** they believe something that isn't true (rumor, superstition, old news).
  - **Half-truths:** true, but leaving out the part that matters.
  - **Lies:** deliberate, to protect themselves or someone else, or to push the player in some direction.
  - **Manipulation:** NPCs with agendas may try to use the player: flattering them, steering their opinions, or getting them to carry a message, accusation or rumor to someone else.
- **NPC claims.** Important statements are registered as claims in `claims/<id>.lua`. Each claim records:
  - what is claimed, and who says it
  - whether it's true, false, partly true, disputed or unknown
  - what can expose it: another NPC's account, a quest outcome, an item, a place
- **The player can act on what they hear.** They can repeat a claim to someone else ("Dughan says the Defias are just common thieves"), confront the source with a contradiction ("That's not what Gryan told me"), or keep it to themselves. Spreading a lie, being caught believing one, or exposing one can shift affinity, town standing, alignment and throughlines.
- **Some questions are never settled.** It's fine if two NPCs contradict each other and the player never learns who was right. Mark those claims as deliberately open.
- **Limits:**
  - Agendas must fit each character's established personality. Canon schemers can scheme (in original WoW, Lady Katrana Prestor in Stormwind Keep is the obvious one). Canon heroes don't become secret villains.
  - Only NPCs can be wrong. The addon's own voice (the UI, tooltips, the factual parts of journal entries) never states false lore as fact.
  - The truth behind a lie must itself be canon, or deliberately left open. Never "reveal" invented lore as the truth.
- **Disputes that are true to the lore make great material.** The Skyborne orders' grievances over sacred sites and deaths (section 10) will naturally be told differently by each side.

### 4.8 "Ask about…" topics and special reply options

**Topics (Morrowind-style)**
- The player learns **topics** as they come up: people, places, events, rumors, lore. Topics come from NPC lines, reply choices, claims, throughline beats, innkeeper rumors and books.
- The dialogue window has an **"Ask about…"** button. It opens the topics the player knows, grouped by category, searchable, with the most recently learned first. Any NPC can be asked about any known topic.
- **Responses use the same specificity engine.** The order of preference:
  1. the NPC's own take
  2. their community's or faction's take
  3. their NPC type's take
  4. an in-character "never heard of it" or "not my business"

  Even the brush-offs should sound like the person giving them.
- **Answers can do things:**
  - be biased, wrong or lies (they're claims; see 4.7)
  - teach new topics, so one question leads to another
  - move a throughline along
  - sometimes cost you: asking a Stormwind noble about the stonemasons' unpaid wages won't make you a friend
- **Keep the list manageable.** Topics that are resolved or stale move to an archive section, and search is always available.
- **Data:** `topics/<id>.lua` defines each topic (id, name, category, how it's learned). NPC files hold their own answers. Common topics get shared pools by NPC type and community.

**Special reply options (Fallout-style)**
- Some replies carry tags: `[Persuade]`, `[Intimidate]`, `[Deceive]`, plus identity tags like `[Paladin]`, `[Dwarf]`, `[Westfall farmhand]`, `[Hero of Goldshire]`, `[Light]`.
- **Whether an option appears** depends on who the player is: class, race, level and power relative to the NPC, traits, alignment, town standing, affinity, origin, topics and claims they know, faction reputation.
- **Whether it works** also comes from who they are, not from dice:
  - Intimidate works on the cowardly, or when you clearly outclass the NPC.
  - Persuade works with enough affinity or standing, or with a trait that fits.
  - Deceive works unless the NPC is sharp or already knows the truth. A deception records a player claim that can be caught later (4.6).
- **Failure is possible and interesting.** The NPC remembers it, and it can cost affinity or standing, or open a different path.
- These options are **rare and reserved for moments that matter**, not offered in every conversation.
- No bribes: the addon can't actually take the player's gold.
- **Settings:** show tags always, only when the option is available, or never (for full immersion). Optionally show locked options greyed out, like Fallout. The default is to show tags only when the option is available.

### 4.9 Special characters: innkeepers, spirit healers and books

**Innkeepers and barkeeps: the rumor mill**
- **Inns are rumor hubs.** Innkeepers and barkeeps may pass on a rumor when you visit. Rumors are local news, word from nearby zones, and reactions to the player's own deeds ("They say someone finally put down Hogger. That wasn't you, was it?").
- Rumors seed topics, claims and throughlines. They're hearsay, so some are wrong.
- Rumors are gated by level, zone and what the player has done, and they rotate so a regular hears something new.
- **The innkeeper where your hearthstone is set is "home".** They notice when you set it there, how often you come back, and how long you've been away.

**Spirit healers: extensive, and a lot of fun**
- Spirit healers get deep dialogue trees, not a single line. They should be among the most memorable characters in the addon.
- **What they notice:**
  - how often you die, and where
  - how you died: what killed you (from the combat log just before death, if the API allows), falling, drowning, fatigue, guards, other players, something far below your level, a boss
  - repeat deaths in the same spot, and long streaks without dying
  - whether you take resurrection sickness again
- **Class and race reactions:** shamans with Reincarnation, warlocks with soulstones, priests and paladins who resurrect others. Forsaken have already died once, and they won't let you forget it.
- **Alignment colors their tone:** gentle with the Light-aligned, wary with Shadow, ominous with Fel Taint.
- **They talk as if they keep shared records:** every spirit healer seems to know your file, wherever you die. Running jokes build over time.
- **Lore guardrail:** the nature of spirit healers is mysterious in this era, so keep it that way. Never mention the Shadowlands, the Maw, the Arbiter or anything else from later expansions. They can be philosophical, wry or kind about death without explaining the afterlife.

**Books (rarely)**
- The addon notices when the player reads an in-game book, and records the title.
- Now and then a book unlocks a topic. More rarely, an NPC reacts to something you've read ("You've read *The Seven Kingdoms*? Then you know why Stromgarde won't let it go.").
- The journal keeps a short "Books read" list.

### 4.10 Dialogue UI
- Opens on the relevant gossip and quest events for NPCs with content, in front of the default window.
- **Repeat visits stay short.** You'll talk to your vendor, flight master and trainer hundreds of times, and that must never become a chore.
  - **Full conversation:** on the first meeting, or when the NPC has **something new**: an unheard throughline beat, a reaction to a recent quest, deed or claim, a new take on a topic, or a noticing moment that's due and off cooldown. The engine decides this by checking whether any eligible, unseen content clears a priority threshold.
  - **Otherwise, compact mode:** one short, varied greeting line in a small bar (it may carry a brief noticing moment if one is due), and the normal Blizzard window opens immediately underneath.
  - **"Talk" always overrides.** A Talk button on the compact bar, or the Talk keybind, opens the full conversation anyway.
  - **Defaults by role:** service NPCs (vendors, flight masters, trainers, bankers, stable masters, auctioneers) default to compact. Story NPCs open fully whenever they have something new.
  - **Setting:** compact line plus business (default), skip straight to business, or always open fully.
  - **Optional marker,** off by default: a line in the NPC's tooltip saying they have something new to say. It's off by default because it would spoil the feeling of discovery.
- **Layout:**
  - NPC 3D portrait, plus name and title
  - typewriter text (click or Space finishes it instantly)
  - up to 4 numbered choices, selectable with keys 1–4
  - always a "Get on with it" option that opens the normal Blizzard window
  - an "Ask about…" button (4.8)
- A **"Talk to Target"** keybind and slash command for NPCs that have no gossip, within interaction range.
- Escape closes it. The window respects UI scale, can be moved, and remembers its position.
- **Settings panel:**
  - turn individual features on or off
  - acknowledgment frequency slider
  - barks on/off
  - insanity effects on/off and intensity
  - journal voice (first-person diary or third-person chronicle)
  - alignment hints on/off
  - text-to-speech on/off
  - the accessibility options (4.15), how to handle other dialogue addons (4.14), and the content-pack manager (4.16)
- Visual style: [e.g., "parchment and dark wood, very readable, uncluttered"].

### 4.11 Journal
- Its own window, opened from a slash command and a minimap/addon-compartment button.
- **Tabs:**
  - **Chronicle:** prose recaps of conversations by date and zone, searchable.
  - **People I've Met:** each NPC's affinity, when you last talked, and notable things said.
  - **Character Sheet:** alignment chart, titles, traits, opinions, taint, town standings (tier names, not raw numbers), and the **Origin** page (see 4.6).
  - **Topics:** everything the player knows about, who said what about it (including conflicting claims), and the "Books read" list.
  - **Deeds:** first dungeon, first death, reaching 60, and so on.
  - **Notes:** the player's own writing.
- Recaps come from templates attached to nodes and choices, written in the voice the player chose in settings.
- **Throughlines in the journal:** each beat is recorded in the Chronicle when it happens. Once a thread has 2–3 beats, the journal can add a reflective entry that connects them ("That's the third person this week to bring up the stonemasons…"). These are musings, never objectives or to-do lists.
- **The journal is the character's point of view, not the truth.**
  - It records what NPCs claimed as claims ("Dughan insists…").
  - It notes contradictions once the player has heard both sides.
  - It only treats something as settled once it has been exposed or confirmed.
  - Its tone can lean with the character's dominant traits: a cunning character's journal is more suspicious.

### 4.12 Fun systems (later milestones)
- **Temporary insanity.** Triggered by specific objects, NPCs or interactions.
  - Effects: scrambled dialogue text, intrusive extra choices, fake whispers in the chat frame, NPC names occasionally wrong, journal entries in "a different hand", a vignette at the screen edges.
  - Cures: resting, the Camping buff, praying at a shrine or cathedral, or time.
  - Rules: cosmetic only, toggleable, intensity setting, and **no flashing or strobing**.
- **Drunk replies** (slurred choice text) and **ghost dialogue** (only spirit-sensitive NPCs respond).
- **Proximity barks:** short lines from named NPCs nearby, heavily rate-limited, shown as local chat or a floating bubble.
- **Addon-side errands:** an NPC asks for something the addon can verify (an item in bags, visiting a location, a kill count). Rewards are addon-only: journal entries, affinity, titles. Never present these as real quests.
- **Optional narration** with the client's built-in text-to-speech, if available.

### 4.13 Dev and content tools (build early)
- `/rpgd capture` plus an auto-capture toggle. It records the target NPC's ID (from GUID), name, subzone, map coordinates, level, and whether it has gossip into account-wide SavedVariables. It also logs every quest turned in, with its ID and title. **This is how we get real IDs.**
- **Text capture** (part of the same capture system). When the player opens an NPC's gossip or a quest, record:
  - the NPC's gossip greeting text
  - the quest's title, description, objectives, progress text and completion text
  - which NPC gave the quest, and which NPC it's turned in to

  This is **reference material for writing voice bibles. It never ships in dialogue.** An out-of-game script exports it per zone as `reference/<zone>.md`.
- `/rpgd spoof race=Gnome class=PRIEST level=8 form=bear ...` overrides any `ctx` field for testing.
- `/rpgd why` shows which line won, its score, the runners-up, and why other lines failed.
- `/rpgd dump ctx` prints the current context.
- `/rpgd threads` lists every throughline's state, the beats heard and the beats available, and can reset or force a thread for testing.
- `/rpgd claims` lists the claims the player has heard, who told them, and whether each has been exposed.
- `/rpgd topics` lists known topics and can teach or forget one for testing. `/rpgd die <cause>` fakes a death record so spirit healer lines can be tested without dying.
- **Out-of-game tooling** (Python 3, standard library only):
  - **Validator:** checks the schema, flags TODO IDs and IDs missing from the registry, unknown condition keys and tokens, duplicate IDs, unreachable nodes, nodes without an exit, thread beats that can never be reached, `heardLine` references to lines that don't exist, and voice bibles with no sources or no quests listed (an NPC with no quests must say so explicitly).
  - **Capture importer:** reads my SavedVariables capture file and builds the NPC/quest ID registry the validator uses.
  - **Coverage report:** per zone and per NPC, the number of lines and nodes, which race/class/gender combos have specific content, which acknowledgment categories are covered, and which quests have before/during/after reactions. It also includes a throughline map showing which NPCs carry beats for which threads, and, for each topic, which NPCs have their own take on it.
- Engine unit tests that run outside the game against a mocked API.
- **"This line is wrong" button.** A small flag icon on the dialogue window.
  - One click saves the line ID, the NPC, the full `ctx` snapshot and an optional one-line note to account-wide saved data.
  - `/rpgd flagged` lists the flags.
  - An out-of-game script turns them into a report I can hand you to fix.
- **AI-voice checker** (out of game, runs alongside the validator). Its failures block a milestone, just like validator errors. Two parts:
  - **Banned phrases:** a list in `banned_phrases.txt`, which I'll keep adding to.
  - **Sameness check:** flags near-identical lines across different NPCs, too many NPCs opening the same way, and words or phrases overused within one NPC or one zone.
  - **Mad-lib check:** flags lines built mainly around `{race}` or `{class}` tokens, and noticing lines placed in pools so broad that any NPC could say them.
- **Simulation test** (out of game). Run thousands of random but valid characters (mixes of race, class, level, zone, history and state) through the engine for every NPC. Report:
  - how often each NPC falls back to generic lines
  - lines and thread beats that never fire
  - impossible references, such as a line about a quest that character couldn't have done at that level or on that faction
  - contradictory conditions
  - how often acknowledgments appear
  - false claims that can never be exposed, unless they're marked as deliberately open
  - topics the player can learn that nobody has anything specific to say about
  - special reply options that can never appear, or that always succeed or always fail
  - lines that stack too many conditions about the player (the "everything matters sometimes" rule in 4.4)

### 4.14 Compatibility with other addons
- **Other dialogue addons.** Detect addons that also replace the talk and quest windows, such as Immersion and DialogueUI. Let the player choose how to handle them in settings:
  - RPG Dialogue takes over
  - RPG Dialogue steps back and only appears for NPCs it has content for, or only through the Talk keybind
  - RPG Dialogue is off

  Pick a sensible default, and never leave two dialogue windows fighting each other.
- **Quest helpers and vendor addons** (e.g., Questie): when the player hits "Get on with it", the default window must open exactly the way those addons expect.
- **Total RP 3 (optional):** if it's loaded and the setting is on, `{name}` uses the player's roleplay name and title. Only read from it. Never require it, and make sure everything works without it.
- Test with each detected addon both loaded and unloaded. List known conflicts in the README.

### 4.15 Accessibility
- Text size (independent of UI scale), line spacing, and a high-readability font option. Bundle a font only if its license allows it.
- Text speed slider, instant text, and auto-advance with an adjustable delay.
- Full keyboard navigation. Controller support through the client's gamepad API if Forever has one; otherwise make the window easy for gamepad addons such as ConsolePort to drive.
- Never rely on color alone (alignment hints, standing tiers). Offer a high-contrast theme.
- One **reduce-motion** switch that turns off the typewriter effect, the insanity effects and any other screen effects.
- Any sound the addon plays can be turned off.

### 4.16 Content packs (community-ready)
- All dialogue lives in **content packs**: separate small addons (e.g., `RPGDialogue_Elwynn`) that register with the core through a public, versioned API. Our own zone packs use exactly the same API, so community packs work just as well as official ones.
- **Pack metadata:** id, name, author, version, data-format version, zones and NPCs covered, dependencies.
- Packs load on demand by zone. The core checks the data-format version and refuses an incompatible pack with a clear message.
- **When two packs cover the same NPC,** merge them by default (their lines are pooled and scored normally). Each pack also has a priority and an override flag.
- A pack manager in settings turns individual packs on and off.
- **`PACK_AUTHORING.md`** explains the format, points to `CONTENT_GUIDE.md`, and shows how to run the validator, so other people (and other AI sessions) can make packs.
- The validator works on a single pack and also checks references between packs, such as a throughline that spans several.

### 4.17 Release, updates and backups
- **Packaging** for CurseForge and Wago with the standard packager setup (`.pkgmeta`), so tagging a version in git produces a release. The core and each pack have their own version numbers and changelogs.
- **Blizzard's UI add-on policy:** addons must be free and their code can't be obfuscated. Check the current policy before the first release.
- Any bundled libraries (e.g., for serialization or compression) are embedded properly, with their licenses.
- **Export/import:**
  - `/rpgd export` produces a copyable text string of the character's whole story: memory, alignment, origin, town standings, throughlines, journal.
  - `/rpgd import` restores it after a confirmation. Validate the string first, and refuse a bad one without touching existing data.
- **Corrupted save data:** on load, check for it. Repair what can be repaired, set aside what can't, and tell the player. Never wipe anything silently.
- The README reminds players to back up their WTF folder.

## 5. Writing rules for dialogue content

- **Every character comes from their lore and their quests.** This is the foundation for everything else.
  - **Characters with established lore** (Bolvar, Thrall, Magni, Cairne, Sylvanas, Fandral, Jaina, and so on) must sound and think like their canon selves in this era.
  - **For everyone else, their quests and in-game text are the source.** A quest giver's personality, worries, relationships and voice come from what they ask the player to do, why, and how they say it. A farmer whose quest is about wolves eating her chickens is worried, practical and probably a little embarrassed to ask. A marshal who sends you to deal with the Defias carries the weight of a town he can't fully protect.
  - **Their agendas, secrets, noticing moments and opinions grow from that same source.** Never give an NPC a personality, backstory or allegiance that contradicts their lore or their quests.
  - **Where an NPC has almost nothing** (a vendor with one gossip line), build from their role, location and what the people around them say, and keep it modest. A small character can be vivid without an invented life story.
- **No AI voice.** Follow `banned_phrases.txt`.
  - Starter list: "Ah, adventurer"; "Greetings, traveler" as a default opener; "a testament to"; "tapestry"; "delve"; "in these trying times"; the "it's not just X, it's Y" pattern; modern slang; therapy-speak.
  - The test: with the name hidden, you should still be able to tell which NPC is talking.
- **Original writing.** Read Blizzard's quest and gossip text to learn a character's voice, but never copy it into dialogue. Reference events in your own words.
- **Timeline discipline.** This is Forever's Year 1 continuity. No NPC knows or hints at later events (Burning Crusade onward, the fall of the Lich King, Cataclysm, retail lore changes). If you're unsure whether something has happened yet in Forever, leave it out or ask me.
- **Keep it short.** 1–3 sentences per NPC beat. Reply options of about 15 words or fewer.
- **Every node has an exit.** Choices must differ in values and tone, not just wording.
- **Hyper-specific beats generic.** Use nearby place names, the quest just finished, the player's actual pet name.
- **Acknowledgments are character moments, not mad-libs.** Never "Greetings, {race} {class}." Write what *this* person would notice and how *they'd* react: the child's delight, the flight master's professional pride, the blacksmith's wince. A guard is curt, an innkeeper chatty, a Forsaken apothecary sardonic. If any NPC could say it, it isn't an acknowledgment. See the examples in 4.4.
- **Race, class and gender lines follow the same rule.** They should be real reactions with a point of view: a night elf sentinel's cool assessment of a human hunter, or a tauren elder's interest in an orc mage. Not a swapped-in label.
- **Gender via tokens, always respectful.** In-world racial friction is fine when it's true to the lore (a dwarf grumbling about elves), but never echo real-world bigotry.
- **Level-aware and relative-power-aware.**
- **New combinations and the Skyborne feel new.** NPCs can be curious, skeptical or impressed.
- **The world keeps talking about itself.** Whenever you write an NPC, ask: what quests nearby would this person care about? Who else would they have opinions on? What did the player probably just do? Write before/during/after quest reactions and cross-references wherever they fit naturally.
- **Origin and town standing come through in small ways.** A Westfall farmhand gets a nod from the Saldeans. A town that thinks you're trouble has guards who watch you a little too closely. Origin lines are always extras, never something a conversation depends on.
- **Let people be unreliable.** Give NPCs agendas, grudges and blind spots, and let those shade what they say. Not every NPC should be trustworthy, and the player should sometimes be misled. Lies should be plausible and in character, and should leave a thread an attentive player can pull.
- **Restraint keeps the flair.** Follow "everything matters sometimes" (4.4). A line that notices one thing well beats a line that lists five. Special reply options, Fel Taint and books stay rare, so they land when they show up.
- **Even a brush-off has a voice.** "Never heard of it" from a dwarf guard, a Forsaken apothecary and a gnome tinker should sound like three different people.
- **Disagreement is good.** When two NPCs have reason to see something differently, write both views with conviction. Don't add a "correct" NPC who settles it, unless the claim file says it gets settled.
- **Throughline beats feel like overheard life, not exposition.** Leave threads half-told. Let NPCs disagree with each other. Trust the player to connect the dots.

### Voice bible format
Every NPC with custom content gets a voice bible entry. **Write the first two fields before anything else, because everything else is built from them:**
- **sources:** where this character comes from: their wiki page if they have one, their captured gossip and quest text, the zone's lore sheet. A bible without sources fails validation.
- **their quests:** each quest they give or are part of (by ID), and what it reveals about them: what they fear, want, resent, or are proud of

Then:
- ID, name, title, location, faction, race, role
- 3–5 personality adjectives
- speech patterns, dialect, verbal tics
- what they know and care about
- relationships
- default attitude toward each race, class and faction
- lore anchors
- things they would never say

Add these fields too:
- **threads they could carry:** the existing or potential throughlines this NPC has a stake in
- **agenda:** what they want, from the player and from the world
- **secrets:** what they hide, and from whom
- **reliability:** the topics where they're trustworthy, biased, mistaken or lying
- **what they notice:** the 2–3 things about the player this NPC tends to react to (see 4.4)
- **topics:** the "Ask about…" topics they have their own take on

Write lines from the bible. Also write `CONTENT_GUIDE.md` documenting the schema, these writing rules, the bible format and how to write throughlines, agendas and claims, so future sessions (including other AI sessions) produce consistent content.

## 6. Priorities

- **MVP:** compat layer, context snapshot, engine, dialogue UI, NPC memory, quest-state awareness (before/during/after), capture/spoof/why tools, validator, AI-voice checker, simulation test, the "this line is wrong" button, the content-pack format (used for our own packs from the start), handling of other dialogue addons, basic accessibility (text size, text speed, instant text, keyboard navigation), vertical slice.
- **Phase 2:** alignment, traits, opinions, gossip network, claims and lies, town standing, throughlines, "Ask about…" topics, special reply options, innkeeper rumors, broader acknowledgments, journal, origins, export/import.
- **Phase 3:** insanity, the full spirit healer conversations, books, barks, errands, text-to-speech, Total RP 3 support, full accessibility pass, community pack docs, release packaging, polish.
- **Phase 4 and later:** content expansion, zone by zone.

## 7. Vertical slice

Zone: [e.g., Northshire Valley + Goldshire]. 10–15 NPCs, including at least one major quest giver, the trainer for my class, an innkeeper, a vendor, guards (shared pool) and one unnamed NPC type.

The slice must demonstrate each of these at least once:
- race, class and gender lines
- a line for a specific race/class combination
- a level-band line
- a line that depends on quest history
- a noticing moment only that NPC would make (in the spirit of the child and the druid), including one live reaction to something that happens during the conversation
- compact repeat visits for a service NPC, with the full conversation coming back once they have something new
- return-visit memory
- a choice that shifts alignment
- an opinion stated to one NPC that another NPC brings up later
- one quest with reactions before, during (including objective progress) and after, including from an NPC who wasn't involved in it
- an NPC who reacts to a specific line the player heard from a different NPC
- one complete throughline of 3–5 beats across at least 3 NPCs, with two possible outcomes (it can be fully finished in M4)
- a town standing change that both a guard and a named NPC react to (finished in M4)
- an NPC with an agenda who bends the truth, a second NPC whose account contradicts theirs, and a way for the player to confront the first one (finished in M4)
- one "Ask about…" topic that at least 3 NPCs answer differently, including one brush-off (finished in M4)
- one special reply option (`[Intimidate]`, `[Persuade]` or `[Deceive]`) that can succeed or fail depending on the character (finished in M4)
- the local innkeeper passing on a rumor that teaches a topic (finished in M4)
- origin options for my character's race and class, and an origin-only line. Conversations must still work with no origin set (finished in M5)

Use NPC and quest IDs only from my capture data. Use placeholders until then.

## 8. How to work with me

- **You can't run WoW, so I'm your hands.** After each milestone, give me a short numbered in-game test checklist and tell me exactly what to paste back: error text from BugSack/!BugGrabber, `/rpgd why` output, my capture file.
- **Start with Milestone 0 and stop.** Write `DESIGN.md` containing:
  1. your proposed file and folder structure
  2. the data schema, with one complete example NPC file
  3. the engine's scoring approach, with example weights
  4. everything you need from me
  5. risks and API unknowns

  Then wait for my answers.
- After that, build **one milestone at a time** and stop after each one with the test checklist.
- Give me complete, working files. No "..." or "rest unchanged" placeholders in code.
- If a feature can't be done with the API, say so plainly and propose the nearest alternative.
- Keep `DESIGN.md` and `CHANGELOG.md` up to date.
- **Git.** Set up a git repository in M0. Commit at the end of every milestone, and before any big refactor, with clear messages. Never rewrite history.
- **Hand-off notes.**
  - At the end of every session, or whenever I say we're stopping, update `HANDOFF.md`: what's done, what's half-done, open questions, known bugs, and the exact next step.
  - At the start of every session, read `HANDOFF.md`, `DESIGN.md` and `CONTENT_GUIDE.md` (once it exists) before doing anything else. You won't remember previous sessions, so these files are your memory.
- **A lore sheet before writing any zone.** Before writing dialogue for a zone, add a short sheet for it to `LORE_NOTES.md` covering:
  - key NPCs and what they care about, drawn from their lore and their quests (use my captured text in `reference/<zone>.md`)
  - the zone's quest storylines
  - what has and hasn't happened yet in Year 1

  Mark anything you're unsure of, and cite a source for anything you looked up.
- **Flagged lines.** When I send a "this line is wrong" report from the in-game button, fix every item and note each fix in `CHANGELOG.md`.

**Milestones:**
- **M0:** Design, git repository, `HANDOFF.md`. Stop for my answers.
- **M1:** Skeleton: TOC, compat layer, context snapshot, events, slash commands, capture/spoof/dump/why tools, SavedVariables with migrations.
- **M2:** Engine, schema, content-pack format, dialogue UI with basic accessibility, handling of other dialogue addons, NPC memory, validator, engine tests, the "this line is wrong" button, compact repeat visits, live reactions.
- **M3:** Vertical slice content, a lore sheet for the slice zone, voice bibles, `CONTENT_GUIDE.md`, `banned_phrases.txt`, the AI-voice checker, the simulation test, coverage report.
- **M4:** Alignment, traits, opinions, gossip network, claims and lies, town standing, NPC agendas and claims, throughlines (thread engine, pacing, `/rpgd threads`, the vertical slice thread finished), "Ask about…" topics, special reply options, innkeeper rumors.
- **M5:** Journal, origins (race/class lists for my approval), export/import, save-data corruption checks.
- **M6:** Fun systems, the full spirit healer conversations (death log and cause tracking), books.
- **M7:** Content expansion workflow and tooling polish.
- **M8:** Release prep: Total RP 3 support, full accessibility pass, `PACK_AUTHORING.md`, CurseForge/Wago packaging, policy check.

## 9. About me and my setup

- Interface/TOC number: [run `/dump (select(4, GetBuildInfo()))` in-game and paste the result]
- My test character(s): [race / class / faction / level]
- Error-catching addons I use: [e.g., BugSack + !BugGrabber]
- Where we're working: [Claude Code in my AddOns folder / chat]
- Python installed: [yes/no]
- Other addons I use: [e.g., Questie, Immersion, DialogueUI, Total RP 3]
- Final addon name and license: [e.g., "RPG Dialogue", MIT]
- Extra Forever lore notes beyond section 10: [optional]
- Visual style preference: [describe]

## 10. Skyborne lore brief

This brief comes from the Warcraft Wiki's Skyborne pages and Blizzard's Forever announcement, as of mid-November 2026. It is everything you may treat as fact about the Skyborne. Where it says nothing, keep NPC lines vague or ask me.

**Who they are**
- High elves who call themselves the *shen'dorei*, "the hidden people". They descend from the people of Eldre'Thalas (today's Dire Maul), including Highborne magisters and other night elf citizens.
- After the Great Sundering, Prince Tortheldrin drew power from the Twisting Nether through crystal pylons. A rebellion led by the **Shal'nan** opposed him. His purge, and the rebellion's final clash, drove the rebels into exile nearly ten thousand years ago.
- The rebels sailed west from Eldre'narr on the Feralas coast. Wind spirits sheltered them and lifted **Zephras Isle** into **Skywall**, the Elemental Plane of Air.
- Millennia in Skywall made them slimmer and more like high elves. A blue-skinned "Sky-Touched Blessing" in newborns has spread quickly in recent generations.

**Why they've returned to Azeroth**
- Their wind-spirit patrons rarely spoke of Al'Akir and dodged questions about him. Then the spirits vanished, the pylons began failing, and the islands started drifting apart.
- The **Al'Aketh**, a cult that worships Al'Akir, exploited the crisis. When the wards fell, their leader, High Priestess Lorthuna, lit a beacon for Al'Akir's followers. Rohash of the Conclave of Wind threatened to report the Skyborne to the Windlord, so they left Skywall. (High Elder Talaanis Shadowsong believed Al'Akir might take years or decades to act.)
- Ansirem Runeweaver of the Kirin Tor and Muln Earthfury of the Earthen Ring helped defeat Lorthuna's forces.

**Two orders, two factions**
- **High Order (Alliance):** descendants of the Highborne magisters, seeking to recover arcane knowledge.
  - They joined the Alliance after contacting the Kirin Tor, and are based at the Sky Enclave in Dalaran.
  - Leader: Elaadrin Evengale.
  - Alliance Skyborne start Friendly with Stormwind and the Kirin Tor.
- **Windshapers (Horde):** shamanistic, honor the elements, and feel a debt to the wind spirits.
  - They joined the Horde after contacting the Earthen Ring, and are based at Camp Gev'rek in Mulgore.
  - Leader: Ayessa Dawnsinger.
  - Horde Skyborne start Friendly with Thunder Bluff.
- Relations between the two orders are strained and sometimes violent, with grievances over sacred sites and deaths.
- **Classes:** Druid, Hunter, Rogue and Warrior on both sides; Mage for Alliance only; Shaman for Horde only.
- **Racials** (useful for acknowledging states):
  - shared: Walk on Air (a short steerable glide), Elemental Insight and Wind Blessed (both passive)
  - Alliance: Read Leyline
  - Horde: Skysight
- **Racial mount:** the Galestrider.

**Other groups, people and places**
- **Al'Aketh:** the hostile Al'Akir cult (shaved heads, grey robes).
- **Nightclaw Druids:** secretive, independent druids of Shadowgale Forest in northern Zephras Isle.
- **Peacekeepers:** Zephras Isle's militia. Their elite are the Empyrean Blades, once the Shal'nan's guard.
- **Rangers of Thendal Grove:** active around Thendal Village.
- **People:**
  - Talaanis Shadowsong, High Elder of Zephras Isle.
  - The Shal'nan, their first leader, who abdicated and disappeared along with the wind spirits. Fate unknown.
  - Luminarian, a legendary magesmith, now dead.
- **Places:** Valanaar (the main town), Anvilas, Siroccas, Shen'dramar, New Eldre'naar, the Shrine of Akir, the Rohashi Spires, the Ban'aethal ruins.

**Magic and culture**
- Windshaper shamanism centers on the four elements. Initiates undergo elemental trials and consume enchanted sapta.
- **Skysight**, a gift for perceiving elemental spirits, is weakening. Arcane talent is reportedly declining too, even as ley lines break through the surface.
- Druids are rare and have a connection to the Cenarion Circle. Their faith favors the elements over Elune.
- Windstones serve as both a power source and currency.
- They're governed by an elected Council of Elders, set up after the Shal'nan abdicated.
- At coming of age, youths receive an heirloom passed down from the dead. The ashes of the dead are scattered to the wind.
- Customs include clothcraft, hippogryph-feather hair ornaments, and greetings like "Winds be with you."
- **Names** often have doubled letters ("aa"). Some surnames match Quel'Thalas names (Dawnsinger, Sunlance) or night elf ones (Shadowsong, Whisperwind). Whether that means real family ties is unknown, so never treat them as related.

**Not canon.** The wiki lists these as speculation, so never state them as fact:
- that the missing patrons are linked to Thunderaan
- that the Wind Hollows are tied to the patrons' disappearance
- that the decline in magic, the weakening skysight and the physical changes are connected

**Unknown, so don't invent:**
- the Skyborne's views on the Burning Legion, the Scourge and the Old Gods
- how night elves, humans, tauren, the Cenarion Circle and others feel about them

NPCs can be curious, wary or polite about these strangers, but shouldn't state facts about them that this brief doesn't support.

---

## Follow-up prompt: adding a zone (for later sessions)

> Read `HANDOFF.md`, `DESIGN.md` and `CONTENT_GUIDE.md`. Add dialogue content for **[ZONE]**. My capture data and captured quest/gossip text for this zone are attached ([FILES]).
> 1. Write the zone's lore sheet in `LORE_NOTES.md`.
> 2. List the named NPCs from the capture data and propose a coverage tier for each (major / quest giver / service / pooled). Wait for my OK.
> 3. Write voice bibles for the approved NPCs, built from their lore and their quests (sources and quests first).
> 4. Propose throughlines. Look for existing threads from other zones that could continue here, and 1–2 new ones rooted in this zone's quests and characters. Wait for my OK.
> 5. Write dialogue following the content guide, including before/during/after reactions for this zone's quests, echoes of conversations from nearby zones, town standing files for this zone's settlements, the zone's topics and innkeeper rumors, and origin nods where they fit. Prioritize [MY RACES/CLASSES], but keep fallbacks for everyone.
> 6. Run the validator, the AI-voice checker, the simulation test and the coverage report, and fix everything they flag.
> 7. Give me an in-game test checklist.
> 8. Update `HANDOFF.md` and commit.
