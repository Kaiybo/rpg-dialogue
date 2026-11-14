-- Namespace, event dispatch, internal messages, load lifecycle, logging.
local addonName, ns = ...

ns.name = addonName
-- This build's version. The TOC's "## Version" must match (tools/version.py keeps them in
-- step); a mismatch at login means the game still has an old file list (see Packs).
ns.VERSION = "0.10.3"

---------------------------------------------------------------------------
-- Game events
---------------------------------------------------------------------------
local eventFrame = CreateFrame("Frame")
local handlers = {}        -- event -> { fn, ... }
ns.unknownEvents = {}      -- events this client refused to register

-- Register fn for a game event. Unknown events are recorded instead of erroring,
-- because Forever's client may not have every event we know from retail.
function ns.On(event, fn)
  local list = handlers[event]
  if not list then
    if not pcall(eventFrame.RegisterEvent, eventFrame, event) then
      ns.unknownEvents[event] = true
      return false
    end
    list = {}
    handlers[event] = list
  end
  list[#list + 1] = fn
  return true
end

eventFrame:SetScript("OnEvent", function(_, event, ...)
  local list = handlers[event]
  if list then
    for i = 1, #list do list[i](event, ...) end
  end
end)

-- Unit events get their own frame per event so the unit filter doesn't clash.
local unitFrames = {}
function ns.OnUnit(event, unit, fn)
  local f = unitFrames[event]
  if not f then
    f = CreateFrame("Frame")
    f.fns = {}
    if not pcall(f.RegisterUnitEvent, f, event, unit) then
      ns.unknownEvents[event] = true
      return false
    end
    f:SetScript("OnEvent", function(self, ev, ...)
      for i = 1, #self.fns do self.fns[i](ev, ...) end
    end)
    unitFrames[event] = f
  end
  f.fns[#f.fns + 1] = fn
  return true
end

---------------------------------------------------------------------------
-- Internal messages (between our own modules)
---------------------------------------------------------------------------
local listeners = {}
function ns.Listen(message, fn)
  local list = listeners[message]
  if not list then list = {}; listeners[message] = list end
  list[#list + 1] = fn
end

function ns.Fire(message, ...)
  local list = listeners[message]
  if list then
    for i = 1, #list do list[i](...) end
  end
end

---------------------------------------------------------------------------
-- Lifecycle: OnInit runs when our SavedVariables are available,
-- OnLogin when the player is in the world.
---------------------------------------------------------------------------
local initFns, loginFns = {}, {}
local initDone, loginDone = false, false

function ns.OnInit(fn)
  if initDone then fn() else initFns[#initFns + 1] = fn end
end

function ns.OnLogin(fn)
  if loginDone then fn() else loginFns[#loginFns + 1] = fn end
end

ns.On("ADDON_LOADED", function(_, loaded)
  if loaded ~= addonName or initDone then return end
  initDone = true
  for i = 1, #initFns do initFns[i]() end
end)

ns.On("PLAYER_LOGIN", function()
  if loginDone then return end
  loginDone = true
  for i = 1, #loginFns do loginFns[i]() end
end)

---------------------------------------------------------------------------
-- Logging
---------------------------------------------------------------------------
local function join(...)
  local parts = {}
  for i = 1, select("#", ...) do parts[#parts + 1] = tostring((select(i, ...))) end
  return table.concat(parts, " ")
end

function ns.Print(...)
  ns.Compat.Print(ns.L.PREFIX .. " " .. join(...))
end

function ns.IsDev()
  return ns.db ~= nil and ns.db.settings ~= nil and ns.db.settings.dev == true
end

-- Runs fn(...) and catches any error, so a bug in RPG Dialogue never leaves you stuck.
-- The error is shown in chat (once per session per message, even with Lua errors hidden),
-- kept in account data for the flag report, then onError() puts the game's own window back.
local reported = {}
function ns.Guard(where, fn, onError, ...)
  local results = { pcall(fn, ...) }
  if results[1] then return unpack(results, 2, table.maxn(results)) end
  local err = tostring(results[2])
  if not reported[err] then
    reported[err] = true
    ns.Print((ns.L.ERROR_CAUGHT or "Something went wrong (%s): %s"):format(where, err))
    if ns.db and ns.db.debug then
      local log = ns.db.debug
      log[#log + 1] = "ERROR " .. where .. ": " .. err
      if #log > 300 then table.remove(log, 1) end
    end
  end
  if onError then pcall(onError) end
  return nil
end

-- Dev-only messages. Also kept in a small ring buffer in account data.
function ns.Debug(...)
  if not ns.IsDev() then return end
  local msg = join(...)
  ns.Compat.Print("|cff8888ffRPGD|r " .. msg)
  local log = ns.db.debug
  log[#log + 1] = msg
  if #log > 300 then table.remove(log, 1) end
end
