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

commands.dev = function(args)
  local on = args[1] ~= "off"
  if args[1] == nil then on = not ns.db.settings.dev end
  ns.db.settings.dev = on
  ns.Print(on and L.DEV_ON or L.DEV_OFF)
end

commands.capture = function() ns.Capture.Target(); ns.Capture.Summary() end

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
    lines[#lines + 1] = (p.present and "|cff40ff40yes|r " or "|cffff4040no|r  ") .. p.name
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

ns.OnLogin(function()
  if ns.db.settings.dev then ns.Print(L.LOADED) end
end)
