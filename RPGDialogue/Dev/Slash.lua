-- /rpgd and /rpgdialogue
local _, ns = ...

local C = ns.Compat
local L = ns.L
local Slash = {}
ns.Slash = Slash

local function printList(header, lines)
  ns.Print(header)
  for _, line in ipairs(lines) do C.Print("  " .. line) end
end

local function notYet() ns.Print("That part isn't built yet.") end

local commands = {}

commands.help = function()
  printList(L.HELP_HEADER, L.HELP_LINES)
end

commands.kin = function() if ns.Kin then ns.Kin.Print() end end
commands.version = function() ns.Print(L.VERSION_SHORT:format(ns.VERSION)) end

commands.dev = function(args)
  local on = args[1] ~= "off"
  if args[1] == nil then on = not ns.db.settings.dev end
  ns.db.settings.dev = on
  ns.Print(on and L.DEV_ON or L.DEV_OFF)
end

commands.capture = function(args)
  if args[1] == "zone" then return ns.Capture.ZoneStatus() end
  ns.Capture.Target(); ns.Capture.Summary()
end

commands.autocapture = function(args)
  local on = args[1] ~= "off"
  if args[1] == nil then on = not ns.db.settings.autoCapture end
  ns.db.settings.autoCapture = on
  ns.Print(on and L.AUTOCAPTURE_ON or L.AUTOCAPTURE_OFF)
end

commands.spoof = function(args) ns.Spoof.Apply(args) end

commands.dump = function(args)
  if args[1] ~= "ctx" then ns.Print("Usage: /rpgd dump ctx"); return end
  local unit = C.Exists("npc") and "npc" or (C.Exists("target") and "target" or nil)
  local ctx = ns.Context.New({ unit = unit })
  printList(L.CTX_HEADER, ns.Context.Describe(ctx))
end

