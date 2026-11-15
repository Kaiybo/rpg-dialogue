-- luacheck config. Run from the repo root:  luacheck .
-- Rule: only RPGDialogue/Core/Compat.lua may touch WoW API globals. Everything else gets
-- a short allowlist of widget-level names, so a stray API call fails lint.
std = "lua51"
max_line_length = false
unused_args = false
self = false
exclude_files = { "tests/**", "tools/**", ".luarocks/**", ".claude/**" }

-- Widget-level names any core file may use.
read_globals = {
  "CreateFrame", "UIParent", "GameTooltip",
  "GameFontNormal", "GameFontNormalSmall", "GameFontNormalLarge", "GameFontHighlight",
  "GameFontHighlightSmall", "GameFontHighlightLarge", "GameFontDisable", "QuestFont",
  "STANDARD_TEXT_FONT",
}

-- The one file that may read and write anything in _G (through a local alias).
files["RPGDialogue/Core/Compat.lua"] = { globals = { "_G" }, read_globals = { "print" } }

-- Content packs: the data subset only. They may read the public API and nothing else.
files["RPGDialogue_*/**/*.lua"] = { read_globals = { "RPGDialogueAPI" } }
files["RPGDialogue_*/*.lua"] = { read_globals = { "RPGDialogueAPI" } }
