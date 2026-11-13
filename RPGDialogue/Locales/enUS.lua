-- English UI strings. Dialogue text lives in content packs, not here.
local _, ns = ...

-- Missing keys fall back to the key itself, so a typo shows up visibly instead of erroring.
local L = setmetatable({}, { __index = function(_, key) return key end })
ns.L = L

L.ADDON_NAME = "RPG Dialogue"
L.PREFIX = "|cffd8b86aRPG Dialogue|r"

-- Keybindings (names shown in the Key Bindings screen)
L.BINDING_HEADER = "RPG Dialogue"
L.BINDING_TALK = "Talk to Target"
L.BINDING_JOURNAL = "Open Journal"

-- Slash help
L.HELP_HEADER = "Commands (/rpgd):"
L.HELP_LINES = {
  "talk - talk to your target",
  "settings - open the settings panel",
  "capture - record your target (ID, name, place) for the content tools",
  "autocapture on|off - capture every NPC you interact with or target",
  "dump ctx - print what the addon knows about you right now",
  "spoof key=value ... | spoof clear - pretend to be someone else, for testing",
  "why - explain the last line choice",
  "mem - memory used by the addon and each content pack",
  "probe - list which game APIs this client has",
  "auras - list your current auras with spell IDs",
  "flagged - list lines you flagged as wrong",
  "packs - list content packs",
  "seed <n> - replay the next conversation with a fixed random seed",
  "dev on|off - developer messages",
  "reset - wipe this character's RPG Dialogue memory (asks first)",
}

-- Messages
L.LOADED = "loaded. Type /rpgd for commands."
L.DEV_ON = "Developer mode on."
L.DEV_OFF = "Developer mode off."
L.UNKNOWN_COMMAND = "Unknown command: %s. Type /rpgd for a list."
L.CAPTURE_NO_TARGET = "Target an NPC first."
L.CAPTURE_NOT_NPC = "That target isn't an NPC."
L.CAPTURE_SAVED = "Captured %s (NPC %s) in %s."
L.AUTOCAPTURE_ON = "Auto-capture on: every NPC you talk to or target is recorded."
L.AUTOCAPTURE_OFF = "Auto-capture off."
L.CAPTURE_COUNT = "Capture data: %d NPCs, %d quests, %d gossip texts, %d quest texts."
L.SPOOF_SET = "Spoofing: %s"
L.SPOOF_CLEARED = "Spoofing cleared."
L.SPOOF_BAD = "Couldn't read '%s'. Use key=value, e.g. race=Gnome class=PRIEST level=8."
L.SPOOF_NONE = "Nothing spoofed."
L.MEM_HEADER = "Memory (KB):"
L.MEM_TOTAL = "Total: %.0f KB"
L.PROBE_HEADER = "API probe (present / missing):"
L.AURAS_HEADER = "Your auras (spell ID, name):"
L.AURAS_NONE = "No auras."
L.RESET_CONFIRM = "This erases what every NPC remembers about this character. Type /rpgd reset confirm to do it."
L.RESET_DONE = "This character's RPG Dialogue memory was reset."
L.SEED_SET = "Next conversation uses seed %d."
L.SV_REPAIRED = "Some saved data was damaged and has been set aside (not deleted): %s. Please back up your WTF folder."
L.SV_NEWER = "Saved data is from a newer version of RPG Dialogue (schema %d). Please update the addon. Nothing was changed."
L.SV_MIGRATED = "Saved data updated from schema %d to %d."
L.COMBAT_LATER = "Not during combat."

-- ctx dump
L.CTX_HEADER = "Context:"
L.CTX_SPOOFED = "(spoofed)"
