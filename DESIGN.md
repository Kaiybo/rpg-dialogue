# RPG Dialogue: Design

> **Status:** Milestones 0–8 built (see section 7). Nothing has run in the game yet: the next step is your in-game test pass. Section 4's questions are still open.
> **Last updated:** 2026-11-13 (M8)
> Every session starts by reading this file, `HANDOFF.md` and (from M3) `CONTENT_GUIDE.md`. Keep it current.

Contents
0. Forever's client: what I found and what it changes
1. File and folder structure
2. Data schema, with a complete example NPC
3. The engine and how it scores lines
4. What I need from you
5. Risks and API unknowns
6. Decisions you can veto
7. Milestone status
8. Accessibility and other addons

---

## 0. Forever's client: what I found and what it changes

The brief says not to assume Forever's API is either Classic Era or modern. I checked warcraft.wiki.gg (sources below), and it points clearly one way:

- Forever **shares Mainline (retail) WoW's UI architecture** and has "the vast majority of APIs available in 12.1.5". Forever and Midnight are two game types in the same code family. Forever's internal name was *Camelot*.
- **Midnight's addon restrictions, including secret values, are active in Forever.**
- **TOC interface number is 16001** for patch 1.60.1. The wiki already lists a patch 1.60.2, so we confirm your number with the probe in section 4.
- `_Forever.toc` is a valid TOC file suffix. (The BigWigs packager, which knows Forever as of November 2026, writes `_Camelot.toc` for generated Forever TOCs. We use plain `.toc` files, so neither matters unless a mixed setup needs one.)
- Beta 5 **obfuscated the server and spawn-ID parts of creature GUIDs**. The NPC-ID part should still be readable. The probe checks this.

What this changes:

1. `Compat.lua` targets the modern API first: `C_GossipInfo`, `C_QuestLog`, `C_UnitAuras`, `Settings`, `C_AddOns`, `PLAYER_INTERACTION_MANAGER_FRAME_SHOW`. It keeps the legacy fallbacks the brief asks for, but they will probably never run. The probe will tell us which of them are live.
2. **The combat log is very likely closed to addons.** Midnight removed `COMBAT_LOG_EVENT_UNFILTERED` for addons, and the wiki marks the event as restricted. Death-cause tracking for spirit healers therefore uses fallbacks (risk R3). It will be coarser than the brief imagines.
3. **Anything read during combat may be "secret"**: addons can display it, but can't branch on it. The dialogue never needs combat data. `ctx` is built out of combat, and a conversation that starts in combat gets compact mode only.
4. We can't tell two spawns of the same NPC apart, because spawn IDs are obfuscated. NPC memory is keyed by NPC ID, which is what we wanted anyway.

