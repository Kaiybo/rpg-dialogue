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
  "journal - open the journal",
  "export | import - save or restore this character's story as text",
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

-- Journal
L.J_TITLE = "Journal"
L.J_TAB_CHRONICLE = "Chronicle"
L.J_TAB_PEOPLE = "People"
L.J_TAB_SHEET = "Character"
L.J_TAB_TOPICS = "Topics"
L.J_TAB_DEEDS = "Deeds"
L.J_TAB_NOTES = "Notes"
L.J_TODAY = "today"
L.J_YESTERDAY = "yesterday"
L.J_DAYS_AGO = "%d days ago"
L.J_EMPTY = "Nothing written yet. Talk to people; the journal fills itself."
L.J_FOLDED = "(%d older entries, folded to keep the journal light)"
L.J_TALKED = "talked %d times"
L.J_NOBODY = "You haven't really talked to anyone yet."
L.J_ALIGNMENT = "Where you stand"
L.J_TRAITS = "How you come across:"
L.J_OPINIONS = "What you've said you believe"
L.J_CONTRADICTED = "(you've said otherwise, too)"
L.J_TOWNS = "What the towns think of you"
L.J_ORIGIN = "Origin:"
L.J_NO_ORIGIN = "not chosen (optional)"
L.J_NONE_YET = "nothing yet"
L.J_NO_TOPICS = "No topics yet."
L.J_CLAIMS = "What people have told you"
L.J_INSISTS = "%s insists: \"%s\""
L.J_SETTLED = "(settled)"
L.J_BOOKS = "Books read"
L.J_DEATHS = "Died %d time(s)."
L.J_NO_DEEDS = "No deeds yet."
L.J_ORIGIN_PICK = "Origin: %s. Edit the blurb below, then confirm."
L.J_ORIGIN_CURRENT = "Your origin: %s. You can edit the blurb below (Enter saves)."
L.J_ORIGIN_NONE = "Pick an origin if you like. It's optional and you can change it later."
L.J_ORIGIN_NEXT = "Browse origins"
L.J_ORIGIN_CHANGE = "Change origin"
L.J_ORIGIN_CONFIRM = "Confirm"
L.ORIGIN_OTHER = "Other"
L.ORIGIN_JOURNAL_SOURCE = "your past"
L.ORIGIN_HINT = "You can give your character an origin in the RPG Dialogue journal (Character tab). It's optional, and some people will notice."
L.AFF_HOSTILE = "hostile"
L.AFF_WARY = "wary"
L.AFF_NEUTRAL = "neutral"
L.AFF_WARM = "warm"
L.AFF_FOND = "fond of you"
L.AX_LIGHT, L.AX_SHADOW, L.AX_ORDER, L.AX_WILD, L.AX_HONOR, L.AX_CUNNING = "Light", "Shadow", "Order", "Wild", "Honor", "Cunning"
L.ALIGN_BALANCED = "balanced between %s and %s"
L.ALIGN_LEANING = "leaning toward %s"
L.ALIGN_FIRMLY = "firmly %s"
L.ALIGN_DEEPLY = "deeply %s"
L.TAINT_FAINT = "Something fel clings to you, faintly."
L.TAINT_STRONG = "Fel taint has settled into you."
L.DEED_FIRST_DEATH = "Died for the first time"
L.DEED_LEVEL = "Reached level %s"
L.DEED_ZONE = "First visit: %s"
L.DEED_DUNGEON = "Entered %s"
L.DEED_KILL = "Defeated %s"

-- Export / import
L.EXPORT_TITLE = "Export your story"
L.EXPORT_HINT = "Press Ctrl+C to copy. Keep it somewhere safe; /rpgd import restores it."
L.IMPORT_TITLE = "Import a story"
L.IMPORT_HINT = "Paste an export string (Ctrl+V), then Check. Nothing changes until you confirm."
L.IMPORT_CHECK = "Check"
L.IMPORT_CONFIRM = "Replace my story"
L.IMPORT_BAD = "That string can't be imported: %s. Nothing was changed."
L.IMPORT_OK = "Looks good (from %s). Click again to replace this character's story. The old one is kept aside."
L.IMPORT_DONE = "Story imported. The previous one was kept aside in saved data."

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
