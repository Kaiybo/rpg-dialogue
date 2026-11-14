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
  "threads [reset <id> | force <id> <beat>] - throughline states and beats",
  "claims - claims you've heard, who told you, and whether they're exposed",
  "topics [teach <id> | forget <id>] - topics you know",
  "die <cause> - record a fake death (falling, drowning, guard, trivial, boss, ...)",
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

-- Conversation
L.FALLBACK_LINE = "They look at you, waiting for you to speak first."
L.FAREWELL = "Farewell."
L.GET_ON_WITH_IT = "Get on with it."
L.TALK = "Talk"
L.TALK_NO_TARGET = "Target someone to talk to first."
L.TALK_HOSTILE = "They're in no mood to talk."
L.TALK_TOO_FAR = "You're too far away to talk."
L.FLAG_TIP = "This line is wrong"
L.FLAG_TIP2 = "Saves this line, who said it and everything the addon knows about you right now, so it can be fixed. You can add a short note."
L.FLAG_HINT = "Optional note, then Enter."
L.FLAG_SAVED = "Flagged. Thank you."
L.FLAG_SAVED_CHAT = "Flagged line %s. /rpgd flagged lists them."
L.FLAG_NONE = "No flagged lines."
L.FLAG_LIST = "%d flagged line(s):"
L.OTHER_ADDON_NOTICE = "%s is handling NPC conversations, so RPG Dialogue only shows a short line. Use the Talk keybinding for a full conversation, or change this in /rpgd settings."
L.LAUNCHER_TIP = "Left-click: journal (when available). Right-click: settings."

-- Ask about
L.ASK_BUTTON = "Ask about..."
L.ASK_TITLE = "Ask about..."
L.ASK_NONE = "You haven't heard of anything worth asking about yet."
L.ASK_ARCHIVED = "old"
L.ASK_SHOW_ARCHIVE = "Show older topics"
L.ASK_HIDE_ARCHIVE = "Hide older topics"

-- Dev: story systems
L.THREADS_HEADER = "Throughlines:"
L.THREADS_NONE = "No throughlines loaded."
L.CLAIMS_HEADER = "Claims you've heard:"
L.CLAIMS_NONE = "You haven't heard any claims yet."
L.TOPICS_HEADER = "Topics you know:"
L.TOPICS_NONE = "You don't know any topics yet."
L.DIE_DONE = "Recorded a fake death (cause: %s) for testing spirit healer lines."
L.DONE = "Done."
L.NOT_FOUND = "Not found: %s"

-- Settings
L.OPT_ENABLED = "Enable RPG Dialogue"
L.OPT_OPEN_MODE = "Repeat visits with nothing new"
L.OPEN_COMPACT = "Short line, then business"
L.OPEN_SKIP = "Straight to business"
L.OPEN_FULL = "Always a full conversation"
L.OPT_FADE = "Fade the normal window while the conversation covers it"
L.OPT_ACK = "How often NPCs notice things about you"
L.OPT_NEW_MARKER = "Mark NPCs who have something new to say (in their tooltip)"
L.OPT_HEADER_OTHERS = "Other dialogue addons"
L.OPT_OTHERS_FOUND = "Found: %s."
L.OPT_OTHERS_NONE = "None found. This setting applies if you install Immersion or DialogueUI."
L.OPT_OTHERS = "When one is loaded"
L.OTHERS_STEPBACK = "Step back (Talk key only)"
L.OTHERS_TAKEOVER = "RPG Dialogue takes over"
L.OTHERS_OFF = "Turn RPG Dialogue off"
L.OPT_HEADER_STORY = "Story"
L.OPT_JOURNAL_VOICE = "Journal voice"
L.VOICE_FIRST = "First person (diary)"
L.VOICE_THIRD = "Third person (chronicle)"
L.OPT_TAGS = "Tags like [Persuade]"
L.TAGS_AVAILABLE = "When the option is available"
L.TAGS_ALWAYS = "Always"
L.TAGS_NEVER = "Never"
L.OPT_LOCKED = "Show locked options greyed out"
L.OPT_HINTS = "Show alignment hints on replies"
L.OPT_BARKS = "Nearby NPCs speak up now and then"
L.OPT_INSANITY = "Insanity effects"
L.OPT_INSANITY_LEVEL = "Insanity intensity"
L.OPT_TTS = "Read dialogue aloud (text to speech)"
L.OPT_TTS_MISSING = "Text to speech isn't available in this client."
L.OPT_HEADER_ACCESS = "Readability and accessibility"
L.OPT_TEXT_SIZE = "Text size"
L.OPT_SPACING = "Line spacing"
L.OPT_READABLE = "High-readability font"
L.OPT_SPEED = "Text speed (characters per second)"
L.OPT_INSTANT = "Show text instantly"
L.OPT_AUTO = "Auto-advance when there's only one reply"
L.OPT_AUTO_DELAY = "Auto-advance delay (seconds)"
L.OPT_REDUCE_MOTION = "Reduce motion (no typewriter, no screen effects)"
L.OPT_CONTRAST = "High-contrast theme"
L.OPT_SOUNDS = "Sounds"
L.OPT_SCALE = "Window scale"
L.OPT_HEADER_PACKS = "Content packs"
L.OPT_PACKS_NOTE = "Turning a pack off takes effect after /reload."
L.PACK_REFUSED = "needs a newer RPG Dialogue"
L.OPT_HEADER_DEV = "Developer"
L.OPT_DEV = "Developer messages"
L.OPT_AUTOCAPTURE = "Auto-capture NPCs you talk to or target"
L.OPT_CAPTURE_TEXT = "Capture gossip and quest text (writing reference)"

-- ctx dump
L.CTX_HEADER = "Context:"
L.CTX_SPOOFED = "(spoofed)"