Sources (warcraft.wiki.gg):
[Patch 1.60.1/API changes](https://warcraft.wiki.gg/wiki/Patch_1.60.1/API_changes) (TOC 16001) ·
[Patch 1.60.1/API changes/notes](https://warcraft.wiki.gg/wiki/Patch_1.60.1/API_changes/notes) (Mainline architecture, 12.1.5 APIs, secrets active, `_Forever.toc`, GUID obfuscation) ·
[COMBAT_LOG_EVENT](https://warcraft.wiki.gg/wiki/API_COMBAT_LOG_EVENT) (marked as having restrictions)

---

## 1. File and folder structure

The git repo is **not itself an addon**. It holds several addons side by side: the core (code only, no dialogue) and the content packs (dialogue only). Our own packs use exactly the same public API that community packs will.

```
rpg-dialogue/                          git repo root
├─ DESIGN.md  HANDOFF.md  CHANGELOG.md  LORE_NOTES.md  README.md  LICENSE
├─ CONTENT_GUIDE.md                   writing rules, bible format, threads/claims how-to
├─ PACK_AUTHORING.md                  making packs; the step-by-step zone workflow
├─ banned_phrases.txt
├─ .luacheckrc  .pkgmeta  .gitignore
├─ .github/workflows/                 checks.yml (every push), release.yml (tags: checks + packager)
│
├─ RPGDialogue/                        CORE ADDON (no dialogue text in here)
│  ├─ RPGDialogue.toc
│  ├─ Bindings.xml                     Talk to Target, Open Journal, Ask About
│  ├─ Locales/enUS.lua                 every UI string (L table)
│  ├─ Core/
│  │  ├─ Init.lua                      namespace, event dispatcher, logger, dev mode
│  │  ├─ Compat.lua                    THE ONLY FILE that calls Blizzard game APIs (see note)
│  │  ├─ Util.lua                      seeded RNG, time helpers, table helpers
│  │  ├─ SavedData.lua                 defaults, schema version, migrations, repair, trimming
│  │  ├─ Trackers.lua                  what the addon logs itself: turn-ins, deaths, deeds,
│  │  │                                books, hearth, drunk state, zones discovered
│  │  ├─ Context.lua                   builds ctx (lazy fields) + the spoof overlay
│  │  ├─ Conditions.lua                registry of condition keys: evaluator, weight, kind
│  │  ├─ Tokens.lua                    {name}, {g:lad|lass}, ...
│  │  ├─ Engine.lua                    gather → filter → pace → score → pick; /why traces
│  │  ├─ Pacing.lua                    per-system budgets/cooldowns, anti-repetition fade
│  │  ├─ Memory.lua                    NPC memory, seen lines, lasting "heard" record
│  │  ├─ Effects.lua                   applies choice/line effects
│  │  └─ PackAPI.lua                   RPGDialogueAPI (public), pack registry, LoD loading, merging
│  ├─ Systems/                         Threads  Rumors  Towns  Topics  Books  Insanity  Barks
│  │                                   Errands  Origins  Export   (alignment, traits, opinions,
│  │                                   claims and special options live in Core/Effects,
│  │                                   Conditions and Engine)
│  ├─ UI/
│  │  Theme  DialogueFrame  CompactBar (+ Blocker)  AskAbout  Settings  Launcher  Journal  ExportFrame
│  ├─ Integrations/
│  │  DialogueAddons (Immersion, DialogueUI)  TotalRP3 (read-only)
│  ├─ Media/Fonts/                     Atkinson Hyperlegible + its OFL licence (readable font)
│  └─ Dev/
│     Slash  Capture  Spoof  Why  Flag
│
├─ RPGDialogue_World/                  CONTENT PACK, loaded at login (cross-zone material)
│  ├─ RPGDialogue_World.toc  pack.lua  CHANGELOG.md (the pack's own)
│  ├─ generic.lua  pools.lua           last-resort lines; role pools (incl. the spirit healer tree)
│  ├─ threads.lua  claims.lua  topics.lua  towns.lua  books.lua
│  ├─ origins/<race>.lua   rumors/<region>.lua
│  └─ bibles/       voice bibles for anything in this pack (Markdown, not shipped)
│
├─ RPGDialogue_Elwynn/                 CONTENT PACK, load-on-demand by zone (example)
│  ├─ RPGDialogue_Elwynn.toc  pack.lua  CHANGELOG.md
│  ├─ npcs/<npc_key>.lua               one file per NPC with custom content
│  ├─ pools.lua  errands.lua           guards of Northshire and Goldshire; Eagan's errand
│  └─ bibles/<npc_key>.md              voice bibles (Markdown, not shipped)
│
├─ reference/<zone>.md                 captured Blizzard text. Writing reference only, never shipped
├─ tools/                              Python 3, standard library only
│  ├─ rpgd/luadata.py                  parser for the pack data subset and SavedVariables files
│  ├─ check_all.py                     every check in one command (--release for releases)
│  ├─ validate.py  voicecheck.py  coverage.py  simulate.py
│  ├─ new_zone.py                      plan a zone from capture data, then scaffold its pack
│  ├─ import_capture.py  export_reference.py  flag_report.py
│  ├─ registry/ids.json                NPC/quest/map ID registry built from your capture data
│  └─ link_addons.bat / link_addons.sh links each addon folder into your AddOns folder
└─ tests/                              runs outside the game
   ├─ wowmock.lua  loader.lua  run.lua  *_spec.lua    Lua 5.1 engine tests
   ├─ test_tools.py                    Python tool tests (on a scratch copy of the repo)
   ├─ fixtures/                        small test packs
   └─ sim_driver.lua                   the real engine, driven by tools/simulate.py
```

Notes:

- **Why the repo isn't the AddOns folder.** WoW only loads top-level folders in `AddOns`. `tools/link_addons` creates a junction (Windows) or symlink (macOS) for each addon folder, so the game always runs what's in the repo. If you'd rather not, I can hand you a zip per milestone.
- **Release.** `.pkgmeta` uses the BigWigs packager's `move-folders`, so one git tag produces the core and each pack as separate addons. `reference/`, `tools/`, `tests/`, every `bibles/` folder and all Markdown are left out of releases. Checked against the packager's source (v2, November 2026): it maps `## Interface: 160xx` to the Forever game type and handles the core folder sharing the package's name. A real tagged build is still to do.
- **"Every Blizzard API call goes through Compat.lua."** I read this as every global function and `C_*` namespace, plus frame template names. Widget methods on our own frames (`SetText`, `SetPoint`) are used directly. `.luacheckrc` enforces it: only `Compat.lua` may read WoW API globals. Every other file gets a short allowlist (`CreateFrame`, `UIParent`, font objects), so a stray API call fails lint.
- **Voice bibles are Markdown** next to the pack's content. Writers read prose better than tables. The validator still checks them: the `Sources` and `Their quests` sections must be non-empty, and an NPC with no quests must say so explicitly.

---

## 2. Data schema

### 2.1 Packs and how they load

A pack is any addon whose TOC carries `X-RPGD-*` fields:

```toc
## Interface: 16001, 16002
## Title: RPG Dialogue: Elwynn Forest
## Dependencies: RPGDialogue
## LoadOnDemand: 1
## Version: @project-version@
## X-RPGD-Pack: rpgd.elwynn
## X-RPGD-Format: 1
## X-RPGD-Load: zone
## X-RPGD-Zones: Elwynn_Forest

pack.lua
pools\guard_goldshire.lua
npcs\mcbride.lua
```

- **Discovery without loading.** At login the core reads every installed addon's `X-RPGD-*` fields with `C_AddOns.GetAddOnMetadata`, which works on addons that aren't loaded. It builds a zone→pack index, loads the `X-RPGD-Load: login` packs (World), and loads a zone pack the first time you're in one of its zones: on every zone signal (`PLAYER_ENTERING_WORLD`, `ZONE_CHANGED_NEW_AREA`, `ZONE_CHANGED`, `ZONE_CHANGED_INDOORS`) and again right before an NPC is identified. (0.10.1: a new character's first login doesn't know its zone yet at `PLAYER_LOGIN`, and Northshire to Goldshire never changes the zone, so Melika spoke from the innkeeper pool.)
- **Packs can't be unloaded** once loaded. Memory therefore grows with the zones you visit in one session. See R8.
- **Registration**, in each pack's `pack.lua`:

  ```lua
  RPGDialogueAPI:RegisterPack {
    id = "rpgd.elwynn", name = "Elwynn Forest", author = "RPG Dialogue",
    version = "1.0.0", format = 1,
    requires = { "rpgd.world" }, priority = 0,
  }
  ```
- **Versions.** The TOC's `## Version` is the release build (filled in by the packager from the git tag). Each pack also keeps its own content version in `pack.lua`, matched by the newest heading in the pack's own `CHANGELOG.md` (`check_all.py --release` checks they agree). `/rpgd packs` and the pack manager show it, and both report a pack whose `requires` aren't installed.
- **Format check.** The core refuses a pack whose `format` is newer than it understands. It prints one clear chat line and shows the reason in the pack manager. Older formats are migrated when a migration exists.
- **Two packs, same NPC.** By default they merge: lines, greetings, noticing moments and topic answers are pooled and scored normally. When both define a node with the same id, the higher `priority` wins. `override = true` on an NPC replaces lower-priority definitions of that NPC entirely.
- **Anything referenced from more than one zone** (threads, claims, topics, towns, origins) must live in a login-loaded pack. A thread therefore works whichever zone packs are loaded. A beat whose NPC isn't loaded yet simply isn't available until you get there.

### 2.2 The data subset: why the files look so plain

Data files are Lua, restricted to a strict subset:

- one fixed header (`local P = RPGDialogueAPI:Pack("…")` plus the placeholder constructors),
- then only statements of the form `P:Kind { … }`.

Inside the braces you may use strings, numbers, booleans, nested tables and the placeholder constructors `TODO_NPC`, `TODO_QUEST`, `TODO_ITEM`, `TODO_SPELL` and `TODO_MAP`. Variables, functions, concatenation and arithmetic are not allowed. This keeps "data, not code" honest, and it lets the Python tools parse every file without a Lua interpreter. The validator rejects anything outside the subset.

### 2.3 Kinds of data

| Kind | File | Lives in | Holds |
|---|---|---|---|
| `NPC` | `npcs/<key>.lua` | zone pack | one NPC: greetings, noticing moments, live reactions, nodes, topic answers |
| `Pool` | `pools/<role>_<community>.lua` | zone or World | lines for a role, optionally limited to a community or city |
| `Generic` | `generic/*.lua` | World | the last link in every fallback chain |
| `Thread` | `threads/<id>.lua` | World | a throughline: theme, NPCs, beats (keyed by NPC), states, endings, pacing |
| `Claim` | `claims/<id>.lua` | World | an NPC claim: who says it, truth status, what can expose it, or "deliberately open" |
| `Topic` | `topics/<id>.lua` | World | an "Ask about…" topic: name, category, how it's learned, `keywords` that name it in speech, `standard` for "ask anyone" topics (§3.11) |
| `Town` | `towns/<id>.lua` | World | town standing: subzones, member NPCs, related towns and spread, tier names, quests |
| `Origin` | `origins/<race>.lua` | World | the origin list for a race, including class-specific entries |
| `Rumors` | `rumors/<region>.lua` | World or zone | innkeeper rumor tables |
| `Book` | `books.lua` | World | a book the addon recognizes by title, and the topics reading it teaches |
| `Errand` | `errands.lua` | zone | an addon-side task: offer, `need` (`visit` / `item`+`count` / `kill`+`count`), thanks, addon-only reward |

Working examples of every kind are in the two shipped packs; `PACK_AUTHORING.md` lists where. An NPC file made by `tools/new_zone.py` carries `scaffold = true` until it's written: the game skips it (the NPC stays pooled) and `validate.py --strict` refuses it.

### 2.4 NPC

| Field | Meaning |
|---|---|
| `key` | stable string id, unique across all packs; references use it (`mcbride.e_dughan`). Community packs should prefix (`mypack_name`) |
| `id` | numeric NPC ID from capture, or `TODO_NPC("Name")` |
| `name` | display name, also the dev-mode match for a TODO id |
| `bible` | path to the voice bible |
| `role` | `questgiver`, `guard`, `innkeeper`, `vendor`, `trainer`, `flightmaster`, `stablemaster`, `banker`, `spirithealer`, `child`, … |
| `tier` | `major` / `quest` / `service` / `pooled`; drives pacing and the default open mode |
| `communities` | community tags shared with the gossip network and town standing |
| `notices` | ack categories this NPC may use. Comes from the bible's "what they notice" |
| `temper` | words used by special-option checks: `cowardly`, `sharp`, `proud`, `steady`, … |
| `open` | `full` or `compact`; overrides the role default |
| `greetings` | short lines for compact mode and repeat visits |
| `notice` | noticing moments (acknowledgments), each with `cat` and `place` (`before`/`after`/`replace`) |
| `react` | live reactions while the window is open (`on` = `form`/`pet`/`mount`/`stealth`/`aura`) |
| `start` | id of the first node |
| `nodes` | conversation nodes |
| `topics` | this NPC's own answers, keyed by topic id; `_none` is their personal brush-off |

### 2.5 Line

| Field | Meaning |
|---|---|
| `id` | unique within the NPC. The global id is `<npckey>.<id>` |
| `text` | 1–3 whole sentences (no stacked fragments; CONTENT_GUIDE §2). Tokens allowed |
| `when` | conditions, all of which must pass |
| `weight` | relative chance among tied lines (default 1) |
| `priority` | small score adjustment (default 0). Use sparingly |
| `tags` | free tags. `news` marks content that counts as "something new" (3.6) |
| `once` | shown at most once per character |
| `cooldown` | `"12h"`, `"3d"`, or `"5c"` (conversations) |
| `key` | keep a lasting record that the player heard it. Required for `heardLine` targets |
| `sys` | override which pacing budgets the line draws from (normally inferred from `when`) |
| `fx` | effects when the line is shown (rare: learn a topic, hear a claim) |
| `journal` | `{ first = "…", third = "…" }`: diary and chronicle voices |

### 2.6 Node and choice

A **node** is `{ lines = {…}, again = {…}, choices = {…}, big = true|nil, hub = true|nil, rotating = true|nil, journal = … }`. `big` marks a conversation that matters: alignment-reactive lines are allowed there, and alignment shifts count more. `hub` marks a node that `BACK` returns to (the start node always is one). `again` holds short lines shown when the player comes back to a node already shown in this conversation (0.26.0; CONTENT_GUIDE §7a). `rotating` marks a node that is meant to be visited again and again in one conversation (a story told, a question asked; 0.31.0): replies leading to it are never hidden as answered, and coming back to it draws a fresh line instead of an `again` line. Its lines usually set an `npcFlag` so that only the replies for the line just said pass.

**Exploring (0.26.0).** The session keeps the nodes shown (`s.visited`); NPC memory keeps every node shown in any conversation (`mem.nodes`). `Engine.Choices` hides a reply whose target was already shown in this conversation, unless the target is a hub or the reply is `repeatable`; replies to nodes explored in earlier conversations are marked `explored` (dimmed in the box). At most `Engine.MAX_CHOICES` (6) show, in the writer's order; when there are more, explored replies drop first, then unconditional branches, then any branch; exits stay.

A **choice**:

| Field | Meaning |
|---|---|
| `text` | about 15 words or fewer |
| `when` | conditions for showing it |
| `tag` | `Persuade` / `Intimidate` / `Deceive`, or an identity tag (`Paladin`, `Westfall farmhand`, `Hero of Goldshire`) |
| `check` | for Persuade/Intimidate/Deceive: `{ pass = { conditions } }`. Defaults come from the NPC's `temper` (3.9) |
| `fx` | effects (2.8) |
| `next` | a node id, `"END"`, `"BUSINESS"` (closes our window and leaves the Blizzard window that is already open underneath), or `"BACK"` (the last hub visited) |
| `repeatable` | keep offering it after its node was shown in this conversation |
| `fail` | for checks: `{ fx = …, next = … }` |
| `journal` | `{ first = …, third = … }` |

**"Get on with it" is added to every node by the UI.** Authors never write it. It goes to the NPC's business inside the box (§3.6 "No game menu in between").

### 2.7 Conditions

Each key has a **weight** (its contribution to the score) and a **kind**. *Hinges* are facts about the player; a line should hinge on one or two. *Gates* are bookkeeping and add no score. Lists mean "any of": `race = { "Human", "Dwarf" }`.

| Family | Keys (value shape) | Weight | Kind |
|---|---|---|---|
| Quest, time-sensitive | `questActive` Q · `questObjective` {Q, left={min,max}} · `questReady` Q · `questRecent` {Q, days=N} | 60 | hinge |
| Quest, long-tail | `questBefore` Q (45) · `questDone` Q (40) · `questLater` {Q, days=N} (40) | 40–45 | hinge |
| Heard & threads | `heardLine` "npc.line" · `thread` {id, state=…/beat=…} · `heardClaim` id · `claimExposed` id · `claim` id (player's own) | 60 | hinge |
| Deeds & deaths | `deed` id · `deaths` {min,max} · `deathCause` "falling"/"drowning"/… · `killed` {name (word or list, in the creature's name, any case), min, max} (kills by you or your party, `char.kills`; no name = every kill; 0.54.0) · `cleared` "Uldaman" / {places} / {name, not = true} (the last boss of a dungeon or raid killed, names in `World.DUNGEON_BOSSES`; deed `cleared:<place>`; 0.58.0) | 40 | hinge |
| Origin | `origin` id | 35 | hinge |
| Who you are | `race` · `class` (`race`+`class` together score 50) | 25 each | hinge |
| Character | `alignment` {axis, min, max} · `title` · `trait` · `opinion` {topic, stance} · `pvpRank` N (minimum) / {min,max} / true / false (honor rank 1-14, Private/Scout to Grand Marshal/High Warlord; 0.54.0) | 30 | hinge |
| Dark | `taint` {min} · `insanity` {min} | 40 | hinge |
| Knowledge | `topicKnown` · `bookRead` · `homeInn` | 30 | hinge |
| Relationship | `metBefore` bool · `timesTalked` {min,max} · `daysSince` {min,max} · `affinity` {min,max} · `disposition` {min,max} (0-100, §3.12) · `townStanding` {town, tier/min} | 20 | hinge |
| State | `form` · `mounted` · `stealthed` · `ghost` · `pet` {family,type,named} · `debuffType` · `aura` spellID · `resSick` · `drunk` · `camping` · `durability` {max} · `nearlyNaked` · `tabard` · `equipped` · `outOfPlace` · `reputation` {faction,min,max} (faction names in `World.FACTION_IDS`, standings hated..exalted) · `profession` {name,min} · `pvpFlagged` · `honorKills` / `dishonorKills` {min,max} · `guild` true/false/name(s) · `guildRank` name(s) · `carrying` itemID / {ids} / {id, min} (bags and worn; 0.54.0) | 15 | hinge |
| World | `zone` · `subzone` · `holiday` · `power` (relative bucket) | 15 | hinge |
| Level | `band` · `minLevel`/`maxLevel` · `capital` · `resting` · `atInn` | 10 | hinge |
| Small touches | `gender` · `timeOfDay` · `faction` · `party` {race,class} | 5 | hinge |
| Story (M4) | `gossip` {topic, stance, delay, chance} (30) · `contradiction` topic (40) · `lieCaught` claim (60) · `money` {min,max} (10) | 10–60 | hinge |
| Gates | `chance` 0–1 · `flag` · `npcFlag` · `npcFlagBefore` (set in an earlier conversation) | 0 | gate |
| Combinators | `all` (sum of children) · `any` (best passing branch) · `not` (0: an absence isn't specific) | — | — |

The validator rejects unknown keys. Some keys come from fields the brief lists in `ctx` (`durability`, `nearlyNaked`, `profession` and so on). That's allowed, since the brief's list is open ("such as").

Pacing systems are **inferred** from condition keys: `alignment`/`title` → alignment, `taint` → taint, `origin` → origin, `trait` → trait, `opinion` → opinion, `bookRead` → book, `insanity` → insanity. A line's `sys` field overrides the inference. (Death lines have no budget: M6 removed it because it silenced spirit healers, whose whole conversation is about your deaths.)

### 2.8 Effects (`fx`)

| Key | Example | Notes |
|---|---|---|
| `align` | `{ light = 2, order = -1, honor = 0 }` | axes: +Light/−Shadow, +Order/−Wild, +Honor/−Cunning; diminishing returns applied by the engine ; choices only, and only on **stances** (statements, two or more per node, mutually exclusive: `Engine.IsStance`, remembered per NPC in `mem.stances[node]`; 0.33.0) |
| `taint` | `5` | Fel Taint, 0–100 |
| `trait` | `{ witty = 1 }` | |
| `opinion` | `{ defias = "hardline" }` | records the NPC who heard it, when, and their communities |
| `flag` | `{ set = { "x" }, clear = { "y" } }` | |
| `claim` | `{ id = "killed_hogger" }` | a player claim, checked against real history by NPCs who'd know |
| `affinity` | `1` | |
| `standing` | `{ goldshire = 2 }` | spreads to related towns per the town file |
| `thread` | `{ id = "stonemasons", beat = "b2", state = "unfolding" }` | |
| `hear` / `expose` | `"defias_common_thieves"` | NPC claims |
| `learn` | `{ "echo_ridge" }` | topics |

### 2.9 Special reply options (schema now, built in M4)

`check = { pass = { …conditions… } }` succeeds if the conditions pass against `ctx`. No dice. When `pass` is omitted, defaults apply:

- **Intimidate** passes if the NPC's `temper` includes `cowardly`, or `power` is `above`/`far_above`.
- **Persuade** passes with affinity ≥ 3, or disposition ≥ 65 (§3.12), or town standing Liked or better, or a dominant trait the NPC values.
- **Deceive** passes unless the NPC's `temper` includes `sharp` or the NPC can know the truth. A successful deception records a player claim.

### 2.10 Tokens

`{name}` (with Total RP 3 loaded and its setting on: your roleplay title and first name, e.g. "Sir Aldric"), `{npc}`, `{race}`, `{class}`, `{g:lad|lass}`, `{pet}`, `{zone}`, `{subzone}`, `{town}`, `{title}` (your RPG Dialogue alignment title), `{home}`, `{rank}` (honor rank name, "soldier" without one), `{guild}` ("your company" without one), and for spirit healers `{deaths}`, `{deathplace}`, `{killer}`.

**Tokens decorate. They never carry a line.** The voice checker flags lines built around `{race}` or `{class}`.

### 2.11 Complete example: Marshal McBride

McBride is chosen because the brief already uses him as its placeholder example. The facts come from his warcraft.wiki.gg page and vanilla quest data. **Quest names are vanilla's and must be confirmed against your capture data**, because Forever adds and changes content. Every ID is a placeholder, as constraint 6 requires.

**Voice bible** (`RPGDialogue_Elwynn/bibles/mcbride.md`):

```markdown
# Marshal McBride  (key: mcbride)

## Sources
- https://warcraft.wiki.gg/wiki/Marshal_McBride
- reference/elwynn.md#marshal-mcbride (captured gossip and quest text; pending capture)
- LORE_NOTES.md#northshire-valley (lore sheet; written in M3)

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
```

**Dialogue file** (`RPGDialogue_Elwynn/npcs/mcbride.lua`):

```lua
-- Marshal McBride, Northshire Abbey. Voice: bibles/mcbride.md
-- All IDs are placeholders until capture data exists. The validator lists every TODO.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key         = "mcbride",
  id          = TODO_NPC("Marshal McBride"),
  name        = "Marshal McBride",
  bible       = "bibles/mcbride.md",
  role        = "questgiver",
  tier        = "quest",
  communities = { "northshire" },
  temper      = { "steady" },
  notices     = { "greenness", "kit", "follow_through" },

  -- Compact mode: one short line in the bar, Blizzard's window opens underneath.
  greetings = {
    { id = "g_brief",   text = "Recruit. Make it quick." },
    { id = "g_reports", text = "If it's the mine, I've read the reports. If it isn't, speak up." },
    { id = "g_regular", text = "You again. Good. Means you're still alive.",
      when = { timesTalked = { min = 4 } } },
    { id = "g_dusk",    text = "Quietly. The brothers are at prayers.",
      when = { timeOfDay = "dusk" } },
    { id = "g_count",   text = "Count's not done, recruit.",
      when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } } },
  },

  -- Noticing moments: things only he would react to, in his way.
  notice = {
    { id = "n_kit_broken", cat = "kit", place = "before",
      when = { durability = { max = 0.25 } },
      text = "Before you say anything, get that armor to a smith. I don't send recruits out held together with string." },
    { id = "n_kit_naked", cat = "kit", place = "replace",
      when = { nearlyNaked = true },
      text = "Where is your armor, recruit? No. I don't want to know. Go and find some." },
    { id = "n_green_deaths", cat = "greenness", place = "after",
      when = { band = "Greenhorn", deaths = { min = 3 } },
      text = "You keep coming back down that hill in worse shape than you went up. They carry candles, recruit. Not swords." },
  },

  -- Live reactions while the window is open.
  react = {
    { id = "r_stealth", on = "stealth",
      text = "I can still hear you breathing, recruit. Stand where I can see you." },
    { id = "r_imp", on = "pet", when = { pet = { family = "Imp" } },
      text = "Keep that thing off my maps. The last one set fire to a requisition." },
  },

  start = "hello",

  nodes = {
    hello = {
      lines = {
        -- His own fallback. Scores 400, so it loses to anything more specific of his.
        { id = "h_default",
          text = "The garrison's spread thin, so I'll be brief. What do you need?" },
        -- Quest history: the turn-in that sends recruits to him.
        { id = "h_from_willem", key = true,
          when = { questRecent = { TODO_QUEST("A Threat Within"), days = 1 }, metBefore = false },
          text = "Willem sent you up, then. Stand where the light's on you. Let's see what I'm working with." },
        -- Return-visit memory.
        { id = "h_return",
          when = { metBefore = true, daysSince = { min = 7 } },
          text = "Thought we'd lost you to Goldshire. What brings you back up the hill?" },
        -- A race+class combination that's new in Forever.
        { id = "h_dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" },
          text = "A dwarf who talks to the weather. I've had stranger recruits this year. Not many." },
        -- Race alone. The Skyborne race token is confirmed by the probe.
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Skyborne. I'm told the Kirin Tor vouched for your people. Out here the kobolds will judge you on your own." },
        -- Level band.
        { id = "h_champion", when = { band = "Champion" },
          text = "You're a long way past kobolds. If you're visiting the Abbey, the brothers will be pleased. I'll be suspicious." },
        -- One quest across its phases.
        { id = "q_kobold_before",
          when = { questBefore = TODO_QUEST("Kobold Camp Cleanup"), band = "Greenhorn" },
          text = "There's a kobold camp in the woods north of here, and they're getting bold. I need it thinned." },
        { id = "q_kobold_progress",
          when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } },
          text = "That count isn't done. They multiply in those woods faster than I can find recruits." },
        { id = "q_kobold_ready", when = { questReady = TODO_QUEST("Kobold Camp Cleanup") },
          text = "That's the count? Good. Hand it in properly and I'll sign it off." },
        { id = "q_kobold_recent", tags = { "news" }, key = true,
          when = { questRecent = { TODO_QUEST("Kobold Camp Cleanup"), days = 2 } },
          text = "First quiet night the brothers have had in a week. They'll pray for you. I'll settle for you staying sharp." },
        { id = "q_echo_later",
          when = { questLater = { TODO_QUEST("Skirmish at Echo Ridge"), days = 5 } },
          text = "Echo Ridge has gone quiet. They always come back, mind. Fewer, since you went through." },
        -- An echo of something the player heard from another NPC (Marshal Dughan, Goldshire).
        { id = "e_dughan_thieves", tags = { "news" },
          when = { heardLine = "dughan.defias_common_thieves" },
          text = "Dughan told you they're common thieves? Common thieves don't drill. Someone is training them." },
      },
      choices = {
        { text = "Reporting for duty, Marshal.", next = "orders",
          fx = { align = { order = 2 }, trait = { stern = 1 }, affinity = 1 },
          journal = {
            first = "Reported to Marshal McBride. He looked at me like a man counting how many of us come back.",
            third = "{name} reported to Marshal McBride at Northshire Abbey.",
          } },
        { text = "Kobolds? You need soldiers for kobolds?", next = "kobolds",
          fx = { trait = { witty = 1 }, affinity = -1 } },
        { text = "I've run vermin off a farm before. These can't be worse.", next = "orders",
          when = { origin = "human_westfall_farmhand" },
          fx = { affinity = 1 } },
        { text = "What do you make of the Defias in the valley?", next = "defias",
          when = { band = { "Greenhorn", "Blooded" } } },
      },
    },

    kobolds = {
      lines = {
        { id = "k_default",
          text = "Laugh if you like. They've moved into Echo Ridge Mine, and they come out bolder every week. I'd rather laugh after." },
      },
      choices = {
        { text = "Fair enough. Point me at them.", next = "orders", fx = { affinity = 1 } },
        { text = "I'll see for myself.", next = "END" },
      },
    },

    orders = {
      lines = {
        { id = "o_default",
          text = "Good. I've more work than hands. Let's see what fits you." },
        { id = "o_kobolds", when = { questBefore = TODO_QUEST("Kobold Camp Cleanup") },
          text = "Kobold camp, north woods. Thin it out, then report to me. Not to the brothers." },
        { id = "o_done_here", when = { questDone = TODO_QUEST("Skirmish at Echo Ridge") },
          text = "Nothing left here that needs you. Marshal Dughan in Goldshire can use a recruit who finishes things." },
      },
      choices = {
        { text = "Show me the work.", next = "BUSINESS" },
        { text = "Understood.", next = "END" },
      },
    },

    defias = {
      big = true,
      lines = {
        { id = "d_default", key = true,
          text = "They're in the valley and they're organized. A thief with a cause is still a thief. Some of them were honest men, once." },
      },
      choices = {
        { text = "Then give them a chance to surrender first.", next = "END",
          fx = { align = { light = 3 }, trait = { kind = 1 }, opinion = { defias = "mercy" } },
          journal = {
            first = "Told McBride the Defias should get a chance to surrender. He didn't argue. He didn't agree either.",
            third = "{name} told McBride the Defias deserved a chance to surrender.",
          } },
        { text = "A thief's a thief. I'll treat them like one.", next = "END",
          fx = { align = { order = 3 }, trait = { stern = 1 }, opinion = { defias = "hardline" }, affinity = 1 },
          journal = {
            first = "McBride asked about the Defias. I told him a thief's a thief. He nodded like I'd passed something.",
            third = "{name} told McBride the Defias should be treated as thieves, nothing more.",
          } },
        { text = "Who's organizing them? That's who I'd want.", next = "END",
          fx = { align = { honor = -2 }, trait = { curious = 1 }, opinion = { defias = "follow_the_leaders" },
                 learn = { "defias" } },
          journal = {
            first = "Asked McBride who's behind the Defias. He didn't know. He didn't like not knowing.",
            third = "{name} asked Marshal McBride who leads the Defias. He had no answer.",
          } },
      },
    },
  },

  -- "Ask about…": his own takes. _none is his personal brush-off.
  topics = {
    kobolds = { { id = "t_kobolds",
      text = "Vermin with candles and shovels. Don't underestimate the shovels." } },
    defias  = { { id = "t_defias",
      text = "Organized, and closer to the Abbey than I like. Ask Willem. He's been counting bandanas." } },
    _none   = { { id = "t_none",
      text = "Not a garrison matter. Ask the brothers. They read." } },
  },
}
```

This one file exercises most of the vertical-slice checklist: race, class and combination lines, a level band, quest history, before/during/after/later reactions, return-visit memory, an echo of another NPC's line, noticing moments, live reactions, an alignment choice, an opinion for the gossip network, an origin-only choice that the conversation doesn't depend on, topic answers with a brush-off, and journal templates in both voices.

### 2.12 SavedVariables

```lua
RPGDialogueDB = {            -- account-wide
  schema = 1,
  settings = { … },          -- incl. pack toggles, other-addon mode, accessibility
  capture  = { npcs = {}, quests = {}, text = {} },
  flagged  = {},             -- "this line is wrong" reports
  debug    = {},             -- ring buffer, dev mode only
}

RPGDialogueCharDB = {        -- per character
  schema = 1,
  npc = { [npcKeyOrId] = { first, last, times, affinity, topics = {}, lastLine } },
  seen  = {},                -- rolling anti-repetition history (trimmed, fades)
  heard = {},                -- lasting record of key lines (small, never trimmed)
  quests = { turnedIn = { [questID] = time } },
  align = { light = 0, order = 0, honor = 0, taint = 0 },
  traits = {}, opinions = {}, flags = {}, claims = {}, deeds = {},
  threads = {}, towns = {}, origin = nil,
  topics = {}, books = {}, deaths = {}, homeInn = nil,
  journal = {}, insanity = {},
  pacing = {},               -- budget and cooldown timestamps
}
```

All times come from `GetServerTime()`. Every structure that grows has a cap: journal 2,000 entries (oldest are folded into a summary entry, never silently dropped), seen lines 1,500 (least recently used go first), death log 500. Migrations run in order (`migrations[2](db)`, `migrations[3](db)` …) from day one.

---

## 3. The engine and how it scores lines

### 3.1 One conversation, start to finish

1. **Trigger:** `GOSSIP_SHOW`, `QUEST_GREETING`, `QUEST_DETAIL`, or `PLAYER_INTERACTION_MANAGER_FRAME_SHOW` (merchant, trainer, flight master, banker, stable master, auction house), or the Talk keybind.
2. **Identify the NPC:** GUID → NPC ID → registered NPC. In dev mode only, a TODO name can match the NPC's name, with a warning. Otherwise the NPC's **role** is worked out for the pools: capture registry → tooltip subtitle (`<Flight Master>`) → interaction type → name pattern (`… Guard`).
3. **In combat?** Then compact mode, or nothing. Never the full window.
4. **Build `ctx`** (3.8).
5. **Choose full or compact** (3.6).
6. **Fill the slots:** opening line · noticing moment (maybe) · thread beat (maybe) · rumor (innkeepers). Each slot runs the selection pipeline separately, so a noticing moment never competes with a quest line.
7. **Render.** The player picks a choice → effects → next node.
8. **Write back:** memory, seen and heard lines, journal entry, pacing timestamps.

### 3.2 Selection pipeline (per slot)

```
gather    candidates: NPC's own file → thread beats for this NPC → community pool
          → role×city pool → role pool → generic
eligible  every condition passes            (failures recorded for /rpgd why)
fresh     drop lines seen inside their fade window (only if anything else is left)
pace      system budgets may veto           (recorded as HELD in /rpgd why)
score     source base + sum of condition weights + priority
pick      keep everything within 5 points of the best; weighted random by weight × freshness
```

### 3.3 Example weights

| Source | Base |
|---|---|
| NPC's own file (incl. their beats) | **400** |
| Community or town pool | 200 |
| Role pool for this city or faction | 120 |
| Role pool (anywhere) | 100 |
| Generic | 0 |

Plus the condition weights from 2.7: time-sensitive quest states and heard lines 60, race+class 50, long-tail quest states 40–45, origin 35, character 30, race or class 25, relationship 20, state/zone 15, level/band 10, gender/time 5.

The order comes out the way the brief asks. Within one NPC, a time-sensitive quest line (460) beats a race+class line (450), which beats race or class alone (425), then state or zone (415), then gender or time (405), then their plain line (400). Anything from the NPC's own file beats any pool line, however specific. That is deliberate: the named character always speaks for themselves.

**Tuning from the M3 simulation:** quest states that stay true for weeks ("before", "done", "later") originally weighed 60 too. They were eligible in almost every conversation, so McBride's race and class lines never fired once in 2,000 simulated characters. They now weigh 40–45: an active quest still outranks a race+class line, but a stale one doesn't.

**Worked example.** A level-2 human warrior meets McBride for the first time, just after turning in A Threat Within, at dusk (updated for the M3 weights):

```
/rpgd why
[RPGD] mcbride · node hello · slot line · seed 48121
ctx: Human WARRIOR 2 (Greenhorn) · dusk · Northshire Abbey
  WIN   480  h_from_willem     own 400 + questRecent 60 + metBefore 20
        455  q_kobold_before   own 400 + questBefore 45 + band 10
        400  h_default         own 400
  FAIL       h_dwarf_shaman    race: Human, wanted Dwarf
  FAIL       h_champion        band: Greenhorn, wanted Champion
  FAIL       e_dughan_thieves  heardLine dughan.defias_common_thieves: not heard
slot notice  (roll 0.21 ≤ 0.35, budget free)
  FAIL       n_kit_broken      durability: 1.00, wanted ≤ 0.25
  FAIL       n_kit_naked       nearlyNaked: false
  FAIL       n_green_deaths    deaths: 0, wanted ≥ 3
  → no noticing moment this time
```

`FAIL` means a condition didn't pass. `HELD` (not shown here) means the line was eligible but a pacing budget vetoed it, for example `HELD n_kit_broken  pacing: "kit" used 12 min ago (30 min)`.

### 3.4 "Everything matters sometimes"

- **Hinge limit.** A line should hinge on at most two facts about the player. Which NPC is speaking doesn't count. The validator warns at three hinges and errors at four. The simulation reports any offenders.
- **Default budgets** (tunable in one table in `Pacing.lua`):

| System | Budget |
|---|---|
| Noticing moments | chance 0.35 per conversation (slider); at most 1 per conversation (+1 live reaction); per category: 30 min across all NPCs and 3 days per NPC; `once` unless marked repeatable |
| Thread beats | at most 1 per conversation; beats of the same thread at least 3 conversations and 20 min apart |
| Alignment lines | only in `big` nodes, or 1 in 5 conversations |
| Fel Taint | at most 1 per 2 days, chance 0.25 |
| Origin | 1 in 4 conversations |
| Traits | 1 in 3 conversations |
| Opinions (gossip echoes) | 1 in 4 conversations, after a delay of 10 min or more |
| Books | 1 per day |
| Rumors | 1 per inn visit, rotating |

Town standing has no budget in its own town, because the whole town has to be consistent.

### 3.5 Anti-repetition

Each character keeps `seen[globalLineId] = { t, n }`. A line seen inside its fade window is excluded from the top band. Default windows: 1 day for greetings, 3 days for node lines, never for `once`. After the window, its weight recovers gradually: `weight × min(1, age / (2 × window))`. If every candidate has been seen, the oldest-seen wins, so an NPC is never silent.

### 3.6 Full conversation or compact

**Default since the first in-game test (schema 2): the full box opens every time** you interact with an NPC who has dialogue (named, or covered by a role pool), in front of the game's window, and lists the game's own options after the NPC's replies: their quests (hand-ins first, then new quests, then ones in progress) and gossip options (vendor, training, flights, "make this inn your home"...), up to five, then "Get on with it". Picking a game option hands over to the game's window and selects it there (`C_GossipInfo.SelectAvailableQuest` / `SelectActiveQuest` / `SelectOption`, or the quest window's greeting-page equivalents); the visit carries on in the game's window without the box reappearing. Keys 1–9 and 0.

The setting "When you talk to someone" keeps the older behavior as options. With "short line", the **full** window opens when any of these is true, and otherwise a compact bar shows the best greeting:
- it's the first meeting;
- Talk was pressed;
- an eligible, unseen line tagged `news` scores **≥ 440** and isn't held for pacing. Beats, quest reactions, echoes and new topic answers count;
- for a story NPC (`major`/`quest` tier), a noticing moment is due.

"Straight to business" shows nothing unless one of those is true.

**Right-click talk.** NPCs with no gossip menu fire no event when right-clicked, so `Compat.HookWorldClicks` hooks `WorldFrame` OnMouseDown/OnMouseUp (hooks only). A right-button press on a friendly NPC under the cursor, released within 0.4 s (longer is the camera turning), is a click. After 0.5 s, if the game opened no window of its own, the NPC is the target, in reach, not known from capture to have a menu (`gossip` / `interacts`), and we have content for them, the box opens as a "talk" conversation. If the game's window arrives late, `Conv.Start` upgrades the talk session in place: it fades the window and adds its options.

**Safety net.** Every conversation entry point runs inside `ns.Guard`: an error is printed once in chat (with Lua errors hidden, the game shows nothing), logged in account data, and the game's window is un-faded and uncovered at once.

### 3.7 Seeded randomness

The RNG is a Park–Miller generator in plain Lua 5.1 arithmetic. It needs no `bit` library, so the same code runs in the game, in the tests and in the simulation. The seed is derived per conversation from (NPC key, day, conversation count). `/rpgd why` prints the seed, and `/rpgd seed <n>` replays a conversation exactly. The tests and the simulation set explicit seeds.

### 3.8 The context snapshot

`ctx` is created once per conversation with lazy fields: the first time a field is read, it's computed through `Compat` and cached. Cheap things cost nothing until a condition needs them, and the snapshot stays consistent for the whole conversation. A spoof overlay sits on top (`/rpgd spoof race=Gnome class=PRIEST level=8 form=bear`). Live reactions update individual fields when events fire.

```lua
ctx.player.race    -- "Human" (file token from UnitRace)
ctx.player.band    -- "Greenhorn" | "Blooded" | "Seasoned" | "Veteran" | "Champion"
ctx.npc.key        -- "mcbride"
ctx.rel.power      -- "far_below" | "below" | "even" | "above" | "far_above"
                   --   level difference ≤-10, -9..-4, -3..3, 4..9, ≥10; elite NPCs shift one step
ctx.world.tod      -- "dawn" 5–7 | "day" 8–17 | "dusk" 18–20 | "night" 21–4 (server time)
ctx.state.form     -- "bear" | "cat" | "travel" | "aquatic" | "moonkin" | "ghostwolf" | nil
ctx.hist:quest(id) -- "before" | "active" | "ready" | "done", plus turn-in time from our own log
```

### 3.9 Alignment math (M4, recorded now so content can rely on it)

A shift of `d` on an axis whose current value is `v` applies `d × (1 − |v|/120)` when it pushes further the same way, and the full `d` when it pulls back toward zero. `big` nodes multiply by 2.5. Values beyond ±20 drift 1 point toward zero per 7 days without reinforcement. Fel Taint decays 1 point per 10 days. Titles are regions of the three-axis space, with Alliance and Horde wording.

---

## 4. What I need from you

**A. Section 9 of the brief (it's still in brackets):**
1. Your interface number (the probe below prints it).
2. Your test character(s): race / class / faction / level.
3. Error-catching addons (BugSack + !BugGrabber?).
4. Where we're working (see C).
5. Python installed? (Optional: I can run all the tooling in my workspace, see section 6.)
6. Other addons you use, especially Questie, Immersion, DialogueUI and Total RP 3, and whether they exist for Forever yet.
7. Final addon name and license (e.g. "RPG Dialogue", MIT).
8. Extra Forever lore notes beyond section 10, if any.
9. Visual style (the brief's example: "parchment and dark wood, very readable, uncluttered"). If you don't mind, I'll use that.

**B. The vertical-slice zone** (section 7 of the brief). Northshire Valley + Goldshire is the natural fit for the example above. If your test character is a Skyborne, Zephras Isle may suit you better, but section 10 leaves it thin on lore.

**C. Where the code lives between sessions.** This session runs in a cloud workspace that I can't reach from future sessions, and I can't see your AddOns folder. Pick one:
- **GitHub** (recommended): a private repo I push to at every milestone. You `git pull`, and `tools/link_addons` points WoW at it. If the repo is ever made public, the captured Blizzard text in `reference/` must stay out of it.
- **Link this chat to your computer** through the Claude desktop app, so I can write straight into a folder there.
- **Zips:** I hand you the repo (with its git history) at the end of each milestone.

Either way, I'll also save `DESIGN.md` and `HANDOFF.md` to this Project so the next session can find them.

**D. The name and email to use for git commits.** I used a neutral placeholder for M0. A GitHub "noreply" address is a good choice if the repo might go public.

**E. Run the API probe and paste back everything it prints.** Paste these into chat one line at a time. Each is under the 255-character limit. The client may first ask you to allow scripts; say yes. For P6, **target a friendly NPC that has a title, such as a vendor or flight master, and stand next to it.**

```
P1  /run print(GetBuildInfo()) print("proj",WOW_PROJECT_ID) print("race",UnitRace("player")) print("class",UnitClass("player"))
P2  /run for _,n in ipairs{"C_GossipInfo","C_QuestLog","C_UnitAuras","AuraUtil","C_Calendar","C_VoiceChat","Settings","C_AddOns","AddonCompartmentFrame","C_TooltipInfo","C_DeathRecap","C_GameRules","issecretvalue"} do print(n,_G[n]~=nil) end
P3  /run for _,n in ipairs{"IsQuestFlaggedCompleted","UnitBuff","GetShapeshiftFormID","InterfaceOptions_AddCategory","GetQuestLogLeaderBoard","CheckInteractDistance","LoadAddOn","GetBindLocation","GetServerTime"} do print(n,_G[n]~=nil) end
P4  /run local q,a,v,g=C_QuestLog,C_UnitAuras,C_VoiceChat,C_GossipInfo print("QFC",q and q.IsQuestFlaggedCompleted~=nil,"Obj",q and q.GetQuestObjectives~=nil,"Aura",a and a.GetAuraDataByIndex~=nil,"TTS",v and v.SpeakText~=nil,"GTxt",g and g.GetText~=nil)
P5  /run local f=CreateFrame("Frame") print("CLEU",pcall(f.RegisterEvent,f,"COMBAT_LOG_EVENT_UNFILTERED")) print("PIM",pcall(f.RegisterEvent,f,"PLAYER_INTERACTION_MANAGER_FRAME_SHOW"))
P6  /run print(UnitGUID("target"),UnitName("target"),CheckInteractDistance and CheckInteractDistance("target",3)) local d=C_TooltipInfo and C_TooltipInfo.GetUnit("target") if d then for i,l in ipairs(d.lines) do print(i,l.leftText) end end
```

If a line throws an error, paste the error instead. That tells us something too.

**F. Your OK, or your changes, on the decisions in section 6.**

**Later, not now:** once M1 ships the capture tool, walk the slice zone with auto-capture on, talk to every NPC there and send me your `RPGDialogue.lua` SavedVariables file. That is how real IDs and reference text get in.

---

## 5. Risks and API unknowns

| # | Risk or unknown | Impact | Plan / nearest alternative | Resolved by |
|---|---|---|---|---|
| R1 | Which API family Forever really exposes | Wrong calls fail at load | Modern-first `Compat` with legacy fallbacks; missing APIs logged in dev mode | Probe P2–P5, then M1 dev log |
| R2 | Secret values in combat | In-combat reads can't be branched on | Never read state in combat. `ctx` is built out of combat; combat → compact or nothing; live reactions ignore events during combat | Built in M1–M2 |
| R3 | Combat log closed to addons | Spirit healers can't know exactly what killed you | Fallback chain: death recap API if readable after death → breath/fatigue timers (drowning, fatigue) → snapshot of target and its target at death (name, level, elite, player, guard) → "unknown". When the cause is unknown, spirit healers speak in general terms | Probe P2/P5; M6 |
| R4 | Taint from interfering with Blizzard's gossip/quest windows | "Action blocked" errors, broken quest addons | Never hide, close or unregister Blizzard frames. Ours overlays theirs, which stays open underneath (faded while ours is up). "Get on with it" just closes ours. Verified with `/console taintLog 1` | M2 test checklist |
| R5 | Keys 1–4/Space/Esc while our window is open | Could swallow action-bar keys | `OnKeyDown` + `SetPropagateKeyboardInput`, which is restricted in combat on modern clients. So we close the window on `PLAYER_REGEN_DISABLED` (hiding our own frame is always allowed), which releases the keys. No override bindings, since those can't be cleared in combat | M2 |
| R6 | Immersion / DialogueUI | Two windows fighting | DialogueUI (0.10.2): works together, see §8. Immersion: RPG Dialogue steps back (Talk keybind + compact bar only) | Your addon list; M2 |
| R7 | IDs differ from vanilla or are unknown (NPCs, quests, uiMapIDs, Skyborne race token, Walk on Air, Camping buff, Galestrider) | Wrong or missing content triggers | TODO placeholders + capture tools + registry; dev-mode name matching to test before IDs exist | Capture after M1 |
| R8 | Load-on-demand packs can't be unloaded | Memory grows with zones visited in a session | Lean zone packs (target ≤ ~300 KB Lua memory each, measured); `/rpgd mem` reports per pack with `UpdateAddOnMemoryUsage` every milestone | Measured from M3 |
| R9 | Range check for "Talk to Target" | `CheckInteractDistance` may be restricted | Fallbacks: tooltip/interaction APIs; worst case, Talk to Target works only on NPCs you can interact with | Probe P6 |
| R10 | Proximity barks: no API lists nearby NPCs | Barks can only come from units the client exposes | Use nameplates (if friendly NPC nameplates are on and readable), target and mouseover; heavily rate-limited | M6 |
| R11 | Holidays: Forever may have its own holiday set | Wrong holiday lines | `C_Calendar` if usable, else a built-in date table you can correct | Probe P2; M4 |
| R12 | Hardcore flag (`C_GameRules`?) and Legacy talents | No way to detect them yet | Field exists in `ctx`, always false until an API appears | Later update |
| R13 | Midnight treats chat as secret inside instances | Drunk detection (system messages) fails in dungeons | Drunk state only tracked outside instances | M1 |
| R14 | GUID format changes (spawn obfuscation) | NPC ID parse breaks | Parse by field position, check it's numeric, fall back to name + zone | Probe P6 |
| R15 | Python parser and real Lua disagree | Validator passes a file the game rejects | The Lua test harness also loads every pack against the mock, and `luac -p` runs on every file | M2 |
| R16 | Content scale vs consistency | Generic or samey writing at hundreds of NPCs | Bibles first, AI-voice checker, sameness checks, simulation, the "this line is wrong" button | M3 onward |
| R17 | Blizzard UI add-on policy | Release blocked | **Checked November 2026** against the posted policy (free; code visible; no harm to realms or players; no ads; no in-game donation requests; T-rated content; ToU/EULA). We comply, and `check_all.py --release` fails on chat or addon-message sending, dynamic code, or donation/ad text in shipped files | Done (M8) |
| R18 | One public global for packs | Constraint 7 lists no exception for it | `RPGDialogueAPI` is the only extra global (section 6) | Your OK |
| R19 | Gamepad API in Forever (`Frame:EnableGamePadButton`, `OnGamePadButtonDown`, `C_GamePad.IsEnabled`) | Gamepad controls do nothing | All calls are guarded in Compat; keyboard and mouse always work; choice buttons are ordinary buttons a cursor addon such as ConsolePort can reach | In-game test |
| R20 | Total RP 3's public player API on Forever (`AddOn_TotalRP3.Player.GetCurrentUser` and its name methods) | Roleplay name not used | Read-only, every call in pcall, older profile fields as fallback, the character name otherwise | In-game test with Total RP 3 |
| R21 | Tooltip post-call API (`TooltipDataProcessor`) for the optional "something new" marker | Marker never shows | Falls back to `OnTooltipSetUnit`; off by default | In-game test |

---

## 6. Decisions you can veto

1. **One public global, `RPGDialogueAPI`.** Content packs are separate addons and can't see our private namespace. This is the only global beyond the SavedVariables (`RPGDialogueDB`, `RPGDialogueCharDB`), the slash commands (`/rpgd`, `/rpgdialogue`) and the keybinding names.
2. **No third-party libraries.** Export/import uses a small serializer and text encoding of our own, and the launcher is our own (addon compartment if available, minimap button otherwise). The one bundled third-party file is the readable font (Atkinson Hyperlegible, SIL Open Font License 1.1, licence file next to it).
3. **One TOC per addon** with your interface number. We add `_Forever.toc` variants only if a mixed setup needs them.
4. **Our window overlays Blizzard's** (R4) rather than replacing it. It lists the NPC's quests and gossip options itself and passes the pick to the game, the way Immersion and DialogueUI do.
5. **With Immersion present, RPG Dialogue steps back** by default (R6). **With DialogueUI, it talks first and hands over** (0.10.2, §8; the user asked for it).
6. **Tests, linting and the simulation run in my workspace.** Lua 5.1, luacheck and Python are installed there. You only do the in-game testing. If you also want to run them yourself, you'll need Lua 5.1 or LuaJIT.
7. **Name matching for TODO IDs** (always on, not only in dev mode), so the vertical slice is testable before capture data exists. The validator flags every TODO, and `--strict` makes them errors once capture data exists.
8. **Alignment is stored as `light` / `order` / `honor`**, positive meaning Light / Order / Honor.

---

## 7. Milestone status

| Milestone | What it holds | Commit |
|---|---|---|
| M0 | this document, repo, hand-off notes | ab8479c |
| M1 | skeleton: TOC, Compat, SavedData, Trackers, Context + spoof, capture, slash tools | ca4b8df |
| M2 | engine, pack API, dialogue UI, compact mode, other-addon handling, memory, validator, tests, flag button, live reactions | 970a05e |
| M3 | Northshire/Goldshire slice, lore sheet, voice bibles, content guide, voice checker, simulation, coverage | d49bd0a |
| M4 | alignment, traits, opinions, gossip, claims and lies, town standing, agendas, throughlines, Ask about, special options, rumors | e36aef0 |
| M5 | journal, origins (drafts for approval), export/import, save-data checks | f1ec319 |
| M6 | spirit healers, books, insanity, drunk replies, ghosts, barks, errands | 979fcc5 |
| M7 | zone planning and scaffolding, one-command checks, simulation and voice-check additions | bbefce7 |
| M8 | Total RP 3, accessibility pass (keyboard, gamepad, readable font, no color-only signals), tooltip marker, `PACK_AUTHORING.md`, packaging and policy checks, release workflow | c2e6a2e |

### 3.11 "Ask about..." (Morrowind-style, 0.27.0)

- **Hearing topics.** Every line the NPC says in the box (main line, noticing moment, rumor, an answer) goes through `Topics.Hear`: topic words in it are learned, and linked. The words are each topic's `keywords` plus its name without a leading "The " or anything after a comma or bracket (`linkName = false` turns the name off, for ordinary phrases like "The Collector"). Whole words only, a plural "s" and a possessive count, longest match first, one link per topic per line, never inside an existing colour code or link, never a topic linking to itself in its own answer.
- **Links.** `|Hrpgdtopic:<id>|h<colour>word|r|h` on the box's own frame (`C.EnableHyperlinks`: `SetHyperlinksEnabled` plus `OnHyperlinkClick`/`Enter`/`Leave`, guarded). The typewriter types the plain text and swaps in the linked text when it finishes, so no half-typed codes show; the click-to-finish cover hides then, so the words can be clicked. Click: `Conversation.Ask(id)`; hover: "Ask about <topic>". Setting `topicLinks` (default on) turns the links off; topics are still learned. Colour `topic` in every palette; the "Ask about..." list carries every topic too, so nothing depends on colour. Inside DialogueUI the text stays plain.
- **Ask anyone.** Topics with `standard = true` (Their story, Their work, A little advice, Latest rumors: `RPGDialogue_World/topics.lua`) are always known, listed first, never archived or linked. `Engine.PickTopic` skips brush-offs for them. A named NPC's story is their own take or a generic deflection, never a role's. Their work and advice fall back to the role. Latest rumors: the NPC's own, then any rumor set tied to their zone or town whatever their role (`Rumors.SetsFor(info, ctx, true)`), then role and generic.
- **Question-only pools.** `askOnly = true` pools (`RPGDialogue_World/asks.lua`) answer topics and nothing else: `Data.PoolsFor(info, ctx)` leaves them out, `Data.PoolsFor(info, ctx, true)` (topics only) includes them, so they never make an unnamed NPC talk.
- **Answers that lead somewhere.** A topic line with `next = "<node>"` shows the answer, then that node's replies (the node counts as visited; BACK returns to the hub). The validator checks the node exists.
- **The list.** Grouped by category under headers ("Ask anyone" first, then categories in order of their newest topic), flat while searching; a topic already asked of this NPC (`mem.topics`) says "(asked)"; keys and the gamepad skip headers.

- **What do you know? (0.34.0).** Standard topic `knows` (order 0, first in the list). `Conv.AskKnows`: the NPC's lead-in (`topics.knows` lines: own, then pools, then generic; written to come before a list, naming no topic), then up to `Conv.KNOWS_MAX` (10) topic names as links, one per line, not yet asked first. `Engine.TopicsKnownBy(info, ctx, env)`: topics whose own answers, or role/community pool answers, have a line whose conditions pass now (never `_none`, never generic, never standard). Every listed topic is learned and remembered in `mem.knows`; the Ask list puts them under "What they can tell you about", right after "Ask anyone". Nothing known: the NPC's brush-off.
- **Nothing to say.** An answer that came from a brush-off records `mem.nothing[id]`; the list says "(nothing to say)" instead of "(asked)". Row tooltips: who you first heard it from (`Topics.Source`), and what this person made of it.
- **The button** reads "Ask about... (N)" (topics learned, not archived).
- **Inside DialogueUI** the Ask list is paged (7 topics a page, More / Previous / Back), ordered ask-anyone, what they know, the rest; an answer keeps the list open.

### 3.12 Disposition, identity tags, approval and checks (0.34.0)
- **Disposition** (`Systems/Disposition.lua`, Morrowind-style): 0-100, from 50: affinity x4, town standing / 5 (+-15), the NPC's `values` against the player's dominant traits (+8 each; -8 for the opposite trait, `Disposition.OPPOSITE`), temper (warm/jovial/gentle +5, gruff/cold -5), alignment the NPC values (lawful/dutiful-Order, devout/pious-Light, honest-Honor; +-5 beyond +-20), unfriendly unit reaction -10. Tiers: Hostile <20, Cold <35, Wary <45, Neutral <60, Warm <75, Friendly <90, Devoted. Shown on the box's bottom bar ("Disposition: Warm"), reasons and numbers on hover; the journal's People page uses its word. Condition `disposition {min,max}` (20, hinge). Persuade with no `pass` of its own also passes at disposition >= 65 (`Disposition.PERSUADE`). Spoofable (`ctx.spoofed.disposition`). Addon-only: it changes no game behaviour.
- **Identity tags.** A reply with no `tag` whose `when` names who the player is (top level or inside `all`; never `any`/`not`) shows it: `[Priest]`, `[Human Priest]`, `[Dwarf]`, the origin's `tag`/name, `[Alchemy]`, `[Kind]` (`Conv.IdentityTag`). Setting `identityTags`; the `tags = "never"` setting turns them off too.
- **Approval and check results.** After a reply, a dim note under the next page: "<NPC> approves." / "approves greatly." (affinity +1 / +2 or more), "disapproves", the new disposition tier when it changed, and "Persuade: success." / "failed." for checks (`Conv.ChoiceNote`, shown by `Conv.ShowPendingNote` via `ShowReaction`). Settings `approval`, `checkResults`, `showDisposition`.

### 3.13 The journal and the self-writing diary (0.35.0)
- **Pages** (`UI/Journal.lua`, `J.Text(tab, search)` is pure and tested): Diary (`chronicle`), Stories (`stories`), People (`people`), Heard of (`heard`), Myself (`sheet`), Notes. Search on Diary, People and Heard of. Old names alias: `topics` -> Heard of, `deeds` -> Myself, `threads` -> Stories.
- **Stories:** every thread with a beat heard, live ones first. Thread fields `title` and `story = { stirring|unfolding|resolved|soured = { first, third } }`; a faded thread shows its last live text, marked "(left unfinished)". Under it, each beat heard: who said it, when, the line.
- **People:** grouped by the zone where you last spoke with them (`mem.zone`, set on `CONVERSATION_ENDED`), with title, disposition word, the impression (once written), topics asked of them, the last thing they said.
- **Heard of:** topics by category; who first spoke of it (`Topics.Source`) and what each person answered when asked (`Topics.RecordAnswer`: `rec.said`, one per person, up to 8, stored as line ids).
- **The diary writes itself** (`Systems/Diary.lua`): an NPC's `impression = { first, third }` after the first conversation with them (`mem.impressed`; people met before 0.35.0 get it at the next talk); a zone's `P:Arrival { zone, first, third, when? }` (World `arrivals.lua`, first match wins, `char.arrived`) on the first `zone:` deed; built-in lines for the first death (names the killer), each tenth level, a first dungeon.
- **Journal button count:** unread diary entries (`char.journalRead`, `J.Unread`, `Launcher.UpdateBadge`); opening the journal marks them read. Characters from before 0.35.0 start with everything read.

### 3.10 Window style (look)

Two looks, setting "Window style" (`look`), switchable while a conversation is open:

- **"game" (default since 0.10.0).** The conversation box is built like the game's own gossip window, from the client's art at runtime, so it matches the player's quest windows whatever they look like. Sources: Blizzard's 12.1.5 interface code (the `Gethe/wow-ui-source` mirror, build 70783): `GossipFrame.xml` (a `ButtonFrameTemplate`, 338 wide; parchment background; `GossipTitleButtonTemplate` rows with a 16-pixel icon, `QuestFontLeft` text and the `Interface\QuestFrame\UI-QuestTitleHighlight` bar; a 78×22 `UIPanelButtonTemplate` "Goodbye" at the bottom right), `SharedUIPanelTemplates.xml` (`PortraitFrameBaseTemplate`: 62-pixel round portrait at −5,7 with `TempPortraitAlphaMask`, title at y −5 between x 58 and −24, rock background from y −21, `_UI-Frame-TopTileStreaks`, inset from y −60; `UIPanelButtonTemplate` = `Interface\Buttons\UI-Panel-Button-Up/Down/Highlight` with fixed texture coordinates; close button atlases `RedButton-Exit` / `RedButton-exit-pressed` / `RedButton-Highlight`), `NineSliceLayouts.lua` (`PortraitFrameTemplate`, `InsetFrameTemplate`, `SimplePanelTemplate`), `QuestTextContrast.lua` (`QuestBG-Parchment` and its accessibility variants, following the `questTextContrast` CVar), `QuestUtils.lua` (quest icons: `Interface/GossipFrame/AvailableQuestIcon`, `ActiveQuestIcon`, atlas `SideInProgressquesticon`, and the game's own helper for campaign, daily and other kinds), `MaterialColors.lua` (`GetMaterialTextColors`), `UIPanelLayoutFrame.lua` (left panels open at 16, −116).
  - We don't inherit Blizzard's frame templates (their scripts and close buttons would act on our frames). We apply the same border layouts with `NineSliceUtil.ApplyLayoutByName` onto our own frames and draw the same textures ourselves. The inset is a child frame drawn at its parent's level (`SetUsingParentLevel`), so our text stays above it.
  - Box (0.10.2: the gossip window's measurements, after the user compared the two side by side: "the text is too big, it doesn't have open space"): 338 × 496 (taller only when the conversation needs it), text at 18, −75 and 270 wide in the quest font's size (13 at the default text-size setting of 14; the wood look keeps 14), a 15-pixel space, rows 300 wide from x 8 with the icon at 3 and the text at 20; NPC name in the title bar (the names font, "the window's own" = Friz Quadrata, gold, shadow); subtitle in the header beside the portrait; text and replies in the parchment inset; replies get the gossip speech bubble (`Interface\GossipFrame\GossipGossipIcon`), game options their own icons, "Get on with it" the bullet; "Ask about..." is a red button on the bottom bar. Opens at the game's left-panel position, or over the game's window.
  - Ask list, journal and export window (0.10.1): the same frame without the portrait (`ButtonFrameTemplateNoPortrait`): title in the title bar, the game's close button, search boxes and tabs on the rock header, pages on parchment in an inset, buttons on the bottom bar. The Ask list matches the box's height and shows as many topics as fit. The short-line bar: the plain metal panel border (`SimplePanelTemplate`) around parchment.
  - The parchment keeps its proportions (`Theme.FitPaper`): drawn from its top-left corner at its own size, or scaled up just enough to cover, and cut off by the inset, using the atlas's texture coordinates from `C_Texture.GetAtlasInfo`. Text keeps 22 pixels from the right edge, which is ragged.
  - Ink: the game's parchment text colors; with the game's darkest contrast setting or our high-contrast option, the dark background and light text.
  - **Fallback.** `Compat.GameArtAvailable` checks NineSliceUtil, the three layouts and two key atlases at first use. If anything is missing, or applying a border errors, every window uses "wood" (and settings say why).
- **"wood".** RPG Dialogue's parchment and dark wood from solid color textures (the 0.9.0 look), 600 wide with the portrait beside the text.

---

## 8. Accessibility and other addons

**Accessibility (brief 4.15).** Text size separate from UI scale, line spacing, a choice of fonts for text and names with a bundled high-readability one (non-Latin clients keep the game's fonts), the game's own window style following its Quest Text Contrast setting, text speed, instant text, auto-advance with a delay, scale, a high-contrast theme, sounds on/off, and one reduce-motion switch that turns off the typewriter and every insanity effect. Full keyboard use: number keys, Up/Down/Tab to move a selection, Enter, Space, Escape; Left/Right in the journal; an Ask About keybinding. Gamepad in the client's gamepad mode: D-pad, A, B, X. Nothing relies on color alone: selections carry a ">" marker, locked replies say "(Locked)", the current journal tab is marked, standing tiers and alignment hints are words.

**DialogueUI (0.10.2).** Studied from its public source (github.com/Peterodox/YUI-Dialogue, version 1.0.7; it lists interface 16001, so it runs on Forever). It has no API for adding dialogue (its public `DialogueUIAPI` offers a quest translator, voice-over and item evaluators), so we coordinate windows instead of reaching into it:
- Its window is the global `DUIQuestFrame` (DIALOG strata). Hiding it ends the NPC interaction (`OnHide` → `CloseGossipInteraction`), so we never hide it: we hold its alpha at 0 (`Compat.PinHidden`, a `hooksecurefunc` post-hook on that frame's `SetAlpha`, because its intro animation sets the alpha every frame for a moment) and cover it with our mouse blocker, one strata higher (FULLSCREEN). It shows a moment after the game's event, usually after our box, so a hook on its `OnShow` takes it under the box then (`Conv.OnOtherWindowShown`). `Compat.FRAME_NAMES` counts it as the gossip and quest window, so handing over, recovering and noticing the end of the visit work as with the game's own windows.
- Its key listener sits at TOOLTIP strata. The box's keys and gamepad buttons now go to a listener at TOOLTIP strata, level 9000, so ours come first; while the box is over its window, number keys, Space, Enter, Escape and the arrows stay with us even when they do nothing here.
- Its "hide the game UI" option fades UIParent to nothing. With DialogueUI loaded our windows have no parent (scale set to UIParent's times ours) and sit at FULLSCREEN_DIALOG.
- Setting `otherAddons`: "auto" (default; DialogueUI → together, Immersion → step back), "takeover", "stepback", "off". Schema 5 moved the old "stepback" default to "auto".

**Inside DialogueUI (0.11.0, the default with it: `otherAddons = "auto"`).** The user asked for "the UI to entirely be DialogueUI". `Integrations/DialogueUIView.lua` draws conversations in DUIQuestFrame: it wraps the window's handlers (HandleGossip, HandleQuestGreeting, HandleQuestDetail/Progress/Complete, instance fields copied in by its mixin) so that, while a page is set, the page is laid out from the window's own pooled parts exactly as HandleGossip does (ReleaseAllObjects, UseQuestLayout(false), FormatParagraph, AcquireOptionButton + SetGossip with the speech-bubble icon 132053 and our own `onClickFunc`, AcquireExitButton + SetButtonExitGossip, SetScrollRange, FadeInContentFrame); number keys through its key listener's SetIndexedAction (found among the window's children). It is the same interface as the box (Show, SetChoices, ShowAnswer, ShowReaction, Hide, IsShown), chosen per conversation by `Conv.View(s)`. Game options and Get on with it release the page and DialogueUI's own pages carry on. Fallbacks to the box: methods missing (checked with rawget, since the mixin copies them onto the window), a layout error (`V.Broke`), or its window not showing within a second.

**The game's pages in the box (0.11.0).** `Conv.ShowGamePage`: after a game option or quest is picked in the box (`s.following`), the next GOSSIP_SHOW / QUEST_* for the same visit renders the page in the box: gossip text and options; quest offer (text, objectives, rewards via `GetQuestItemInfo`, money, XP; Accept = `AcceptQuest` or `AcknowledgeAutoAcceptQuest`, Decline = `CloseQuest`); progress (required items; Continue = `CompleteQuest`, locked until `IsQuestCompletable`); reward (choices as rows with tooltips via `GameTooltip:SetQuestItem`; picking one only marks it, "(chosen)" with a check, and the "Complete quest, taking X" row below stays locked until a choice is made, then calls `GetQuestReward(i)`; a single choice is listed in the text and taken by "Complete quest"). Turn-in polish (0.29.1): item names in their quality color (`Theme.QualityHex`, deeper shades on parchment, common items in ink), "(you can't use this)" in words, required items as have/need (`GetQuestItemLink` + `GetItemCount`, capped at the need, green/red via `Theme.StatusHex`), a locked Continue that says "not finished yet", and the game's quest-complete sound on hand-in. PvP quests and paid hand-ins go to the game's window (its confirmation popups). Service windows end the box (`Conv.HandOver`). The window under the box is re-adopted on every page, and the previous one's alpha restored. Setting `pagesInBox` (on).

**No game menu in between (0.24.0).** The user: "make sure there aren't options that bring up the normal menu as much as possible... constantly switching between default and ours is jarring." With `pagesInBox` on (the default), the game's gossip and quest windows never come back on their own:
- **"Get on with it"** (`Conv.Business(hint)`) no longer reveals the game's window. On a gossip page it picks the NPC's service straight away when there's one to pick (`Conv.ServiceOption`: the option the reply's words ask for, else the one the NPC's role implies, else the only option when there's nothing else), so the vendor, trainer, flight map or bank opens without the menu first; otherwise it shows the NPC's menu (quests and every option, uncapped) in the box; with nothing on the menu, the visit ends. On a quest window it shows the quest page in the box.
- **Replies marked `BUSINESS`** do the same, using their own words as the hint ("Show me your wares." → vendor; "A room, please." → the inn).
- **On the game's pages** the last row reads "Goodbye." and ends the visit.
- **Close, Escape and the gamepad's B** end the visit (`Conv.Close`) as they would in the game, instead of handing over.
- **NPCs with no lines** (no named file, no pool) and quest boards: their menu still shows in the box (`Conv.StartMenuOnly`, `s.menuOnly`): text, quests and options, then the next pages; nothing is remembered, no reactions run.
- A service option is recognized by the gossip window's icons (`C.GossipServiceIcons`, file IDs from `GetFileIDFromPath`), the legacy option type, or its words.
- **The game's window still comes back:** inside DialogueUI (its own window is the UI), in combat, for PvP quests and paid hand-ins (their confirmation), for the service windows themselves (merchant, trainer, taxi map, bank, stable, auction house: rebuilding those is out of scope), with `pagesInBox` off, and when the "skip" setting is chosen.

**Total RP 3 (brief 4.14).** `Integrations/TotalRP3.lua`, through `Compat.RoleplayProfile`: reads the current profile's first name and title through Total RP 3's public player object, strips color codes and textures, caps the length, and never writes. Two settings (name, title), both on; without Total RP 3 nothing changes.

**"Something new to say" marker (brief 4.10).** Off by default. A tooltip line on NPCs you've met who have an unheard news line or thread beat, computed read-only (no memory, pacing or seen-state changes) and cached per NPC for 15 seconds.