commands.probe = function()
  local lines = {}
  for _, p in ipairs(C.Probe()) do
    local state = p.present and "|cff40ff40yes|r " or (p.legacy and "|cff888888no|r  " or "|cffff4040no|r  ")
    lines[#lines + 1] = state .. p.name .. ((p.legacy and not p.present) and L.PROBE_LEGACY or "")
  end
  for ev in pairs(ns.unknownEvents) do lines[#lines + 1] = "|cffff4040no|r  event " .. ev end
  local version, build, _, toc = C.Build()
  lines[#lines + 1] = ("client %s (%s), interface %s"):format(tostring(version), tostring(build), tostring(toc))
  printList(L.PROBE_HEADER, lines)
end

commands.auras = function()
  local lines = {}
  for _, filter in ipairs({ "HELPFUL", "HARMFUL" }) do
    C.ForEachAura("player", filter, function(a)
      lines[#lines + 1] = tostring(a.spellId) .. "  " .. tostring(a.name) .. (a.dispel and ("  [" .. a.dispel .. "]") or "")
    end)
  end
  if #lines == 0 then ns.Print(L.AURAS_NONE) else printList(L.AURAS_HEADER, lines) end
end

commands.mem = function()
  C.UpdateMemory()
  local lines, total = {}, 0
  local names = { ns.name }
  if ns.Packs then
    for _, p in ipairs(ns.Packs.List()) do
      if p.addon and p.loaded then names[#names + 1] = p.addon end
    end
  end
  for _, name in ipairs(names) do
    local kb = C.MemoryKB(name)
    total = total + kb
    lines[#lines + 1] = ("%7.0f  %s"):format(kb, name)
  end
  lines[#lines + 1] = L.MEM_TOTAL:format(total)
  printList(L.MEM_HEADER, lines)
end

commands.reset = function(args)
  if args[1] ~= "confirm" then ns.Print(L.RESET_CONFIRM); return end
  ns.SavedData.ResetCharacter()
  ns.Print(L.RESET_DONE)
end

commands.talk = function()
  if ns.Conversation then ns.Conversation.TalkToTarget() else notYet() end
end

commands.settings = function()
  if ns.Settings then ns.Settings.Open() else notYet() end
end

commands.why = function(args)
  if ns.Why then ns.Why.Print(tonumber(args[1])) else notYet() end
end

commands.flagged = function()
  if ns.Flag then ns.Flag.List() else notYet() end
end

commands.packs = function()
  if ns.Packs then ns.Packs.PrintList() else notYet() end
end

commands.seed = function(args)
  local n = tonumber(args[1])
  if not n or not ns.Engine then notYet(); return end
  ns.Engine.forcedSeed = n
  ns.Print(L.SEED_SET:format(n))
end

commands.threads = function(args)
  if args[1] == "reset" and args[2] then
    ns.Threads.Reset(args[2]); ns.Print(L.DONE); return
  elseif args[1] == "force" and args[2] and args[3] then
    local ok, npc = ns.Threads.Force(args[2], args[3])
    ns.Print(ok and ("Next conversation with " .. tostring(npc) .. " offers " .. args[3] .. ".") or L.NOT_FOUND:format(args[2] .. " " .. args[3]))
    return
  end
  local lines = ns.Threads.Describe()
  if #lines == 0 then ns.Print(L.THREADS_NONE) else printList(L.THREADS_HEADER, lines) end
end

commands.claims = function()
  local lines = {}
  for id, rec in pairs(ns.char.claims.heard) do
    local def = ns.Data.claims[id]
    local exposed = ns.char.claims.exposed[id] and " |cff40ff40(settled)|r" or ""
    lines[#lines + 1] = ("%s: \"%s\" (from %s)%s"):format(id, def and def.text or "?", tostring(rec.npc or (def and def.by) or "?"), exposed)
  end
  table.sort(lines)
  if #lines == 0 then ns.Print(L.CLAIMS_NONE) else printList(L.CLAIMS_HEADER, lines) end
end

commands.topics = function(args)
  if args[1] == "teach" and args[2] then ns.Topics.Teach(args[2]); ns.Print(L.DONE); return end
  if args[1] == "forget" and args[2] then ns.Topics.Forget(args[2]); ns.Print(L.DONE); return end
  local lines = {}
  for _, t in ipairs(ns.Topics.Known(true)) do
    lines[#lines + 1] = t.id .. " (" .. t.category .. ")" .. (t.archived and " [old]" or "")
  end
  if #lines == 0 then ns.Print(L.TOPICS_NONE) else printList(L.TOPICS_HEADER, lines) end
end

commands.die = function(args)
  local cause = args[1] or "unknown"
  local c = ns.char
  local zone, sub = C.Zone()
  c.deaths[#c.deaths + 1] = { t = C.Now(), zone = zone, subzone = sub, cause = cause, level = C.Level("player"), fake = true }
  c.deathCount = (c.deathCount or 0) + 1
  ns.Print(L.DIE_DONE:format(cause))
end

commands.journal = function() ns.Journal.Toggle() end

-- letters: open the letters panel (only at an open mailbox). letters send <id>: deliver that letter now (testing).
commands.letters = function(args)
  if args[1] == "send" and args[2] then
    if not ns.Letters.Def(args[2]) then ns.Print(L.LETTER_UNKNOWN:format(args[2])); return end
    local r = ns.char.letters and ns.char.letters[args[2]]
    if r then ns.char.letters[args[2]] = nil end
    ns.Letters.Queue(args[2], C.Now())
    ns.char.letters[args[2]].due = C.Now()
    ns.Letters.Deliver(C.Now())
    return
  end
  if args[1] == "random" then
    local id = ns.Letters.RollRandom(C.Now(), true)
    if id then ns.char.letters[id].due = C.Now(); ns.Letters.Deliver(C.Now()) else ns.Print(L.LETTER_NO_RANDOM) end
    return
  end
  ns.UI.Letters.Toggle()
end

commands.errands = function()
  local lines = ns.Errands.Describe()
  if #lines == 0 then ns.Print(L.ERRANDS_NONE) else printList(L.ERRANDS_HEADER, lines) end
end

commands.insanity = function(args)
  local n = tonumber(args[1]) or 0
  ns.Insanity.Add(n - ns.Insanity.Level())
  ns.Print(L.INSANITY_SET:format(ns.Insanity.Level()))
end
commands.export = function() ns.UI.ExportFrame.Show("export") end
commands.sheet = function() ns.UI.ExportFrame.Show("sheet") end
commands.import = function() ns.UI.ExportFrame.Show("import") end

-- /rpgd tone [polite|normal|blunt]: show or set this character's tone (0.85.0).
commands.tone = function(args)
  local t = args[1] and args[1]:lower()
  if t == "polite" or t == "normal" or t == "blunt" then ns.Conversation.SetTone(t) end
  local cur = ns.Disposition.Tone()
  ns.Print(L.TONE_LABEL:format(L["TONE_" .. cur:upper()] or cur))
end

-- /rpgd tts: what text to speech is using, then a line in each voice. Failures are
-- reported in chat while the test runs.
commands.tts = function()
  local lines = {}
  local function yes(b) return b and "|cff40ff40yes|r" or "|cffff4040no|r" end
  lines[#lines + 1] = "SpeakText " .. yes(C.Resolve("C_VoiceChat.SpeakText"))
    .. ", TextToSpeech_Speak " .. yes(C.Resolve("TextToSpeech_Speak"))
    .. ", TTS settings " .. yes(C.Resolve("C_TTSSettings.GetSpeechRate"))
  local voices = C.TTSVoices()
  lines[#lines + 1] = ("%d voice(s): "):format(#voices)
  for i = 1, math.min(#voices, 8) do
    lines[#lines] = lines[#lines] .. (i > 1 and ", " or "") .. tostring(voices[i].voiceID) .. "=" .. tostring(voices[i].name)
  end
  local m, f = C.TTSVoice("male"), C.TTSVoice("female")
  lines[#lines + 1] = ("men: %s, women: %s, rate %s, volume %s (game setting %s)"):format(tostring(m.name),
    tostring(f.name), tostring(C.TTSRate()), tostring(C.TTSVolume()), tostring(C.TTSGameVolume()))
  lines[#lines + 1] = "read aloud in conversations: " .. yes(ns.db.settings.tts)
  if C.TTS.lastError then lines[#lines + 1] = "last error: " .. C.TTS.lastError end
  C.TTS.bad = {}   -- each test starts with every way to speak allowed again
  printList(L.TTS_HEADER, lines)
  if not C.TTSAvailable() then ns.Print(L.OPT_TTS_MISSING); return end
  C.TTS.verbose = true
  C.Speak(L.TTS_TEST_MALE, "male")
  C.After(5, function()
    C.Speak(L.TTS_TEST_FEMALE, "female")
    C.After(6, function()
      C.TTS.verbose = nil
      if C.TTS.lastHow then ns.Print("Text to speech used " .. C.TTS.lastHow .. ".") end
    end)
  end)
end

function Slash.Handle(msg)
  local args = {}
  for word in (msg or ""):gmatch("%S+") do args[#args + 1] = word end
  local cmd = table.remove(args, 1)
  cmd = cmd and cmd:lower() or "help"
  local fn = commands[cmd]
  if not fn then ns.Print(L.UNKNOWN_COMMAND:format(cmd)); return end
  fn(args)
end

Slash.commands = commands

C.RegisterSlash("RPGD", { "/rpgd", "/rpgdialogue" }, Slash.Handle)
C.SetGlobal("BINDING_HEADER_RPGD", L.BINDING_HEADER)
C.SetGlobal("BINDING_NAME_RPGD_TALK", L.BINDING_TALK)
C.SetGlobal("BINDING_NAME_RPGD_JOURNAL", L.BINDING_JOURNAL)
C.SetGlobal("BINDING_NAME_RPGD_ASK", L.BINDING_ASK)

ns.OnLogin(function()
  if ns.db.settings.dev then ns.Print(L.LOADED:format(ns.VERSION))
  else ns.Print(L.VERSION_SHORT:format(ns.VERSION)) end
  local listed = C.AddOnMeta(ns.name, "Version")
  if listed and listed ~= ns.VERSION then ns.Packs.TellRestart(L.ADDON_NAME, listed, ns.VERSION) end
end)
