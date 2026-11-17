# CurseForge kit

Everything for the RPG Dialogue project page. This folder never ships in the addon (`.pkgmeta` ignores it).

| File | Use |
|---|---|
| `avatar-400.png` | Project logo (CurseForge wants a square image, 400×400 or larger) |
| `emblem-512.png`, `emblem.svg` | Larger logo, editable source |
| `banner.png` | Header image for the description (1280×400) |
| `description.md` | Paste into the project description (Markdown) |
| `../RPGDialogue/Media/Logo.tga` | In-game copy of the emblem (64×64) |

## 1. Create the project

Go to https://authors.curseforge.com, then **Create Project**, game **World of Warcraft**, class **Addons**.

| Field | Value |
|---|---|
| Name | `RPG Dialogue` |
| Summary | `Branching, reactive CRPG-style conversations with the people of Azeroth. They remember you.` |
| Primary category | Roleplay |
| Other categories | Quests & Leveling |
| License | MIT License |
| Source | GitHub: `https://github.com/Kaiybo/rpg-dialogue` |
| Logo | `avatar-400.png` |
| Description | `description.md` (switch the editor to Markdown) |

Submit it. CurseForge moderates new projects, which usually takes a day or two.

## 2. Finish the description

On the project's **Images** tab, upload `banner.png` and a few in-game screenshots (a conversation box, the journal, DialogueUI mode, the settings). Copy the banner's image URL into the first line of the description, where it says `BANNER_IMAGE_URL`.

## 3. Upload the first file

Either:

- **By hand (works now):** `python3 tools/build_zip.py`, then upload `tools/out/RPGDialogue-<version>.zip` on the **Files** tab. Pick the **Forever** game version, release type **Beta**, and paste that version's section of `CHANGELOG.md` as the changelog.
- **Automatically, from a git tag:** see step 4.

## 4. Automatic uploads

`.github/workflows/release.yml` runs the BigWigs packager, which builds the zip and uploads it to CurseForge with `CHANGELOG.md` as the changelog:

- **Every push to `claude/import`** (merging a PR counts) uploads an **alpha**. Only players who opted into alphas get it. Pushes that only touch docs, tools, tests or this folder are skipped.
- **A tag like `v0.67.0`** uploads a **release** (`v0.67.0-beta1` uploads a beta) and makes a GitHub release.

To switch it on:

1. Put the project ID (shown on the project page, under About Project) in `RPGDialogue/RPGDialogue.toc`, as a new line under `## X-Website:`:
   `## X-Curse-Project-ID: 123456`
2. Make an API token at https://authors.curseforge.com/account/api-tokens.
3. In the GitHub repo, go to Settings > Secrets and variables > Actions and add `CF_API_TOKEN` with that token.
4. For a release, tag and push: `git tag v0.67.0 && git push origin v0.67.0`.

Without the ID and token, the packager still builds the zip but skips the upload.

**GitHub Actions has to be running for any of this.** Every recent run failed in seconds without a runner. Making the repo public usually fixes that; otherwise check Settings > Actions and your billing. Until it runs, upload by hand.
