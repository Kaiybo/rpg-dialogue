-- SavedVariables: defaults, schema version, migrations, repair, trimming.
-- Rule: never wipe anything silently. Damaged data is set aside in _quarantine and the
-- player is told.
local _, ns = ...

local U = ns.Util
local SD = {}
ns.SavedData = SD

SD.SCHEMA = 6

SD.ACCOUNT_DEFAULTS = {
  schema = SD.SCHEMA,
  settings = {
    enabled = true,
    dev = false,
    autoCapture = false,
    captureText = true,
    rightClickTalk = true,      -- right-clicking someone with no menu opens the box
    openMode = "full",          -- talking to someone: "full" (the conversation box, every time)
                                --   | "compact" (short line; the box only when there's news) | "skip"
    otherAddons = "auto",       -- with Immersion/DialogueUI: "auto" | "takeover" | "stepback" | "off"
    trp3Name = true,            -- with Total RP 3 loaded: NPCs use your roleplay name
    trp3Title = true,           -- ...and your roleplay title
    ackChance = 0.35,           -- noticing-moment frequency
    barks = true,
    insanityFx = true,
    insanityIntensity = 0.5,
    journalVoice = "first",     -- "first" (diary) | "third" (chronicle)
    alignHints = false,
    tts = false,
    tags = "available",         -- special option tags: "always" | "available" | "never"
    showLocked = false,
    newMarker = false,
    fadeDefault = true,         -- fade Blizzard's window while ours covers it
    textSize = 13,              -- the game's quest font size
    lineSpacing = 3,
    look = "game",
    pagesInBox = true,          -- the game's next gossip page and quest pages stay in the box              -- "game" (the game's own quest window art) | "wood"
    fontBody = "friz",          -- see Theme.FONT_LIST ("lsm:<name>" for SharedMedia fonts)
    fontName = "auto",          -- "auto" (the window's own) | "same" (as the text) | a font
    textSpeed = 70,             -- characters per second
    instantText = false,
    autoAdvance = false,
    autoDelay = 4,
    reduceMotion = false,
    gamepad = true,             -- gamepad buttons in our windows (client gamepad mode only)
    highContrast = false,
    sounds = true,
    scale = 1,
    packs = {},                 -- pack id -> false when turned off
    pos = {},                   -- window positions by name
    seenLoginHint = false,
  },
  capture = { npcs = {}, quests = {}, gossip = {}, questText = {} },
  flagged = {},
  debug = {},
  _quarantine = {},
}

SD.CHAR_DEFAULTS = {
  schema = SD.SCHEMA,
  conversations = 0,
  npc = {},
  seen = {},
  heard = {},
  quests = { turnedIn = {}, accepted = {} },
  align = { light = 0, order = 0, honor = 0, taint = 0 },
  traits = {},
  opinions = {},
  flags = {},
  claims = { player = {}, heard = {}, exposed = {} },
  deeds = {},
  threads = {},
  towns = {},
  origin = nil,
  topics = {},
  books = {},
  deaths = {},
  deathCount = 0,
  homeInn = nil,
  journal = {},
  insanity = { level = 0 },
  pacing = { sys = {}, ack = {}, ackNpc = {} },
  zones = {},
  drunk = 0,
  notes = "",
  originsApplied = {},
  places = {},
  errands = {},
  _quarantine = {},
}

-- Migrations: [targetSchema] = function(db) ... end. Run in order on load.
SD.MIGRATIONS = { account = {}, char = {} }

-- Schema 2: the conversation box opens every time by default (it used to open only on
-- first meetings and news, with a short line otherwise). Moves the old default over.
SD.MIGRATIONS.account[2] = function(db)
  if type(db.settings) == "table" and db.settings.openMode == "compact" then db.settings.openMode = "full" end
end

-- Schema 3: the "high-readability font" switch became a font choice.
SD.MIGRATIONS.account[3] = function(db)
  if type(db.settings) == "table" and db.settings.readableFont == true then
    db.settings.fontBody = "atkinson"
    db.settings.fontName = "same"
  end
  if type(db.settings) == "table" then db.settings.readableFont = nil end
end

-- Schema 4: the "game style" look. Names default to the window's own font (Friz Quadrata
-- in the game's title bar, Morpheus on wood), which is what Morpheus, the old default, was.
SD.MIGRATIONS.account[4] = function(db)
  if type(db.settings) == "table" and db.settings.fontName == "morpheus" then db.settings.fontName = "auto" end
end

-- Schema 5: RPG Dialogue works with DialogueUI ("auto": talk first, then DialogueUI's
-- window). "Step back" was the old default for every other dialogue addon.
SD.MIGRATIONS.account[5] = function(db)
  if type(db.settings) == "table" and db.settings.otherAddons == "stepback" then db.settings.otherAddons = "auto" end
  if type(db.settings) == "table" and db.settings.toldAboutOther == true then db.settings.toldAboutOther = nil end
end

-- Schema 6: the default text size is the game's quest font size, 13 (was 14).
SD.MIGRATIONS.account[6] = function(db)
  if type(db.settings) == "table" and db.settings.textSize == 14 then db.settings.textSize = 13 end
end

SD.LIMITS = { seen = 1500, journal = 2000, deaths = 500, debug = 300, flagged = 500 }

---------------------------------------------------------------------------
local function fillDefaults(db, defaults)
  for k, v in pairs(defaults) do
    if db[k] == nil then
      db[k] = U.DeepCopy(v)
    elseif type(v) == "table" and type(db[k]) == "table" and next(v) ~= nil and k ~= "_quarantine" then
      fillDefaults(db[k], v)
    end
  end
end

-- Moves any value whose type disagrees with the defaults into _quarantine.
-- Returns a list of the keys that were set aside.
function SD.Repair(db, defaults, path, issues, quarantine)
  issues = issues or {}
  quarantine = quarantine or db._quarantine
  for k, v in pairs(defaults) do
    local cur = db[k]
    if cur ~= nil and v ~= nil and type(cur) ~= type(v) and k ~= "_quarantine" then
      local where = path and (path .. "." .. tostring(k)) or tostring(k)
      quarantine[#quarantine + 1] = { path = where, value = cur }
      issues[#issues + 1] = where
      db[k] = nil
    elseif type(cur) == "table" and type(v) == "table" and next(v) ~= nil and k ~= "_quarantine" then
      SD.Repair(cur, v, path and (path .. "." .. tostring(k)) or tostring(k), issues, quarantine)
    end
  end
  return issues
end

-- Prepares one SavedVariables table. Returns db, report { migratedFrom, issues, newer }.
-- If the data comes from a newer schema, it is returned untouched (report.newer) and the
-- caller runs this session on a temporary copy of the defaults instead.
function SD.Prepare(raw, defaults, migrations)
  local report = { issues = {} }
  local db = raw
  if db ~= nil and type(db) ~= "table" then
    report.issues[#report.issues + 1] = "(whole table)"
    db = { _quarantine = { { path = "(whole table)", value = raw } } }
  end
  db = db or {}
  if type(db._quarantine) ~= "table" then db._quarantine = {} end

  local schema = tonumber(db.schema)
  if schema and schema > SD.SCHEMA then
    report.newer = schema
    return db, report
  end

  if schema and schema < SD.SCHEMA then
    for target = schema + 1, SD.SCHEMA do
      local fn = migrations[target]
      if fn then fn(db) end
    end
    report.migratedFrom = schema
  end

  SD.Repair(db, defaults, nil, report.issues)
  fillDefaults(db, defaults)
  db.schema = SD.SCHEMA
  return db, report
end

---------------------------------------------------------------------------
-- Trimming: keep growing tables small.
---------------------------------------------------------------------------
function SD.TrimSeen(seen, limit)
  local n = U.Count(seen)
  if n <= limit then return 0 end
  local list = {}
  for id, rec in pairs(seen) do list[#list + 1] = { id = id, t = type(rec) == "table" and rec.t or 0 } end
  table.sort(list, function(a, b) return a.t < b.t end)
  local remove = n - limit
  for i = 1, remove do seen[list[i].id] = nil end
  return remove
end

-- Folds the oldest journal entries into one summary entry instead of dropping them.
function SD.TrimJournal(journal, limit)
  if #journal <= limit then return 0 end
  local fold = #journal - limit + 1
  local first, last = journal[1], journal[fold]
  local summary = {
    t = first and first.t or 0, t2 = last and last.t or 0, folded = fold,
    kind = "summary",
  }
  local kept = { summary }
  for i = fold + 1, #journal do kept[#kept + 1] = journal[i] end
  U.Wipe(journal)
  for i = 1, #kept do journal[i] = kept[i] end
  return fold
end

local function trimList(list, limit)
  while #list > limit do table.remove(list, 1) end
end

function SD.Trim()
  local char, acct = ns.char, ns.db
  if char then
    SD.TrimSeen(char.seen, SD.LIMITS.seen)
    SD.TrimJournal(char.journal, SD.LIMITS.journal)
    trimList(char.deaths, SD.LIMITS.deaths)
  end
  if acct then
    trimList(acct.debug, SD.LIMITS.debug)
    trimList(acct.flagged, SD.LIMITS.flagged)
  end
end

---------------------------------------------------------------------------
-- Load at ADDON_LOADED
---------------------------------------------------------------------------
-- Returns the table to use this session. Newer-schema data stays in the SavedVariable
-- untouched; this session runs on a throwaway copy of the defaults.
local function loadOne(svName, defaults, migrations)
  local C = ns.Compat
  local db, report = SD.Prepare(C.GetSV(svName), defaults, migrations)
  if report.newer then
    ns.readOnly = true
    return U.DeepCopy(defaults), report
  end
  C.SetSV(svName, db)
  return db, report
end

function SD.Load()
  local acct, r1 = loadOne("RPGDialogueDB", SD.ACCOUNT_DEFAULTS, SD.MIGRATIONS.account)
  local char, r2 = loadOne("RPGDialogueCharDB", SD.CHAR_DEFAULTS, SD.MIGRATIONS.char)
  ns.db, ns.char = acct, char
  SD.Trim()

  local L = ns.L
  for _, r in ipairs({ r1, r2 }) do
    if r.newer then ns.Print(L.SV_NEWER:format(r.newer)) end
    if r.migratedFrom then ns.Print(L.SV_MIGRATED:format(r.migratedFrom, SD.SCHEMA)) end
    if #r.issues > 0 then ns.Print(L.SV_REPAIRED:format(table.concat(r.issues, ", "))) end
  end
end

function SD.ResetCharacter()
  local fresh = U.DeepCopy(SD.CHAR_DEFAULTS)
  fresh._quarantine = ns.char and ns.char._quarantine or {}
  ns.Compat.SetSV("RPGDialogueCharDB", fresh)
  ns.char = fresh
end

ns.OnInit(SD.Load)
ns.On("PLAYER_LOGOUT", function() SD.Trim() end)
